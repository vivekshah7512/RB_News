import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/custom_components/news_filter_popup/news_filter_popup_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'news_list_page_widget.dart' show NewsListPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewsListPageModel extends FlutterFlowModel<NewsListPageWidget> {
  ///  Local state fields for this page.

  int? _page = 1;
  set page(int? value) {
    _page = value;
    debugLogWidgetClass(this);
  }

  int? get page => _page;

  int? _selectedRowIndex = 0;
  set selectedRowIndex(int? value) {
    _selectedRowIndex = value;
    debugLogWidgetClass(this);
  }

  int? get selectedRowIndex => _selectedRowIndex;

  bool _isListEmpty = false;
  set isListEmpty(bool value) {
    _isListEmpty = value;
    debugLogWidgetClass(this);
  }

  bool get isListEmpty => _isListEmpty;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (NewsList)] action in NewsListPage widget.
  ApiCallResponse? _apiResultudj;
  set apiResultudj(ApiCallResponse? value) {
    _apiResultudj = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultudj => _apiResultudj;

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextFieldSearch widget.
  FocusNode? textFieldSearchFocusNode;
  TextEditingController? textFieldSearchTextController;
  String? Function(BuildContext, String?)?
      textFieldSearchTextControllerValidator;
  // Stores action output result for [Backend Call - API (NewsList)] action in TextFieldSearch widget.
  ApiCallResponse? _apiResultudjS;
  set apiResultudjS(ApiCallResponse? value) {
    _apiResultudjS = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultudjS => _apiResultudjS;

  // State field(s) for Row widget.
  ScrollController? rowController;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Custom Action - manageNewsCategoryFilter] action in Icon widget.
  List<SelectedNewsCategoryDataStruct>? _testresult;
  set testresult(List<SelectedNewsCategoryDataStruct>? value) {
    _testresult = value;
    debugLogWidgetClass(this);
  }

  List<SelectedNewsCategoryDataStruct>? get testresult => _testresult;

  // Stores action output result for [Backend Call - API (NewsList)] action in Icon widget.
  ApiCallResponse? _apiResultOnCancelFilter;
  set apiResultOnCancelFilter(ApiCallResponse? value) {
    _apiResultOnCancelFilter = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultOnCancelFilter => _apiResultOnCancelFilter;

  // Stores action output result for [Backend Call - API (NewsList)] action in Text widget.
  ApiCallResponse? _apiResultOnCancelAll;
  set apiResultOnCancelAll(ApiCallResponse? value) {
    _apiResultOnCancelAll = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultOnCancelAll => _apiResultOnCancelAll;

  // State field(s) for ListViewNews widget.
  ScrollController? listViewNews;
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
    columnController = ScrollController();
    rowController = ScrollController();
    listViewController = ScrollController();
    listViewNews = ScrollController();

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    columnController?.dispose();
    textFieldSearchFocusNode?.dispose();
    textFieldSearchTextController?.dispose();

    rowController?.dispose();
    listViewController?.dispose();
    listViewNews?.dispose();
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
          ),
          'newsTitle': debugSerializeParam(
            widget?.newsTitle,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            searchReference:
                'reference=SjsKEwoJbmV3c1RpdGxlEgZqMGIyYmMqHhIc4Kqs4Kqn4Kq+IOCquOCqruCqvuCqmuCqvuCqsHIECAMgAVABWgluZXdzVGl0bGU=',
            name: 'String',
            nullable: false,
          ),
          'searchKeyword': debugSerializeParam(
            widget?.searchKeyword,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            searchReference:
                'reference=SiYKFwoNc2VhcmNoS2V5d29yZBIGMHJseThqKgUSAyAgIHIECAMgAFABWg1zZWFyY2hLZXl3b3Jk',
            name: 'String',
            nullable: false,
          ),
          'searchForNews': debugSerializeParam(
            widget?.searchForNews,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            searchReference:
                'reference=SiQKFwoNc2VhcmNoRm9yTmV3cxIGeXRicjN1KgMSATByBAgBIABQAVoNc2VhcmNoRm9yTmV3cw==',
            name: 'int',
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
          ),
          'selectedRowIndex': debugSerializeParam(
            selectedRowIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            searchReference:
                'reference=Qh8KGQoQc2VsZWN0ZWRSb3dJbmRleBIFZnMxb2VyAggBUAFaEHNlbGVjdGVkUm93SW5kZXhiDE5ld3NMaXN0UGFnZQ==',
            name: 'int',
            nullable: true,
          ),
          'isListEmpty': debugSerializeParam(
            isListEmpty,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            searchReference:
                'reference=QiUKFAoLaXNMaXN0RW1wdHkSBTFmNWprKgcSBWZhbHNlcgQIBSABUAFaC2lzTGlzdEVtcHR5YgxOZXdzTGlzdFBhZ2U=',
            name: 'bool',
            nullable: false,
          )
        },
        widgetStates: {
          'textFieldSearchText': debugSerializeParam(
            textFieldSearchTextController?.text,
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
          'apiResultudjS': debugSerializeParam(
            apiResultudjS,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'testresult': debugSerializeParam(
            testresult,
            ParamType.DataStruct,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            name: 'SelectedNewsCategoryData',
            nullable: true,
          ),
          'apiResultOnCancelFilter': debugSerializeParam(
            apiResultOnCancelFilter,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultOnCancelAll': debugSerializeParam(
            apiResultOnCancelAll,
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
