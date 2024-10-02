import base64
import os
from google.cloud import storage
from flask import Flask, request, jsonify
from datetime import timedelta, datetime
from google.oauth2 import service_account
from werkzeug.utils import secure_filename
import firebase_admin
from firebase_admin import auth
from typing import Optional, Dict, Any
import openai
from langchain_community.llms import OpenAI
from langchain_openai import ChatOpenAI
from langchain.prompts import PromptTemplate
from langchain.output_parsers import PydanticOutputParser
from pydantic import BaseModel, Field
from google.cloud import firestore
from langchain_community.embeddings import OpenAIEmbeddings
from pymongo import MongoClient
from bson import ObjectId
import functions_framework

app = Flask(__name__)

# Fetch credentials from environment variables
GOOGLE_PROJECT_ID = os.getenv('GOOGLE_PROJECT_ID')
GOOGLE_PROJECT_ID_ACTUAL = os.getenv('GOOGLE_PROJECT_ID_ACTUAL')
BUCKET_NAME = os.getenv('BUCKET_NAME')
SUBFOLDER = os.getenv('SUBFOLDER')

# Firebase credentials
FIREBASE_CREDENTIALS_PATH = os.getenv('FIREBASE_CREDENTIALS_PATH')

if not firebase_admin._apps:
    cred = firebase_admin.credentials.Certificate(FIREBASE_CREDENTIALS_PATH)
    firebase_admin.initialize_app(cred)

# OpenAI API Key
OPENAI_API_KEY = os.getenv('OPENAI_API_KEY')

# MongoDB credentials
MONGO_URI = os.getenv('MONGO_URI')
MONGO_DB_NAME = os.getenv('MONGO_DB_NAME')
MONGO_COLLECTION_NAME = os.getenv('MONGO_COLLECTION_NAME')

# Google Service Account info
GOOGLE_SERVICE_ACCOUNT_INFO = {
    "type": "service_account",
    "project_id": os.getenv('GCP_PROJECT_ID'),
    "private_key_id": os.getenv('GCP_PRIVATE_KEY_ID'),
    "private_key": os.getenv('GCP_PRIVATE_KEY').replace('\\n', '\n'),
    "client_email": os.getenv('GCP_CLIENT_EMAIL'),
    "client_id": os.getenv('GCP_CLIENT_ID'),
    "auth_uri": os.getenv('GCP_AUTH_URI'),
    "token_uri": os.getenv('GCP_TOKEN_URI'),
    "auth_provider_x509_cert_url": os.getenv('GCP_AUTH_PROVIDER_CERT_URL'),
    "client_x509_cert_url": os.getenv('GCP_CLIENT_CERT_URL'),
    "universe_domain": os.getenv('GCP_UNIVERSE_DOMAIN')
}

# Create credentials object for Google Cloud Storage and Firestore
credentials = service_account.Credentials.from_service_account_info(GOOGLE_SERVICE_ACCOUNT_INFO)
storage_client = storage.Client(credentials=credentials)

# Vector Database configuration for MongoDB
VECTOR_INDEX_NAME = os.getenv('VECTOR_INDEX_NAME')

