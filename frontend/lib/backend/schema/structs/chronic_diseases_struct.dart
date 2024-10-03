// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChronicDiseasesStruct extends FFFirebaseStruct {
  ChronicDiseasesStruct({
    bool? diabetes,
    bool? heart,
    bool? obesity,
    bool? digestive,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _diabetes = diabetes,
        _heart = heart,
        _obesity = obesity,
        _digestive = digestive,
        super(firestoreUtilData);

  // "diabetes" field.
  bool? _diabetes;
  bool get diabetes => _diabetes ?? false;
  set diabetes(bool? val) => _diabetes = val;

  bool hasDiabetes() => _diabetes != null;

  // "heart" field.
  bool? _heart;
  bool get heart => _heart ?? false;
  set heart(bool? val) => _heart = val;

  bool hasHeart() => _heart != null;

  // "obesity" field.
  bool? _obesity;
  bool get obesity => _obesity ?? false;
  set obesity(bool? val) => _obesity = val;

  bool hasObesity() => _obesity != null;

  // "digestive" field.
  bool? _digestive;
  bool get digestive => _digestive ?? false;
  set digestive(bool? val) => _digestive = val;

  bool hasDigestive() => _digestive != null;

  static ChronicDiseasesStruct fromMap(Map<String, dynamic> data) =>
      ChronicDiseasesStruct(
        diabetes: data['diabetes'] as bool?,
        heart: data['heart'] as bool?,
        obesity: data['obesity'] as bool?,
        digestive: data['digestive'] as bool?,
      );

  static ChronicDiseasesStruct? maybeFromMap(dynamic data) => data is Map
      ? ChronicDiseasesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'diabetes': _diabetes,
        'heart': _heart,
        'obesity': _obesity,
        'digestive': _digestive,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'diabetes': serializeParam(
          _diabetes,
          ParamType.bool,
        ),
        'heart': serializeParam(
          _heart,
          ParamType.bool,
        ),
        'obesity': serializeParam(
          _obesity,
          ParamType.bool,
        ),
        'digestive': serializeParam(
          _digestive,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ChronicDiseasesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChronicDiseasesStruct(
        diabetes: deserializeParam(
          data['diabetes'],
          ParamType.bool,
          false,
        ),
        heart: deserializeParam(
          data['heart'],
          ParamType.bool,
          false,
        ),
        obesity: deserializeParam(
          data['obesity'],
          ParamType.bool,
          false,
        ),
        digestive: deserializeParam(
          data['digestive'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ChronicDiseasesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChronicDiseasesStruct &&
        diabetes == other.diabetes &&
        heart == other.heart &&
        obesity == other.obesity &&
        digestive == other.digestive;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([diabetes, heart, obesity, digestive]);
}

ChronicDiseasesStruct createChronicDiseasesStruct({
  bool? diabetes,
  bool? heart,
  bool? obesity,
  bool? digestive,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChronicDiseasesStruct(
      diabetes: diabetes,
      heart: heart,
      obesity: obesity,
      digestive: digestive,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChronicDiseasesStruct? updateChronicDiseasesStruct(
  ChronicDiseasesStruct? chronicDiseases, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chronicDiseases
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChronicDiseasesStructData(
  Map<String, dynamic> firestoreData,
  ChronicDiseasesStruct? chronicDiseases,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chronicDiseases == null) {
    return;
  }
  if (chronicDiseases.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chronicDiseases.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chronicDiseasesData =
      getChronicDiseasesFirestoreData(chronicDiseases, forFieldValue);
  final nestedData =
      chronicDiseasesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chronicDiseases.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChronicDiseasesFirestoreData(
  ChronicDiseasesStruct? chronicDiseases, [
  bool forFieldValue = false,
]) {
  if (chronicDiseases == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chronicDiseases.toMap());

  // Add any Firestore field values
  chronicDiseases.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChronicDiseasesListFirestoreData(
  List<ChronicDiseasesStruct>? chronicDiseasess,
) =>
    chronicDiseasess
        ?.map((e) => getChronicDiseasesFirestoreData(e, true))
        .toList() ??
    [];
