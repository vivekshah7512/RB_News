// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelectedNewsCategoryDataStruct extends BaseStruct {
  SelectedNewsCategoryDataStruct({
    int? id,
    String? name,
  })  : _id = id,
        _name = name;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) {
    _id = val;
    debugLog();
  }

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) {
    _name = val;
    debugLog();
  }

  bool hasName() => _name != null;

  static SelectedNewsCategoryDataStruct fromMap(Map<String, dynamic> data) =>
      SelectedNewsCategoryDataStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
      );

  static SelectedNewsCategoryDataStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? SelectedNewsCategoryDataStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static SelectedNewsCategoryDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SelectedNewsCategoryDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );
  @override
  Map<String, DebugDataField> toDebugSerializableMap() => {
        'id': debugSerializeParam(
          id,
          ParamType.int,
          name: 'int',
          nullable: false,
        ),
        'name': debugSerializeParam(
          name,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
      };

  @override
  String toString() => 'SelectedNewsCategoryDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SelectedNewsCategoryDataStruct &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

SelectedNewsCategoryDataStruct createSelectedNewsCategoryDataStruct({
  int? id,
  String? name,
}) =>
    SelectedNewsCategoryDataStruct(
      id: id,
      name: name,
    );
