import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GuestUser)] action in HomePage widget.
  ApiCallResponse? _apiResultrfs;
  set apiResultrfs(ApiCallResponse? value) {
    _apiResultrfs = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultrfs => _apiResultrfs;

  // State field(s) for SearchTextField widget.
  FocusNode? searchTextFieldFocusNode;
  TextEditingController? searchTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchTextFieldTextControllerValidator;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    searchTextFieldFocusNode?.dispose();
    searchTextFieldTextController?.dispose();
  }

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
        widgetStates: {
          'searchTextFieldText': debugSerializeParam(
            searchTextFieldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultrfs': debugSerializeParam(
            apiResultrfs,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
            name: 'ApiCallResponse',
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
