import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'comments_list_page_widget.dart' show CommentsListPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommentsListPageModel extends FlutterFlowModel<CommentsListPageWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Post News Comment)] action in Button widget.
  ApiCallResponse? _apiResulttzl;
  set apiResulttzl(ApiCallResponse? value) {
    _apiResulttzl = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResulttzl => _apiResulttzl;

  // Stores action output result for [Backend Call - API (Delete News Comment)] action in Button widget.
  ApiCallResponse? _apiResulty9j;
  set apiResulty9j(ApiCallResponse? value) {
    _apiResulty9j = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResulty9j => _apiResulty9j;

  // Stores action output result for [Backend Call - API (NewsComment)] action in Button widget.
  ApiCallResponse? _apiResult7qu;
  set apiResult7qu(ApiCallResponse? value) {
    _apiResult7qu = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult7qu => _apiResult7qu;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'newsId': debugSerializeParam(
            widget?.newsId,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=CommentsListPage',
            searchReference:
                'reference=Sh0KEAoGbmV3c0lkEgZnOXJzcTIqAxIBMHIECAMgAVAAWgZuZXdzSWQ=',
            name: 'String',
            nullable: false,
          )
        }.withoutNulls,
        widgetStates: {
          'textFieldText': debugSerializeParam(
            textController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=CommentsListPage',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResulttzl': debugSerializeParam(
            apiResulttzl,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=CommentsListPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResulty9j': debugSerializeParam(
            apiResulty9j,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=CommentsListPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResult7qu': debugSerializeParam(
            apiResult7qu,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=CommentsListPage',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=CommentsListPage',
        searchReference:
            'reference=OhBDb21tZW50c0xpc3RQYWdlUABaEENvbW1lbnRzTGlzdFBhZ2U=',
        widgetClassName: 'CommentsListPage',
      );
}
