import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ImageScanAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    FFUploadedFile? image,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'imageScanAPI',
      apiUrl:
          'https://consumewise-ai-backend-583144752239.asia-south1.run.app/label_extraction_service',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BarScanAPICall {
  static Future<ApiCallResponse> call({
    String? identifierValue = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'barScanAPI',
      apiUrl:
          'https://consumewise-ai-backend-583144752239.asia-south1.run.app/get-product-details',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'identifier_type': "code",
        'identifier_value': identifierValue,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? carbval(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product_details.carbohydrates_value''',
      ));
  static String? cardunit(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product_details.carbohydrates_unit''',
      ));
  static String? energyval(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product_details.energy_value''',
      ));
  static String? prodimage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product_details.image_url''',
      ));
  static String? proteinval(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.product_details.proteins_value''',
      ));
  static String? proteinunit(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.product_details.proteins_unit''',
      ));
  static String? sugarval(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product_details.sugars_value''',
      ));
  static String? sugarunit(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product_details.sugars_unit''',
      ));
  static String? fatval(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product_details.fat_value''',
      ));
  static String? fatunit(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product_details.fat_unit''',
      ));
  static String? fiberval(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product_details.fiber_value''',
      ));
  static String? fiberunit(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product_details.fiber_unit''',
      ));
  static String? energyunit(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.product_details.energy_unit''',
      ));
  static String? sodiumval(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product_details.sodium_value''',
      ));
  static String? sodiumunit(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.product_details.sodium_unit''',
      ));
  static String? size(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product_details.serving_size''',
      ));
  static String? saltunit(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product_details.salt_unit''',
      ));
  static String? saltval(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product_details.salt_value''',
      ));
  static String? proddetails(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.product_details.product_name_en''',
      ));
}

class TextSearchAPICall {
  static Future<ApiCallResponse> call({
    String? search = '',
    String? token = '',
    int? page = 1,
    int? limit = 10,
    String? nutriscoreGrade = 'a,b,c,d,e',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'textSearchAPI',
      apiUrl:
          'https://consumewise-ai-backend-583144752239.asia-south1.run.app/search-product',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'search': search,
        'page': page,
        'limit': limit,
        'nutriscore_grade': nutriscoreGrade,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
