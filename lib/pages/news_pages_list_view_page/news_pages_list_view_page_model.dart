import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/custom_components/advertisement_popup/advertisement_popup_widget.dart';
import '/pages/custom_components/comments_list_page/comments_list_page_widget.dart';
import '/pages/custom_components/login_popup/login_popup_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'news_pages_list_view_page_widget.dart' show NewsPagesListViewPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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

  int _currentIndex = 0;
  set currentIndex(int value) {
    _currentIndex = value;
    debugLogWidgetClass(this);
  }

  int get currentIndex => _currentIndex;

  String _imageAssets =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/hjcfxhkwoq98/dislike.svg';
  set imageAssets(String value) {
    _imageAssets = value;
    debugLogWidgetClass(this);
  }

  String get imageAssets => _imageAssets;

  String _imageAssetsForSave =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/e379fd6k6hgx/save.svg';
  set imageAssetsForSave(String value) {
    _imageAssetsForSave = value;
    debugLogWidgetClass(this);
  }

  String get imageAssetsForSave => _imageAssetsForSave;

  int _commentDotFlag = 0;
  set commentDotFlag(int value) {
    _commentDotFlag = value;
    debugLogWidgetClass(this);
  }

  int get commentDotFlag => _commentDotFlag;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GuestUser)] action in NewsPagesListViewPage widget.
  ApiCallResponse? _apiResultrfs;
  set apiResultrfs(ApiCallResponse? value) {
    _apiResultrfs = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultrfs => _apiResultrfs;

  // Stores action output result for [Backend Call - API (NewsList)] action in NewsPagesListViewPage widget.
  ApiCallResponse? _apiResultNews;
  set apiResultNews(ApiCallResponse? value) {
    _apiResultNews = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultNews => _apiResultNews;

  // Stores action output result for [Backend Call - API (Advertisement)] action in NewsPagesListViewPage widget.
  ApiCallResponse? _apiResultjr3;
  set apiResultjr3(ApiCallResponse? value) {
    _apiResultjr3 = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultjr3 => _apiResultjr3;

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
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            searchReference:
                'reference=SiUKGwoRbmV3c0xpc3RQYWdlQXJyYXkSBnFneGowc3IGEgIICSAAUAFaEW5ld3NMaXN0UGFnZUFycmF5',
            name: 'dynamic',
            nullable: true,
          ),
          'currentNewsPageInitalIDX': debugSerializeParam(
            widget?.currentNewsPageInitalIDX,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            searchReference:
                'reference=Si8KIgoYY3VycmVudE5ld3NQYWdlSW5pdGFsSURYEgZudDd5bDQqAxIBMHIECAEgAFABWhhjdXJyZW50TmV3c1BhZ2VJbml0YWxJRFg=',
            name: 'int',
            nullable: false,
          ),
          'isFromList': debugSerializeParam(
            widget?.isFromList,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            searchReference:
                'reference=SiUKFAoKaXNGcm9tTGlzdBIGbHR2bDRzKgcSBWZhbHNlcgQIBSAAUAFaCmlzRnJvbUxpc3Q=',
            name: 'bool',
            nullable: false,
          )
        }.withoutNulls,
        localStates: {
          'isNewsLiked': debugSerializeParam(
            isNewsLiked,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            searchReference:
                'reference=QiUKFAoLaXNOZXdzTGlrZWQSBWM1ZnllKgcSBWZhbHNlcgQIBSABUAFaC2lzTmV3c0xpa2VkYhVOZXdzUGFnZXNMaXN0Vmlld1BhZ2U=',
            name: 'bool',
            nullable: false,
          ),
          'isNewsSaved': debugSerializeParam(
            isNewsSaved,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            searchReference:
                'reference=QiUKFAoLaXNOZXdzU2F2ZWQSBWhzMjV6KgcSBWZhbHNlcgQIBSABUAFaC2lzTmV3c1NhdmVkYhVOZXdzUGFnZXNMaXN0Vmlld1BhZ2U=',
            name: 'bool',
            nullable: false,
          ),
          'currentNewsId': debugSerializeParam(
            currentNewsId,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            searchReference:
                'reference=QhwKFgoNY3VycmVudE5ld3NJZBIFYTMxanhyAggBUAFaDWN1cnJlbnROZXdzSWRiFU5ld3NQYWdlc0xpc3RWaWV3UGFnZQ==',
            name: 'int',
            nullable: true,
          ),
          'newsListPageStateArray': debugSerializeParam(
            newsListPageStateArray,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            searchReference:
                'reference=QicKHwoWbmV3c0xpc3RQYWdlU3RhdGVBcnJheRIFbXRvdGJyBBICCAlQAVoWbmV3c0xpc3RQYWdlU3RhdGVBcnJheWIVTmV3c1BhZ2VzTGlzdFZpZXdQYWdl',
            name: 'dynamic',
            nullable: false,
          ),
          'currentIndex': debugSerializeParam(
            currentIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            searchReference:
                'reference=Qh0KFQoMY3VycmVudEluZGV4EgVrcG84M3IECAEgAVABWgxjdXJyZW50SW5kZXhiFU5ld3NQYWdlc0xpc3RWaWV3UGFnZQ==',
            name: 'int',
            nullable: false,
          ),
          'imageAssets': debugSerializeParam(
            imageAssets,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            searchReference:
                'reference=QiUKFAoLaW1hZ2VBc3NldHMSBTk5MzBmKgcSBWZhbHNlcgQIBCABUAFaC2ltYWdlQXNzZXRzYhVOZXdzUGFnZXNMaXN0Vmlld1BhZ2U=',
            name: 'String',
            nullable: false,
          ),
          'imageAssetsForSave': debugSerializeParam(
            imageAssetsForSave,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            searchReference:
                'reference=QiwKGwoSaW1hZ2VBc3NldHNGb3JTYXZlEgVpdzE3cyoHEgVmYWxzZXIECAQgAVABWhJpbWFnZUFzc2V0c0ZvclNhdmViFU5ld3NQYWdlc0xpc3RWaWV3UGFnZQ==',
            name: 'String',
            nullable: false,
          ),
          'commentDotFlag': debugSerializeParam(
            commentDotFlag,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            searchReference:
                'reference=Qh8KFwoOY29tbWVudERvdEZsYWcSBWZrZ3k0cgQIASABUAFaDmNvbW1lbnREb3RGbGFnYhVOZXdzUGFnZXNMaXN0Vmlld1BhZ2U=',
            name: 'int',
            nullable: false,
          )
        },
        widgetStates: {
          'pageViewCurrentIndex': debugSerializeParam(
            pageViewCurrentIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            name: 'int',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultrfs': debugSerializeParam(
            apiResultrfs,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultNews': debugSerializeParam(
            apiResultNews,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultjr3': debugSerializeParam(
            apiResultjr3,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultLike': debugSerializeParam(
            apiResultLike,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultSaved': debugSerializeParam(
            apiResultSaved,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=NewsPagesListViewPage',
        searchReference:
            'reference=OhVOZXdzUGFnZXNMaXN0Vmlld1BhZ2VQAVoVTmV3c1BhZ2VzTGlzdFZpZXdQYWdl',
        widgetClassName: 'NewsPagesListViewPage',
      );
}
