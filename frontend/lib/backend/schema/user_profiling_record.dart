import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProfilingRecord extends FirestoreRecord {
  UserProfilingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "userInfo" field.
  ProfileInfoStruct? _userInfo;
  ProfileInfoStruct get userInfo => _userInfo ?? ProfileInfoStruct();
  bool hasUserInfo() => _userInfo != null;

  // "chronicDiseases" field.
  ChronicDiseasesStruct? _chronicDiseases;
  ChronicDiseasesStruct get chronicDiseases =>
      _chronicDiseases ?? ChronicDiseasesStruct();
  bool hasChronicDiseases() => _chronicDiseases != null;

  // "allergens" field.
  AllergiesStruct? _allergens;
  AllergiesStruct get allergens => _allergens ?? AllergiesStruct();
  bool hasAllergens() => _allergens != null;

  // "dietaryRestrictions" field.
  DietaryRestrictionStruct? _dietaryRestrictions;
  DietaryRestrictionStruct get dietaryRestrictions =>
      _dietaryRestrictions ?? DietaryRestrictionStruct();
  bool hasDietaryRestrictions() => _dietaryRestrictions != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _userInfo = ProfileInfoStruct.maybeFromMap(snapshotData['userInfo']);
    _chronicDiseases =
        ChronicDiseasesStruct.maybeFromMap(snapshotData['chronicDiseases']);
    _allergens = AllergiesStruct.maybeFromMap(snapshotData['allergens']);
    _dietaryRestrictions = DietaryRestrictionStruct.maybeFromMap(
        snapshotData['dietaryRestrictions']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_profiling');

  static Stream<UserProfilingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserProfilingRecord.fromSnapshot(s));

  static Future<UserProfilingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserProfilingRecord.fromSnapshot(s));

  static UserProfilingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserProfilingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserProfilingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserProfilingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserProfilingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserProfilingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserProfilingRecordData({
  DocumentReference? user,
  ProfileInfoStruct? userInfo,
  ChronicDiseasesStruct? chronicDiseases,
  AllergiesStruct? allergens,
  DietaryRestrictionStruct? dietaryRestrictions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'userInfo': ProfileInfoStruct().toMap(),
      'chronicDiseases': ChronicDiseasesStruct().toMap(),
      'allergens': AllergiesStruct().toMap(),
      'dietaryRestrictions': DietaryRestrictionStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "userInfo" field.
  addProfileInfoStructData(firestoreData, userInfo, 'userInfo');

  // Handle nested data for "chronicDiseases" field.
  addChronicDiseasesStructData(
      firestoreData, chronicDiseases, 'chronicDiseases');

  // Handle nested data for "allergens" field.
  addAllergiesStructData(firestoreData, allergens, 'allergens');

  // Handle nested data for "dietaryRestrictions" field.
  addDietaryRestrictionStructData(
      firestoreData, dietaryRestrictions, 'dietaryRestrictions');

  return firestoreData;
}

class UserProfilingRecordDocumentEquality
    implements Equality<UserProfilingRecord> {
  const UserProfilingRecordDocumentEquality();

  @override
  bool equals(UserProfilingRecord? e1, UserProfilingRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.userInfo == e2?.userInfo &&
        e1?.chronicDiseases == e2?.chronicDiseases &&
        e1?.allergens == e2?.allergens &&
        e1?.dietaryRestrictions == e2?.dietaryRestrictions;
  }

  @override
  int hash(UserProfilingRecord? e) => const ListEquality().hash([
        e?.user,
        e?.userInfo,
        e?.chronicDiseases,
        e?.allergens,
        e?.dietaryRestrictions
      ]);

  @override
  bool isValidKey(Object? o) => o is UserProfilingRecord;
}