# Define the expected JSON structure using Pydantic
class ProductLabel(BaseModel):
    food_label: bool = Field(description="true if the given image is a food label, false otherwise")
    product_name: Optional[str] = Field(description="The specific name of the product as labeled")
    generic_product_name: Optional[str] = Field(description="The general category or type of the product")
    brand: Optional[str] = Field(description="The name of the brand associated with the product")
    gross_weight_value: Optional[str] = Field(description="The total weight of the product including packaging")
    gross_weight_unit: Optional[str] = Field(description="The unit of measurement for the gross weight")
    net_weight_value: Optional[str] = Field(description="The weight of the product excluding packaging")
    net_weight_unit: Optional[str] = Field(description="The unit of measurement for the net weight")
    manufacturer_name: Optional[str] = Field(description="The name of the entity that produced the product")
    manufacturer_address: Optional[str] = Field(description="The physical address of the product's manufacturer")
    country_of_origin: Optional[str] = Field(description="The country where the product was manufactured")
    allergen_info: Optional[str] = Field(description="Information about potential allergens present in the product")
    item_ean: Optional[str] = Field(description="The European Article Number (EAN) assigned to the product.")
    item_upc: Optional[str] = Field(description="The Universal Product Code (UPC) assigned to the product.")
    fssai_licence_number: Optional[str] = Field(description="The FSSAI license number authorizing the product for sale in India.")
    serving_recommendation: Optional[str] = Field(description="Suggested serving size or usage instructions for the product.")
    veg_label: Optional[str] = Field(description="Indicator of whether the product is vegetarian or non-vegetarian. Will only have 3 values 'veg', 'non-veg','na' ")
    macro_energy_value: Optional[str] = Field(description="The amount of energy the product provides per serving.")
    macro_energy_unit: Optional[str] = Field(description=" The unit of measurement for the energy value (e.g., kcal).")
    
    energy_per_100g: Optional[str] = Field(description="The amount of energy the product provides for every 100g of serving.")
    energy_per_100g_unit: Optional[str] = Field(description=" The unit of measurement for the energy value (e.g., kcal).")
    saturated_fat_per_100g_value: Optional[str] = Field(description="The amount of fat in the product per serving.")
    saturated_fat__per_100g_unit: Optional[str] = Field(description="The unit of measurement for the fat content.")
    sugar_per_100g_value: Optional[str] = Field(description="The amount of fat in the product per serving.")
    sugar_per_100g_unit: Optional[str] = Field(description="The unit of measurement for the fat content.")
    fibre_content_per_100g_value: Optional[str] = Field(description="The amount of dietary fibre in the product per serving.")
    fibre_content_per_100g_unit: Optional[str] = Field(description="The unit of measurement for the fibre content.")
    protein_content_per_100g_value: Optional[str] = Field(description="The amount of dietary fibre in the product per serving.")
    protein_content_per_100g_unit: Optional[str] = Field(description="The unit of measurement for the fibre content.")
    sodium_content_per_100g_value: Optional[str] = Field(description="The amount of dietary fibre in the product per serving.")
    sodium_content_per_100g_unit: Optional[str] = Field(description="The unit of measurement for the fibre content.")
    vegetable_fruit_content_per_100g_value: Optional[str] = Field(description="The amount of dietary fibre in the product per serving.")
    vegetable_fruit_content_per_100g_unit: Optional[str] = Field(description="The unit of measurement for the fibre content.")
    macro_nutrition_protein_value: Optional[str] = Field(description="The amount of protein in the product per serving.")
    macro_nutrition_protein_unit: Optional[str] = Field(description="The unit of measurement for the protein content.")
    macro_nutrition_fat_value: Optional[str] = Field(description="The amount of fat in the product per serving.")
    macro_nutrition_fat_unit: Optional[str] = Field(description="The unit of measurement for the fat content.")
    macro_nutrition_fibre_value: Optional[str] = Field(description="The amount of dietary fibre in the product per serving.")
    macro_nutrition_fibre_unit: Optional[str] = Field(description="The unit of measurement for the fibre content.")
    macro_nutrition_sugar_value: Optional[str] = Field(description="The amount of sugar in the product per serving.")
    macro_nutrition_sugar_unit: Optional[str] = Field(description="The unit of measurement for the sugar content.")
    organic_certification: Optional[str] = Field(description="Certification indicating that the product is organically produced.")
    additive_information: Optional[str] = Field(description="Details of any additives used in the product.")
    storage_instruction: Optional[str] = Field(description="Guidelines for how to store the product.")
    gmo_labelling: Optional[str] = Field(description="Information on whether the product contains genetically modified organisms.")
    sustainability_label: Optional[str] = Field(description="Label indicating the product's sustainability credentials.")
    ingredients_list: Optional[str] = Field(description="A list of all ingredients contained in the product.")
    micro_nutrition_vitamin_content: Optional[str] = Field(description="The vitamin content of the product.")
    micro_nutrition_minerals_content: Optional[str] = Field(description="The mineral content of the product.")
    micro_nutrition_trace_content: Optional[str] = Field(description="The content of trace elements in the product.")
    marketing_claims: Optional[str] = Field(description="Promotional statements made about the product's benefits.")
    customer_care_phone: Optional[str] = Field(description="The phone number for customer service inquiries.")
    customer_care_email: Optional[str] = Field(description="The email address for customer service inquiries.")

    class Config:
        extra = "allow"  # Allows additional fields in the response
 
# Set up the parser using PydanticOutputParser
parser = PydanticOutputParser(pydantic_object=ProductLabel)

def generate_filename_with_timestamp(original_filename):
    secure_name = secure_filename(original_filename)
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    return f"{os.path.splitext(secure_name)[0]}_{timestamp}{os.path.splitext(secure_name)[1]}"

# Function to upload the image to Cloud Storage and return a signed URL
def upload_image_to_gcs(image_data, filename):
    bucket = storage_client.bucket(BUCKET_NAME)
    blob_path = f"{SUBFOLDER}/{filename}"
    blob = bucket.blob(blob_path)
    blob.upload_from_string(image_data, content_type='image/jpeg')
    signed_url = blob.generate_signed_url(expiration=timedelta(minutes=10))
    return signed_url

