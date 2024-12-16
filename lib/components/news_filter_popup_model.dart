import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'news_filter_popup_widget.dart' show NewsFilterPopupWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewsFilterPopupModel extends FlutterFlowModel<NewsFilterPopupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? _checkboxValue1;
  set checkboxValue1(bool? value) {
    _checkboxValue1 = value;
    debugLogWidgetClass(this);
  }

  bool? get checkboxValue1 => _checkboxValue1;

  // State field(s) for Checkbox widget.
  bool? _checkboxValue2;
  set checkboxValue2(bool? value) {
    _checkboxValue2 = value;
    debugLogWidgetClass(this);
  }

  bool? get checkboxValue2 => _checkboxValue2;

  // State field(s) for Checkbox widget.
  bool? _checkboxValue3;
  set checkboxValue3(bool? value) {
    _checkboxValue3 = value;
    debugLogWidgetClass(this);
  }

  bool? get checkboxValue3 => _checkboxValue3;

  // State field(s) for Checkbox widget.
  bool? _checkboxValue4;
  set checkboxValue4(bool? value) {
    _checkboxValue4 = value;
    debugLogWidgetClass(this);
  }

  bool? get checkboxValue4 => _checkboxValue4;

  // State field(s) for Checkbox widget.
  bool? _checkboxValue5;
  set checkboxValue5(bool? value) {
    _checkboxValue5 = value;
    debugLogWidgetClass(this);
  }

  bool? get checkboxValue5 => _checkboxValue5;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetStates: {
          'checkboxValue1': debugSerializeParam(
            checkboxValue1,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
            name: 'bool',
            nullable: true,
          ),
          'checkboxValue2': debugSerializeParam(
            checkboxValue2,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
            name: 'bool',
            nullable: true,
          ),
          'checkboxValue3': debugSerializeParam(
            checkboxValue3,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
            name: 'bool',
            nullable: true,
          ),
          'checkboxValue4': debugSerializeParam(
            checkboxValue4,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
            name: 'bool',
            nullable: true,
          ),
          'checkboxValue5': debugSerializeParam(
            checkboxValue5,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
            name: 'bool',
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
