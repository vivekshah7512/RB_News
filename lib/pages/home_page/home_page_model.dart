import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/custom_components/login_popup/login_popup_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  int _currentIndex = 0;
  set currentIndex(int value) {
    _currentIndex = value;
    debugLogWidgetClass(this);
  }

  int get currentIndex => _currentIndex;

  int _timerValue = 60;
  set timerValue(int value) {
    _timerValue = value;
    debugLogWidgetClass(this);
  }

  int get timerValue => _timerValue;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getFirebaseToken] action in HomePage widget.
  String? _fcmToken;
  set fcmToken(String? value) {
    _fcmToken = value;
    debugLogWidgetClass(this);
  }

  String? get fcmToken => _fcmToken;

  // Stores action output result for [Backend Call - API (GuestUser)] action in HomePage widget.
  ApiCallResponse? _apiResultrfs;
  set apiResultrfs(ApiCallResponse? value) {
    _apiResultrfs = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultrfs => _apiResultrfs;

  // Stores action output result for [Custom Action - areNotificationsEnabled] action in Image widget.
  bool? _result;
  set result(bool? value) {
    _result = value;
    debugLogWidgetClass(this);
  }

  bool? get result => _result;

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
        widgetParameters: {
          'hintFlag': debugSerializeParam(
            widget?.hintFlag,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
            searchReference:
                'reference=Sh8KEgoIaGludEZsYWcSBmxtbGZ6dCoDEgExcgQIASABUAFaCGhpbnRGbGFn',
            name: 'int',
            nullable: false,
          )
        }.withoutNulls,
        localStates: {
          'currentIndex': debugSerializeParam(
            currentIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
            searchReference:
                'reference=Qh0KFQoMY3VycmVudEluZGV4EgVhOG5ubnIECAEgAVABWgxjdXJyZW50SW5kZXhiCEhvbWVQYWdl',
            name: 'int',
            nullable: false,
          ),
          'timerValue': debugSerializeParam(
            timerValue,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
            searchReference:
                'reference=QhsKEwoKdGltZXJWYWx1ZRIFeHh4bXRyBAgBIAFQAVoKdGltZXJWYWx1ZWIISG9tZVBhZ2U=',
            name: 'int',
            nullable: false,
          )
        },
        actionOutputs: {
          'fcmToken': debugSerializeParam(
            fcmToken,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
            name: 'String',
            nullable: true,
          ),
          'apiResultrfs': debugSerializeParam(
            apiResultrfs,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'result': debugSerializeParam(
            result,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=HomePage',
        searchReference: 'reference=OghIb21lUGFnZVABWghIb21lUGFnZQ==',
        widgetClassName: 'HomePage',
      );
}
