// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DietaryRestrictionStruct extends FFFirebaseStruct {
  DietaryRestrictionStruct({
    bool? vegan,
    bool? nonveg,
    bool? veg,
    bool? keto,
    bool? paleo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _vegan = vegan,
        _nonveg = nonveg,
        _veg = veg,
        _keto = keto,
        _paleo = paleo,
        super(firestoreUtilData);

  // "vegan" field.
  bool? _vegan;
  bool get vegan => _vegan ?? false;
  set vegan(bool? val) => _vegan = val;

  bool hasVegan() => _vegan != null;

  // "nonveg" field.
  bool? _nonveg;
  bool get nonveg => _nonveg ?? false;
  set nonveg(bool? val) => _nonveg = val;

  bool hasNonveg() => _nonveg != null;

  // "veg" field.
  bool? _veg;
  bool get veg => _veg ?? false;
  set veg(bool? val) => _veg = val;

  bool hasVeg() => _veg != null;

  // "keto" field.
  bool? _keto;
  bool get keto => _keto ?? false;
  set keto(bool? val) => _keto = val;

  bool hasKeto() => _keto != null;

  // "paleo" field.
  bool? _paleo;
  bool get paleo => _paleo ?? false;
  set paleo(bool? val) => _paleo = val;

  bool hasPaleo() => _paleo != null;

  static DietaryRestrictionStruct fromMap(Map<String, dynamic> data) =>
      DietaryRestrictionStruct(
        vegan: data['vegan'] as bool?,
        nonveg: data['nonveg'] as bool?,
        veg: data['veg'] as bool?,
        keto: data['keto'] as bool?,
        paleo: data['paleo'] as bool?,
      );

  static DietaryRestrictionStruct? maybeFromMap(dynamic data) => data is Map
      ? DietaryRestrictionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'vegan': _vegan,
        'nonveg': _nonveg,
        'veg': _veg,
        'keto': _keto,
        'paleo': _paleo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vegan': serializeParam(
          _vegan,
          ParamType.bool,
        ),
        'nonveg': serializeParam(
          _nonveg,
          ParamType.bool,
        ),
        'veg': serializeParam(
          _veg,
          ParamType.bool,
        ),
        'keto': serializeParam(
          _keto,
          ParamType.bool,
        ),
        'paleo': serializeParam(
          _paleo,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DietaryRestrictionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DietaryRestrictionStruct(
        vegan: deserializeParam(
          data['vegan'],
          ParamType.bool,
          false,
        ),
        nonveg: deserializeParam(
          data['nonveg'],
          ParamType.bool,
          false,
        ),
        veg: deserializeParam(
          data['veg'],
          ParamType.bool,
          false,
        ),
        keto: deserializeParam(
          data['keto'],
          ParamType.bool,
          false,
        ),
        paleo: deserializeParam(
          data['paleo'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DietaryRestrictionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DietaryRestrictionStruct &&
        vegan == other.vegan &&
        nonveg == other.nonveg &&
        veg == other.veg &&
        keto == other.keto &&
        paleo == other.paleo;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([vegan, nonveg, veg, keto, paleo]);
}

DietaryRestrictionStruct createDietaryRestrictionStruct({
  bool? vegan,
  bool? nonveg,
  bool? veg,
  bool? keto,
  bool? paleo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DietaryRestrictionStruct(
      vegan: vegan,
      nonveg: nonveg,
      veg: veg,
      keto: keto,
      paleo: paleo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DietaryRestrictionStruct? updateDietaryRestrictionStruct(
  DietaryRestrictionStruct? dietaryRestriction, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dietaryRestriction
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDietaryRestrictionStructData(
  Map<String, dynamic> firestoreData,
  DietaryRestrictionStruct? dietaryRestriction,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dietaryRestriction == null) {
    return;
  }
  if (dietaryRestriction.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dietaryRestriction.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dietaryRestrictionData =
      getDietaryRestrictionFirestoreData(dietaryRestriction, forFieldValue);
  final nestedData =
      dietaryRestrictionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      dietaryRestriction.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDietaryRestrictionFirestoreData(
  DietaryRestrictionStruct? dietaryRestriction, [
  bool forFieldValue = false,
]) {
  if (dietaryRestriction == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dietaryRestriction.toMap());

  // Add any Firestore field values
  dietaryRestriction.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDietaryRestrictionListFirestoreData(
  List<DietaryRestrictionStruct>? dietaryRestrictions,
) =>
    dietaryRestrictions
        ?.map((e) => getDietaryRestrictionFirestoreData(e, true))
        .toList() ??
    [];
