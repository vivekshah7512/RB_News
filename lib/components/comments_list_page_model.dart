import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
