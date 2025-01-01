import '/backend/api_requests/api_calls.dart';
import '/components/comments_list_page_widget.dart';
import '/components/login_alert_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'news_pages_list_view_page_widget.dart' show NewsPagesListViewPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewsPagesListViewPageModel
    extends FlutterFlowModel<NewsPagesListViewPageWidget> {
  ///  Local state fields for this page.

  bool _isNewsLiked = true;
  set isNewsLiked(bool value) {
    _isNewsLiked = value;
    debugLogWidgetClass(this);
  }

  bool get isNewsLiked => _isNewsLiked;

  bool _isNewsSaved = true;
  set isNewsSaved(bool value) {
    _isNewsSaved = value;
    debugLogWidgetClass(this);
  }

  bool get isNewsSaved => _isNewsSaved;

  int? _currentNewsId = 0;
  set currentNewsId(int? value) {
    _currentNewsId = value;
    debugLogWidgetClass(this);
  }

  int? get currentNewsId => _currentNewsId;

  late LoggableList<dynamic> _newsListPageStateArray = LoggableList([]);
  set newsListPageStateArray(List<dynamic> value) {
    if (value != null) {
      _newsListPageStateArray = LoggableList(value);
    }

    debugLogWidgetClass(this);
  }

  List<dynamic> get newsListPageStateArray =>
      _newsListPageStateArray?..logger = () => debugLogWidgetClass(this);
  void addToNewsListPageStateArray(dynamic item) =>
      newsListPageStateArray.add(item);
  void removeFromNewsListPageStateArray(dynamic item) =>
      newsListPageStateArray.remove(item);
  void removeAtIndexFromNewsListPageStateArray(int index) =>
      newsListPageStateArray.removeAt(index);
  void insertAtIndexInNewsListPageStateArray(int index, dynamic item) =>
      newsListPageStateArray.insert(index, item);
  void updateNewsListPageStateArrayAtIndex(
          int index, Function(dynamic) updateFn) =>
      newsListPageStateArray[index] = updateFn(newsListPageStateArray[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (NewsList)] action in newsPagesListViewPage widget.
  ApiCallResponse? _apiResultNews;
  set apiResultNews(ApiCallResponse? value) {
    _apiResultNews = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultNews => _apiResultNews;

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (Like UnLike News)] action in Image widget.
  ApiCallResponse? _apiResultLike;
  set apiResultLike(ApiCallResponse? value) {
    _apiResultLike = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultLike => _apiResultLike;

  // Stores action output result for [Backend Call - API (Save Unsave News)] action in Image widget.
  ApiCallResponse? _apiResultSaved;
  set apiResultSaved(ApiCallResponse? value) {
    _apiResultSaved = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultSaved => _apiResultSaved;

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
          'newsListPageArray': debugSerializeParam(
            widget?.newsListPageArray,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=newsPagesListViewPage',
            searchReference:
                'reference=SiUKGwoRbmV3c0xpc3RQYWdlQXJyYXkSBnFneGowc3IGEgIICSABUAFaEW5ld3NMaXN0UGFnZUFycmF5',
            name: 'dynamic',
            nullable: true,
          ),
          'currentPage': debugSerializeParam(
            widget?.currentPage,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=newsPagesListViewPage',
            searchReference:
                'reference=SiIKFQoLY3VycmVudFBhZ2USBm50N3lsNCoDEgEwcgQIASABUAFaC2N1cnJlbnRQYWdl',
            name: 'int',
            nullable: false,
          )
        }.withoutNulls,
        localStates: {
          'isNewsLiked': debugSerializeParam(
            isNewsLiked,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=newsPagesListViewPage',
            searchReference:
                'reference=QiUKFAoLaXNOZXdzTGlrZWQSBWM1ZnllKgcSBWZhbHNlcgQIBSABUAFaC2lzTmV3c0xpa2VkYhVuZXdzUGFnZXNMaXN0Vmlld1BhZ2U=',
            name: 'bool',
            nullable: false,
          ),
          'isNewsSaved': debugSerializeParam(
            isNewsSaved,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=newsPagesListViewPage',
            searchReference:
                'reference=QiUKFAoLaXNOZXdzU2F2ZWQSBWhzMjV6KgcSBWZhbHNlcgQIBSABUAFaC2lzTmV3c1NhdmVkYhVuZXdzUGFnZXNMaXN0Vmlld1BhZ2U=',
            name: 'bool',
            nullable: false,
          ),
          'currentNewsId': debugSerializeParam(
            currentNewsId,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=newsPagesListViewPage',
            searchReference:
                'reference=QhwKFgoNY3VycmVudE5ld3NJZBIFYTMxanhyAggBUAFaDWN1cnJlbnROZXdzSWRiFW5ld3NQYWdlc0xpc3RWaWV3UGFnZQ==',
            name: 'int',
            nullable: true,
          ),
          'newsListPageStateArray': debugSerializeParam(
            newsListPageStateArray,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=newsPagesListViewPage',
            searchReference:
                'reference=QicKHwoWbmV3c0xpc3RQYWdlU3RhdGVBcnJheRIFbXRvdGJyBBICCAlQAVoWbmV3c0xpc3RQYWdlU3RhdGVBcnJheWIVbmV3c1BhZ2VzTGlzdFZpZXdQYWdl',
            name: 'dynamic',
            nullable: false,
          )
        },
        widgetStates: {
          'pageViewCurrentIndex': debugSerializeParam(
            pageViewCurrentIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=newsPagesListViewPage',
            name: 'int',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultNews': debugSerializeParam(
            apiResultNews,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=newsPagesListViewPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultLike': debugSerializeParam(
            apiResultLike,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=newsPagesListViewPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultSaved': debugSerializeParam(
            apiResultSaved,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=newsPagesListViewPage',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=newsPagesListViewPage',
        searchReference:
            'reference=OhVuZXdzUGFnZXNMaXN0Vmlld1BhZ2VQAVoVbmV3c1BhZ2VzTGlzdFZpZXdQYWdl',
        widgetClassName: 'newsPagesListViewPage',
      );
}
