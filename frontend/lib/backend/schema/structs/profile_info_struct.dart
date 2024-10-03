// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProfileInfoStruct extends FFFirebaseStruct {
  ProfileInfoStruct({
    String? name,
    double? age,
    String? goals,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _age = age,
        _goals = goals,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "age" field.
  double? _age;
  double get age => _age ?? 0.0;
  set age(double? val) => _age = val;

  void incrementAge(double amount) => age = age + amount;

  bool hasAge() => _age != null;

  // "goals" field.
  String? _goals;
  String get goals => _goals ?? '';
  set goals(String? val) => _goals = val;

  bool hasGoals() => _goals != null;

  static ProfileInfoStruct fromMap(Map<String, dynamic> data) =>
      ProfileInfoStruct(
        name: data['name'] as String?,
        age: castToType<double>(data['age']),
        goals: data['goals'] as String?,
      );

  static ProfileInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ProfileInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'age': _age,
        'goals': _goals,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.double,
        ),
        'goals': serializeParam(
          _goals,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProfileInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfileInfoStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.double,
          false,
        ),
        goals: deserializeParam(
          data['goals'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProfileInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfileInfoStruct &&
        name == other.name &&
        age == other.age &&
        goals == other.goals;
  }

  @override
  int get hashCode => const ListEquality().hash([name, age, goals]);
}

ProfileInfoStruct createProfileInfoStruct({
  String? name,
  double? age,
  String? goals,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProfileInfoStruct(
      name: name,
      age: age,
      goals: goals,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProfileInfoStruct? updateProfileInfoStruct(
  ProfileInfoStruct? profileInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    profileInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProfileInfoStructData(
  Map<String, dynamic> firestoreData,
  ProfileInfoStruct? profileInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (profileInfo == null) {
    return;
  }
  if (profileInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && profileInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final profileInfoData =
      getProfileInfoFirestoreData(profileInfo, forFieldValue);
  final nestedData =
      profileInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = profileInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProfileInfoFirestoreData(
  ProfileInfoStruct? profileInfo, [
  bool forFieldValue = false,
]) {
  if (profileInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(profileInfo.toMap());

  // Add any Firestore field values
  profileInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProfileInfoListFirestoreData(
  List<ProfileInfoStruct>? profileInfos,
) =>
    profileInfos?.map((e) => getProfileInfoFirestoreData(e, true)).toList() ??
    [];
