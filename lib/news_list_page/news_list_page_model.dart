import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'news_list_page_widget.dart' show NewsListPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NewsListPageModel extends FlutterFlowModel<NewsListPageWidget> {
  ///  Local state fields for this page.

  int? _page = 1;
  set page(int? value) {
    _page = value;
    debugLogWidgetClass(this);
  }

  int? get page => _page;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (NewsList)] action in NewsListPage widget.
  ApiCallResponse? _apiResultudj;
  set apiResultudj(ApiCallResponse? value) {
    _apiResultudj = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultudj => _apiResultudj;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (NewsList)] action in Button widget.
  ApiCallResponse? _apiResultz0zCopy;
  set apiResultz0zCopy(ApiCallResponse? value) {
    _apiResultz0zCopy = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultz0zCopy => _apiResultz0zCopy;

  // Stores action output result for [Backend Call - API (NewsList)] action in Button widget.
  ApiCallResponse? _apiResultg10Copy;
  set apiResultg10Copy(ApiCallResponse? value) {
    _apiResultg10Copy = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultg10Copy => _apiResultg10Copy;

  // Stores action output result for [Backend Call - API (NewsList)] action in Button widget.
  ApiCallResponse? _apiResultz0z;
  set apiResultz0z(ApiCallResponse? value) {
    _apiResultz0z = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultz0z => _apiResultz0z;

  // Stores action output result for [Backend Call - API (NewsList)] action in Button widget.
  ApiCallResponse? _apiResultg10;
  set apiResultg10(ApiCallResponse? value) {
    _apiResultg10 = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultg10 => _apiResultg10;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'newsType': debugSerializeParam(
            widget?.newsType,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            searchReference:
                'reference=SiEKEgoIbmV3c1R5cGUSBm5sbzFnNSoFEgNhbGxyBAgDIAFQAVoIbmV3c1R5cGU=',
            name: 'String',
            nullable: false,
          )
        }.withoutNulls,
        localStates: {
          'page': debugSerializeParam(
            page,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            searchReference:
                'reference=QhMKDQoEcGFnZRIFdnc0dGVyAggBUAFaBHBhZ2ViDE5ld3NMaXN0UGFnZQ==',
            name: 'int',
            nullable: true,
          )
        },
        widgetStates: {
          'textFieldText': debugSerializeParam(
            textController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultudj': debugSerializeParam(
            apiResultudj,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultz0zCopy': debugSerializeParam(
            apiResultz0zCopy,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultg10Copy': debugSerializeParam(
            apiResultg10Copy,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultz0z': debugSerializeParam(
            apiResultz0z,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultg10': debugSerializeParam(
            apiResultg10,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=NewsListPage',
        searchReference: 'reference=OgxOZXdzTGlzdFBhZ2VQAVoMTmV3c0xpc3RQYWdl',
        widgetClassName: 'NewsListPage',
      );
}
