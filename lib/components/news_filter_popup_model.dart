import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'news_filter_popup_widget.dart' show NewsFilterPopupWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewsFilterPopupModel extends FlutterFlowModel<NewsFilterPopupWidget> {
  ///  Local state fields for this component.

  String? _selectedCategoryIds;
  set selectedCategoryIds(String? value) {
    _selectedCategoryIds = value;
    debugLogWidgetClass(this);
  }

  String? get selectedCategoryIds => _selectedCategoryIds;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  late LoggableMap<dynamic, bool> _checkboxValueMap1 = LoggableMap({});
  set checkboxValueMap1(Map<dynamic, bool> value) {
    if (value != null) {
      _checkboxValueMap1 = LoggableMap(value);
    }

    debugLogWidgetClass(this);
  }

  Map<dynamic, bool> get checkboxValueMap1 =>
      _checkboxValueMap1?..logger = () => debugLogWidgetClass(this);

  List<dynamic> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Stores action output result for [Custom Action - selectedNewsCategories] action in Checkbox widget.
  String? _selectedCatIds;
  set selectedCatIds(String? value) {
    _selectedCatIds = value;
    debugLogWidgetClass(this);
  }

  String? get selectedCatIds => _selectedCatIds;

  // Stores action output result for [Custom Action - selectedNewsCategories] action in Checkbox widget.
  String? _selectedCatIdsCopy;
  set selectedCatIdsCopy(String? value) {
    _selectedCatIdsCopy = value;
    debugLogWidgetClass(this);
  }

  String? get selectedCatIdsCopy => _selectedCatIdsCopy;

  // State field(s) for Checkbox widget.
  late LoggableMap<dynamic, bool> _checkboxValueMap2 = LoggableMap({});
  set checkboxValueMap2(Map<dynamic, bool> value) {
    if (value != null) {
      _checkboxValueMap2 = LoggableMap(value);
    }

    debugLogWidgetClass(this);
  }

  Map<dynamic, bool> get checkboxValueMap2 =>
      _checkboxValueMap2?..logger = () => debugLogWidgetClass(this);

  List<dynamic> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  late LoggableMap<dynamic, bool> _checkboxValueMap3 = LoggableMap({});
  set checkboxValueMap3(Map<dynamic, bool> value) {
    if (value != null) {
      _checkboxValueMap3 = LoggableMap(value);
    }

    debugLogWidgetClass(this);
  }

  Map<dynamic, bool> get checkboxValueMap3 =>
      _checkboxValueMap3?..logger = () => debugLogWidgetClass(this);

  List<dynamic> get checkboxCheckedItems3 => checkboxValueMap3.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  late LoggableMap<dynamic, bool> _checkboxValueMap4 = LoggableMap({});
  set checkboxValueMap4(Map<dynamic, bool> value) {
    if (value != null) {
      _checkboxValueMap4 = LoggableMap(value);
    }

    debugLogWidgetClass(this);
  }

  Map<dynamic, bool> get checkboxValueMap4 =>
      _checkboxValueMap4?..logger = () => debugLogWidgetClass(this);

  List<dynamic> get checkboxCheckedItems4 => checkboxValueMap4.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  late LoggableMap<dynamic, bool> _checkboxValueMap5 = LoggableMap({});
  set checkboxValueMap5(Map<dynamic, bool> value) {
    if (value != null) {
      _checkboxValueMap5 = LoggableMap(value);
    }

    debugLogWidgetClass(this);
  }

  Map<dynamic, bool> get checkboxValueMap5 =>
      _checkboxValueMap5?..logger = () => debugLogWidgetClass(this);

  List<dynamic> get checkboxCheckedItems5 => checkboxValueMap5.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'selectedCategoryIds': debugSerializeParam(
            selectedCategoryIds,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
            searchReference:
                'reference=QigKHAoTc2VsZWN0ZWRDYXRlZ29yeUlkcxIFM3V3OGEqAhIAcgQIAyAAUABaE3NlbGVjdGVkQ2F0ZWdvcnlJZHNiD05ld3NGaWx0ZXJQb3B1cA==',
            name: 'String',
            nullable: true,
          )
        },
        widgetStates: {
          'checkboxCheckedItems1': debugSerializeParam(
            checkboxCheckedItems1,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
            name: 'dynamic',
            nullable: true,
          ),
          'checkboxCheckedItems2': debugSerializeParam(
            checkboxCheckedItems2,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
            name: 'dynamic',
            nullable: true,
          ),
          'checkboxCheckedItems3': debugSerializeParam(
            checkboxCheckedItems3,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
            name: 'dynamic',
            nullable: true,
          ),
          'checkboxCheckedItems4': debugSerializeParam(
            checkboxCheckedItems4,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
            name: 'dynamic',
            nullable: true,
          ),
          'checkboxCheckedItems5': debugSerializeParam(
            checkboxCheckedItems5,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
            name: 'dynamic',
            nullable: true,
          )
        },
        actionOutputs: {
          'selectedCatIds': debugSerializeParam(
            selectedCatIds,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
            name: 'String',
            nullable: true,
          ),
          'selectedCatIdsCopy': debugSerializeParam(
            selectedCatIdsCopy,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
            name: 'String',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=NewsFilterPopup',
        searchReference:
            'reference=Og9OZXdzRmlsdGVyUG9wdXBQAFoPTmV3c0ZpbHRlclBvcHVw',
        widgetClassName: 'NewsFilterPopup',
      );
}
