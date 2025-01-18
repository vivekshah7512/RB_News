// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelectedNewsCategoryDataStruct extends FFFirebaseStruct {
  SelectedNewsCategoryDataStruct({
    int? id,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        super(firestoreUtilData);

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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SelectedNewsCategoryDataStruct(
      id: id,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SelectedNewsCategoryDataStruct? updateSelectedNewsCategoryDataStruct(
  SelectedNewsCategoryDataStruct? selectedNewsCategoryData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    selectedNewsCategoryData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSelectedNewsCategoryDataStructData(
  Map<String, dynamic> firestoreData,
  SelectedNewsCategoryDataStruct? selectedNewsCategoryData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (selectedNewsCategoryData == null) {
    return;
  }
  if (selectedNewsCategoryData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      selectedNewsCategoryData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final selectedNewsCategoryDataData = getSelectedNewsCategoryDataFirestoreData(
      selectedNewsCategoryData, forFieldValue);
  final nestedData =
      selectedNewsCategoryDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      selectedNewsCategoryData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSelectedNewsCategoryDataFirestoreData(
  SelectedNewsCategoryDataStruct? selectedNewsCategoryData, [
  bool forFieldValue = false,
]) {
  if (selectedNewsCategoryData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(selectedNewsCategoryData.toMap());

  // Add any Firestore field values
  selectedNewsCategoryData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSelectedNewsCategoryDataListFirestoreData(
  List<SelectedNewsCategoryDataStruct>? selectedNewsCategoryDatas,
) =>
    selectedNewsCategoryDatas
        ?.map((e) => getSelectedNewsCategoryDataFirestoreData(e, true))
        .toList() ??
    [];
