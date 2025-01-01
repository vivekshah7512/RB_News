import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'horoscope_page_widget.dart' show HoroscopePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HoroscopePageModel extends FlutterFlowModel<HoroscopePageWidget> {
  ///  Local state fields for this page.

  int _currentIndex = 3;
  set currentIndex(int value) {
    _currentIndex = value;
    debugLogWidgetClass(this);
  }

  int get currentIndex => _currentIndex;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'currentIndex': debugSerializeParam(
            currentIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HoroscopePage',
            searchReference:
                'reference=Qh0KFQoMY3VycmVudEluZGV4EgUwdjJ5MnIECAEgAVABWgxjdXJyZW50SW5kZXhiDUhvcm9zY29wZVBhZ2U=',
            name: 'int',
            nullable: false,
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=HoroscopePage',
        searchReference:
            'reference=Og1Ib3Jvc2NvcGVQYWdlUAFaDUhvcm9zY29wZVBhZ2U=',
        widgetClassName: 'HoroscopePage',
      );
}