# Function to classify if the image is a food label using GPT-4o with LangChain
def extract_food_label(image_url):
    llm = ChatOpenAI(model="gpt-4o", temperature=0, openai_api_key=OPENAI_API_KEY)
    prompt_template = PromptTemplate(
        template="""
            Extract product label details from the image at the following URL and provide the data in JSON format. 
            {format_instructions}
            Image URL: {image_url}
        """,
        input_variables=["image_url"],
        partial_variables={"format_instructions": parser.get_format_instructions()},
    )
    prompt = prompt_template.format(image_url=image_url)
    response = llm.invoke(prompt)
    structured_output = parser.parse(response.content)
    return structured_output.model_dump() # Convert the Pydantic object to a dictionary

def encode_image_url(image_url):
    response = requests.get(image_url)
    return base64.b64encode(response.content).decode('utf-8')

def extract_food_label_refined(encoded_image):
    llm = ChatOpenAI(model="gpt-4o", temperature=0, openai_api_key=OPENAI_API_KEY)
    base64_image = encoded_image
    messages = [
        {
            "role": "system", 
            "content": """
            You are an assistant designed to extract detailed product label information. Please return the information in JSON format.
            """
        },
        {"role": "user", "content": [
            {"type": "text", "text": "Extract the product label details from this image and provide the information in JSON format."},
            {"type": "image_url", "image_url": {"url": f"data:image/png;base64,{base64_image}"}}
        ]}
    ]
    response = llm.invoke(messages)
    try: 
        structured_output = parser.parse(response.content)
        return structured_output.model_dump()
    except Exception as e:
        print(f"Encountered error while parsing: {e}")

def store_extracted_data(extraction_result, file_name):
    db = firestore.Client(credentials=credentials, project=GOOGLE_PROJECT_ID)
    try:
        extraction_result['file_name'] = file_name
        doc_ref = db.collection("user-transactions").add(extraction_result)
        return True
    except Exception as e:
        print(f"Error storing data in Firestore: {e}")
        return False

def form_embedding_text_for_extracted_data(label_extraction_result):
    def format_value(value):
        if isinstance(value, list):
            return ", ".join(str(v) for v in value)
        return value

    embedding_fields = []
    if label_extraction_result.get("product_name"):
        embedding_fields.append(f"Product Name: {format_value(label_extraction_result.get('product_name'))}")
    if label_extraction_result.get("brand"):
        embedding_fields.append(f"Brand: {format_value(label_extraction_result.get('brand'))}")
    embedding_text = "\n".join(embedding_fields)
    return embedding_text

def get_similar_products(label_extraction_result, n=10):
    embedding_text = form_embedding_text_for_extracted_data(label_extraction_result)
    try:
        openai_embeddings = OpenAIEmbeddings(model=VECTOR_INDEX_NAME, openai_api_key=OPENAI_API_KEY)
        embedding = openai_embeddings.embed_query(embedding_text)
    except Exception as e:
        print(f"Error generating embedding for the query: {e}")
        return []

    client = MongoClient(MONGO_URI)
    database = client[MONGO_DB_NAME]
    collection = database[MONGO_COLLECTION_NAME]
    pipeline = [
        {
            "$vectorSearch": {
                "index": VECTOR_INDEX_NAME,
                "queryVector": embedding,
                "path": "embedding",
                "exact": True,
                "limit": n
            }
        },
        {
            "$project": {
                "embedding": 0,
                "similarity_score": {"$meta": "vectorSearchScore"}
            }
        }
    ]
    try:
        results = list(collection.aggregate(pipeline))
        return results
    except Exception as e:
        print(f"Error during vector search in MongoDB: {e}")
        return []
    finally:
        client.close()

@app.route('/label_extraction_service', methods=['POST'])
def label_extraction_service():
    auth_header = request.headers.get('Authorization')
    if auth_header and auth_header.startswith('Bearer '):
        id_token = auth_header.split('Bearer ')[1]
    else:
        return jsonify({"error": "Unauthorized, missing or invalid token"}), 401

    if 'image' not in request.files:
        return jsonify({"error": "No image file found in the request"}), 400

    image_file = request.files['image']
    image_data = image_file.read()
    filename = generate_filename_with_timestamp(image_file.filename)

    try:
        decoded_token = auth.verify_id_token(id_token)
        user_id = decoded_token['uid']
        signed_url = upload_image_to_gcs(image_data, filename)
        encoded_image = base64.b64encode(image_data).decode('utf-8')
        label_extraction_result = extract_food_label_refined(encoded_image)

        if label_extraction_result.get('food_label', False):
            matching_products = get_similar_products(label_extraction_result, n=10)
            return jsonify({
                "image_signed_url": signed_url,
                "message": "This is a valid food label.",
                "extracted_data": label_extraction_result,
                "matching_products": matching_products
            }), 200
        else:
            return jsonify({
                "image_signed_url": signed_url,
                "message": "The image does not appear to be a food label. Please try again."
            }), 400
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8080)
