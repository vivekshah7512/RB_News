// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDataStruct extends FFFirebaseStruct {
  UserDataStruct({
    int? userId,
    String? jwtTokenString,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userId = userId,
        _jwtTokenString = jwtTokenString,
        super(firestoreUtilData);

  // "userId" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) {
    _userId = val;
    debugLog();
  }

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  // "jwtTokenString" field.
  String? _jwtTokenString;
  String get jwtTokenString => _jwtTokenString ?? '';
  set jwtTokenString(String? val) {
    _jwtTokenString = val;
    debugLog();
  }

  bool hasJwtTokenString() => _jwtTokenString != null;

  static UserDataStruct fromMap(Map<String, dynamic> data) => UserDataStruct(
        userId: castToType<int>(data['userId']),
        jwtTokenString: data['jwtTokenString'] as String?,
      );

  static UserDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'userId': _userId,
        'jwtTokenString': _jwtTokenString,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userId': serializeParam(
          _userId,
          ParamType.int,
        ),
        'jwtTokenString': serializeParam(
          _jwtTokenString,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDataStruct(
        userId: deserializeParam(
          data['userId'],
          ParamType.int,
          false,
        ),
        jwtTokenString: deserializeParam(
          data['jwtTokenString'],
          ParamType.String,
          false,
        ),
      );
  @override
  Map<String, DebugDataField> toDebugSerializableMap() => {
        'userId': debugSerializeParam(
          userId,
          ParamType.int,
          name: 'int',
          nullable: false,
        ),
        'jwtTokenString': debugSerializeParam(
          jwtTokenString,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
      };

  @override
  String toString() => 'UserDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDataStruct &&
        userId == other.userId &&
        jwtTokenString == other.jwtTokenString;
  }

  @override
  int get hashCode => const ListEquality().hash([userId, jwtTokenString]);
}

UserDataStruct createUserDataStruct({
  int? userId,
  String? jwtTokenString,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserDataStruct(
      userId: userId,
      jwtTokenString: jwtTokenString,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserDataStruct? updateUserDataStruct(
  UserDataStruct? userData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserDataStructData(
  Map<String, dynamic> firestoreData,
  UserDataStruct? userData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userData == null) {
    return;
  }
  if (userData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userDataData = getUserDataFirestoreData(userData, forFieldValue);
  final nestedData = userDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserDataFirestoreData(
  UserDataStruct? userData, [
  bool forFieldValue = false,
]) {
  if (userData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userData.toMap());

  // Add any Firestore field values
  userData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserDataListFirestoreData(
  List<UserDataStruct>? userDatas,
) =>
    userDatas?.map((e) => getUserDataFirestoreData(e, true)).toList() ?? [];
