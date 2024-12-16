// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDataStruct extends BaseStruct {
  UserDataStruct({
    int? userId,
    String? jwtTokenString,
  })  : _userId = userId,
        _jwtTokenString = jwtTokenString;

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
}) =>
    UserDataStruct(
      userId: userId,
      jwtTokenString: jwtTokenString,
    );
