import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserHealthPointsRecord extends FirestoreRecord {
  UserHealthPointsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "current_hp" field.
  int? _currentHp;
  int get currentHp => _currentHp ?? 0;
  bool hasCurrentHp() => _currentHp != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _currentHp = castToType<int>(snapshotData['current_hp']);
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user-health-points');

  static Stream<UserHealthPointsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserHealthPointsRecord.fromSnapshot(s));

  static Future<UserHealthPointsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserHealthPointsRecord.fromSnapshot(s));

  static UserHealthPointsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserHealthPointsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserHealthPointsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserHealthPointsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserHealthPointsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserHealthPointsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserHealthPointsRecordData({
  int? currentHp,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'current_hp': currentHp,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserHealthPointsRecordDocumentEquality
    implements Equality<UserHealthPointsRecord> {
  const UserHealthPointsRecordDocumentEquality();

  @override
  bool equals(UserHealthPointsRecord? e1, UserHealthPointsRecord? e2) {
    return e1?.currentHp == e2?.currentHp && e1?.user == e2?.user;
  }

  @override
  int hash(UserHealthPointsRecord? e) =>
      const ListEquality().hash([e?.currentHp, e?.user]);

  @override
  bool isValidKey(Object? o) => o is UserHealthPointsRecord;
}
