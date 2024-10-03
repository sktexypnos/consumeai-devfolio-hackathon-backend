// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AllergiesStruct extends FFFirebaseStruct {
  AllergiesStruct({
    bool? gluten,
    bool? dairy,
    bool? treenuts,
    bool? eggs,
    bool? seafood,
    bool? peanuts,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _gluten = gluten,
        _dairy = dairy,
        _treenuts = treenuts,
        _eggs = eggs,
        _seafood = seafood,
        _peanuts = peanuts,
        super(firestoreUtilData);

  // "gluten" field.
  bool? _gluten;
  bool get gluten => _gluten ?? false;
  set gluten(bool? val) => _gluten = val;

  bool hasGluten() => _gluten != null;

  // "dairy" field.
  bool? _dairy;
  bool get dairy => _dairy ?? false;
  set dairy(bool? val) => _dairy = val;

  bool hasDairy() => _dairy != null;

  // "treenuts" field.
  bool? _treenuts;
  bool get treenuts => _treenuts ?? false;
  set treenuts(bool? val) => _treenuts = val;

  bool hasTreenuts() => _treenuts != null;

  // "eggs" field.
  bool? _eggs;
  bool get eggs => _eggs ?? false;
  set eggs(bool? val) => _eggs = val;

  bool hasEggs() => _eggs != null;

  // "seafood" field.
  bool? _seafood;
  bool get seafood => _seafood ?? false;
  set seafood(bool? val) => _seafood = val;

  bool hasSeafood() => _seafood != null;

  // "peanuts" field.
  bool? _peanuts;
  bool get peanuts => _peanuts ?? false;
  set peanuts(bool? val) => _peanuts = val;

  bool hasPeanuts() => _peanuts != null;

  static AllergiesStruct fromMap(Map<String, dynamic> data) => AllergiesStruct(
        gluten: data['gluten'] as bool?,
        dairy: data['dairy'] as bool?,
        treenuts: data['treenuts'] as bool?,
        eggs: data['eggs'] as bool?,
        seafood: data['seafood'] as bool?,
        peanuts: data['peanuts'] as bool?,
      );

  static AllergiesStruct? maybeFromMap(dynamic data) => data is Map
      ? AllergiesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'gluten': _gluten,
        'dairy': _dairy,
        'treenuts': _treenuts,
        'eggs': _eggs,
        'seafood': _seafood,
        'peanuts': _peanuts,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'gluten': serializeParam(
          _gluten,
          ParamType.bool,
        ),
        'dairy': serializeParam(
          _dairy,
          ParamType.bool,
        ),
        'treenuts': serializeParam(
          _treenuts,
          ParamType.bool,
        ),
        'eggs': serializeParam(
          _eggs,
          ParamType.bool,
        ),
        'seafood': serializeParam(
          _seafood,
          ParamType.bool,
        ),
        'peanuts': serializeParam(
          _peanuts,
          ParamType.bool,
        ),
      }.withoutNulls;

  static AllergiesStruct fromSerializableMap(Map<String, dynamic> data) =>
      AllergiesStruct(
        gluten: deserializeParam(
          data['gluten'],
          ParamType.bool,
          false,
        ),
        dairy: deserializeParam(
          data['dairy'],
          ParamType.bool,
          false,
        ),
        treenuts: deserializeParam(
          data['treenuts'],
          ParamType.bool,
          false,
        ),
        eggs: deserializeParam(
          data['eggs'],
          ParamType.bool,
          false,
        ),
        seafood: deserializeParam(
          data['seafood'],
          ParamType.bool,
          false,
        ),
        peanuts: deserializeParam(
          data['peanuts'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'AllergiesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AllergiesStruct &&
        gluten == other.gluten &&
        dairy == other.dairy &&
        treenuts == other.treenuts &&
        eggs == other.eggs &&
        seafood == other.seafood &&
        peanuts == other.peanuts;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([gluten, dairy, treenuts, eggs, seafood, peanuts]);
}

AllergiesStruct createAllergiesStruct({
  bool? gluten,
  bool? dairy,
  bool? treenuts,
  bool? eggs,
  bool? seafood,
  bool? peanuts,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AllergiesStruct(
      gluten: gluten,
      dairy: dairy,
      treenuts: treenuts,
      eggs: eggs,
      seafood: seafood,
      peanuts: peanuts,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AllergiesStruct? updateAllergiesStruct(
  AllergiesStruct? allergies, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    allergies
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAllergiesStructData(
  Map<String, dynamic> firestoreData,
  AllergiesStruct? allergies,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (allergies == null) {
    return;
  }
  if (allergies.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && allergies.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final allergiesData = getAllergiesFirestoreData(allergies, forFieldValue);
  final nestedData = allergiesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = allergies.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAllergiesFirestoreData(
  AllergiesStruct? allergies, [
  bool forFieldValue = false,
]) {
  if (allergies == null) {
    return {};
  }
  final firestoreData = mapToFirestore(allergies.toMap());

  // Add any Firestore field values
  allergies.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAllergiesListFirestoreData(
  List<AllergiesStruct>? allergiess,
) =>
    allergiess?.map((e) => getAllergiesFirestoreData(e, true)).toList() ?? [];
