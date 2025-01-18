// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRootStruct extends FFFirebaseStruct {
  UserRootStruct({
    String? jwtTokenString,
    bool? isSuccessfull,
    int? statusCode,
    String? statusMessage,
    String? message,
    List<UserDataStruct>? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _jwtTokenString = jwtTokenString,
        _isSuccessfull = isSuccessfull,
        _statusCode = statusCode,
        _statusMessage = statusMessage,
        _message = message,
        _data = data != null ? LoggableList(data) : null,
        super(firestoreUtilData);

  // "jwtTokenString" field.
  String? _jwtTokenString;
  String get jwtTokenString => _jwtTokenString ?? '';
  set jwtTokenString(String? val) {
    _jwtTokenString = val;
    debugLog();
  }

  bool hasJwtTokenString() => _jwtTokenString != null;

  // "isSuccessfull" field.
  bool? _isSuccessfull;
  bool get isSuccessfull => _isSuccessfull ?? false;
  set isSuccessfull(bool? val) {
    _isSuccessfull = val;
    debugLog();
  }

  bool hasIsSuccessfull() => _isSuccessfull != null;

  // "statusCode" field.
  int? _statusCode;
  int get statusCode => _statusCode ?? 0;
  set statusCode(int? val) {
    _statusCode = val;
    debugLog();
  }

  void incrementStatusCode(int amount) => statusCode = statusCode + amount;

  bool hasStatusCode() => _statusCode != null;

  // "statusMessage" field.
  String? _statusMessage;
  String get statusMessage => _statusMessage ?? '';
  set statusMessage(String? val) {
    _statusMessage = val;
    debugLog();
  }

  bool hasStatusMessage() => _statusMessage != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) {
    _message = val;
    debugLog();
  }

  bool hasMessage() => _message != null;

  // "data" field.
  LoggableList<UserDataStruct>? _data;
  List<UserDataStruct> get data =>
      (_data ?? LoggableList(const []))..logger = logger;
  set data(List<UserDataStruct>? val) {
    if (val != null) {
      _data = LoggableList(val);
    } else {
      _data = null;
    }
    debugLog();
  }

  void updateData(Function(List<UserDataStruct>) updateFn) {
    updateFn(_data ??= LoggableList([]));
    debugLog();
  }

  bool hasData() => _data != null;

  static UserRootStruct fromMap(Map<String, dynamic> data) => UserRootStruct(
        jwtTokenString: data['jwtTokenString'] as String?,
        isSuccessfull: data['isSuccessfull'] as bool?,
        statusCode: castToType<int>(data['statusCode']),
        statusMessage: data['statusMessage'] as String?,
        message: data['message'] as String?,
        data: getStructList(
          data['data'],
          UserDataStruct.fromMap,
        ),
      );

  static UserRootStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserRootStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'jwtTokenString': _jwtTokenString,
        'isSuccessfull': _isSuccessfull,
        'statusCode': _statusCode,
        'statusMessage': _statusMessage,
        'message': _message,
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'jwtTokenString': serializeParam(
          _jwtTokenString,
          ParamType.String,
        ),
        'isSuccessfull': serializeParam(
          _isSuccessfull,
          ParamType.bool,
        ),
        'statusCode': serializeParam(
          _statusCode,
          ParamType.int,
        ),
        'statusMessage': serializeParam(
          _statusMessage,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static UserRootStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserRootStruct(
        jwtTokenString: deserializeParam(
          data['jwtTokenString'],
          ParamType.String,
          false,
        ),
        isSuccessfull: deserializeParam(
          data['isSuccessfull'],
          ParamType.bool,
          false,
        ),
        statusCode: deserializeParam(
          data['statusCode'],
          ParamType.int,
          false,
        ),
        statusMessage: deserializeParam(
          data['statusMessage'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        data: deserializeStructParam<UserDataStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: UserDataStruct.fromSerializableMap,
        ),
      );
  @override
  Map<String, DebugDataField> toDebugSerializableMap() => {
        'jwtTokenString': debugSerializeParam(
          jwtTokenString,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'isSuccessfull': debugSerializeParam(
          isSuccessfull,
          ParamType.bool,
          name: 'bool',
          nullable: false,
        ),
        'statusCode': debugSerializeParam(
          statusCode,
          ParamType.int,
          name: 'int',
          nullable: false,
        ),
        'statusMessage': debugSerializeParam(
          statusMessage,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'message': debugSerializeParam(
          message,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'data': debugSerializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
          name: 'UserData',
          nullable: false,
        ),
      };

  @override
  String toString() => 'UserRootStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserRootStruct &&
        jwtTokenString == other.jwtTokenString &&
        isSuccessfull == other.isSuccessfull &&
        statusCode == other.statusCode &&
        statusMessage == other.statusMessage &&
        message == other.message &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([
        jwtTokenString,
        isSuccessfull,
        statusCode,
        statusMessage,
        message,
        data
      ]);
}

UserRootStruct createUserRootStruct({
  String? jwtTokenString,
  bool? isSuccessfull,
  int? statusCode,
  String? statusMessage,
  String? message,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserRootStruct(
      jwtTokenString: jwtTokenString,
      isSuccessfull: isSuccessfull,
      statusCode: statusCode,
      statusMessage: statusMessage,
      message: message,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserRootStruct? updateUserRootStruct(
  UserRootStruct? userRoot, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userRoot
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserRootStructData(
  Map<String, dynamic> firestoreData,
  UserRootStruct? userRoot,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userRoot == null) {
    return;
  }
  if (userRoot.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userRoot.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userRootData = getUserRootFirestoreData(userRoot, forFieldValue);
  final nestedData = userRootData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userRoot.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserRootFirestoreData(
  UserRootStruct? userRoot, [
  bool forFieldValue = false,
]) {
  if (userRoot == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userRoot.toMap());

  // Add any Firestore field values
  userRoot.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserRootListFirestoreData(
  List<UserRootStruct>? userRoots,
) =>
    userRoots?.map((e) => getUserRootFirestoreData(e, true)).toList() ?? [];
