import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDataRecord extends FirestoreRecord {
  UserDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_data');

  static Stream<UserDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserDataRecord.fromSnapshot(s));

  static Future<UserDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserDataRecord.fromSnapshot(s));

  static UserDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;

  @override
  Map<String, DebugDataField> toDebugSerializableMap() => {
        'reference': debugSerializeParam(
          reference,
          ParamType.DocumentReference,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=database',
          name: '',
          nullable: false,
        ),
        'email': debugSerializeParam(
          email,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=database',
          name: 'String',
          nullable: false,
        ),
        'display_name': debugSerializeParam(
          displayName,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=database',
          name: 'String',
          nullable: false,
        ),
        'photo_url': debugSerializeParam(
          photoUrl,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=database',
          name: 'String',
          nullable: false,
        ),
        'uid': debugSerializeParam(
          uid,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=database',
          name: 'String',
          nullable: false,
        ),
        'created_time': debugSerializeParam(
          createdTime,
          ParamType.DateTime,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=database',
          name: 'DateTime',
          nullable: true,
        ),
        'phone_number': debugSerializeParam(
          phoneNumber,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=database',
          name: 'String',
          nullable: false,
        )
      };
}

Map<String, dynamic> createUserDataRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserDataRecordDocumentEquality implements Equality<UserDataRecord> {
  const UserDataRecordDocumentEquality();

  @override
  bool equals(UserDataRecord? e1, UserDataRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(UserDataRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is UserDataRecord;
}
