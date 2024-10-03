import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserSubmissionsRecord extends FirestoreRecord {
  UserSubmissionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "ingredients" field.
  List<String>? _ingredients;
  List<String> get ingredients => _ingredients ?? const [];
  bool hasIngredients() => _ingredients != null;

  // "allergy_information" field.
  List<String>? _allergyInformation;
  List<String> get allergyInformation => _allergyInformation ?? const [];
  bool hasAllergyInformation() => _allergyInformation != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
    _ingredients = getDataList(snapshotData['ingredients']);
    _allergyInformation = getDataList(snapshotData['allergy_information']);
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_submissions');

  static Stream<UserSubmissionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserSubmissionsRecord.fromSnapshot(s));

  static Future<UserSubmissionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserSubmissionsRecord.fromSnapshot(s));

  static UserSubmissionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserSubmissionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserSubmissionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserSubmissionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserSubmissionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserSubmissionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserSubmissionsRecordData({
  String? name,
  String? imageUrl,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image_url': imageUrl,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserSubmissionsRecordDocumentEquality
    implements Equality<UserSubmissionsRecord> {
  const UserSubmissionsRecordDocumentEquality();

  @override
  bool equals(UserSubmissionsRecord? e1, UserSubmissionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.imageUrl == e2?.imageUrl &&
        listEquality.equals(e1?.ingredients, e2?.ingredients) &&
        listEquality.equals(e1?.allergyInformation, e2?.allergyInformation) &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(UserSubmissionsRecord? e) => const ListEquality().hash(
      [e?.name, e?.imageUrl, e?.ingredients, e?.allergyInformation, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is UserSubmissionsRecord;
}
