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
import 'news_detail_carousel_page_widget.dart'
    show NewsDetailCarouselPageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetailCarouselPageModel
    extends FlutterFlowModel<NewsDetailCarouselPageWidget> {
  ///  Local state fields for this page.

  String _imageAssetsForSave =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/e379fd6k6hgx/save.svg';
  set imageAssetsForSave(String value) {
    _imageAssetsForSave = value;
    debugLogWidgetClass(this);
  }

  String get imageAssetsForSave => _imageAssetsForSave;

  String _imageAssets =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/hjcfxhkwoq98/dislike.svg';
  set imageAssets(String value) {
    _imageAssets = value;
    debugLogWidgetClass(this);
  }

  String get imageAssets => _imageAssets;

  int? _commentDotFlag = 0;
  set commentDotFlag(int? value) {
    _commentDotFlag = value;
    debugLogWidgetClass(this);
  }

  int? get commentDotFlag => _commentDotFlag;

  bool _isPageSwiped = false;
  set isPageSwiped(bool value) {
    _isPageSwiped = value;
    debugLogWidgetClass(this);
  }

  bool get isPageSwiped => _isPageSwiped;

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

  bool _isNewsLiked = false;
  set isNewsLiked(bool value) {
    _isNewsLiked = value;
    debugLogWidgetClass(this);
  }

  bool get isNewsLiked => _isNewsLiked;

  bool _isNewsSaved = false;
  set isNewsSaved(bool value) {
    _isNewsSaved = value;
    debugLogWidgetClass(this);
  }

  bool get isNewsSaved => _isNewsSaved;

  dynamic _advertismentData;
  set advertismentData(dynamic value) {
    _advertismentData = value;
    debugLogWidgetClass(this);
  }

  dynamic get advertismentData => _advertismentData;

  bool _isAdvertismentEmpty = false;
  set isAdvertismentEmpty(bool value) {
    _isAdvertismentEmpty = value;
    debugLogWidgetClass(this);
  }

  bool get isAdvertismentEmpty => _isAdvertismentEmpty;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getFirebaseToken] action in NewsDetailCarouselPage widget.
  String? _fcmToken;
  set fcmToken(String? value) {
    _fcmToken = value;
    debugLogWidgetClass(this);
  }

  String? get fcmToken => _fcmToken;

  // Stores action output result for [Backend Call - API (GuestUser)] action in NewsDetailCarouselPage widget.
  ApiCallResponse? _apiResultGuestUser;
  set apiResultGuestUser(ApiCallResponse? value) {
    _apiResultGuestUser = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultGuestUser => _apiResultGuestUser;

  // Stores action output result for [Backend Call - API (NewsList)] action in NewsDetailCarouselPage widget.
  ApiCallResponse? _apiResultNews;
  set apiResultNews(ApiCallResponse? value) {
    _apiResultNews = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultNews => _apiResultNews;

  // Stores action output result for [Backend Call - API (Advertisement)] action in NewsDetailCarouselPage widget.
  ApiCallResponse? _apiResultAdvertise;
  set apiResultAdvertise(ApiCallResponse? value) {
    _apiResultAdvertise = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultAdvertise => _apiResultAdvertise;

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int _carouselCurrentIndex = 0;
  set carouselCurrentIndex(int value) {
    _carouselCurrentIndex = value;
    debugLogWidgetClass(this);
  }

  int get carouselCurrentIndex => _carouselCurrentIndex;

  // Stores action output result for [Backend Call - API (Like UnLike News)] action in Container widget.
  ApiCallResponse? _apiResultLike;
  set apiResultLike(ApiCallResponse? value) {
    _apiResultLike = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultLike => _apiResultLike;

  // Stores action output result for [Backend Call - API (Save Unsave News)] action in Container widget.
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
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            searchReference:
                'reference=SiUKGwoRbmV3c0xpc3RQYWdlQXJyYXkSBmFtbzZsMXIGEgIICSAAUAFaEW5ld3NMaXN0UGFnZUFycmF5',
            name: 'dynamic',
            nullable: true,
          ),
          'isFromList': debugSerializeParam(
            widget?.isFromList,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            searchReference:
                'reference=SiUKFAoKaXNGcm9tTGlzdBIGamF0b2xjKgcSBWZhbHNlcgQIBSAAUAFaCmlzRnJvbUxpc3Q=',
            name: 'bool',
            nullable: false,
          ),
          'currentNewsPageInitalIDX': debugSerializeParam(
            widget?.currentNewsPageInitalIDX,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            searchReference:
                'reference=Si8KIgoYY3VycmVudE5ld3NQYWdlSW5pdGFsSURYEgZwaXFyaGMqAxIBMHIECAEgAFABWhhjdXJyZW50TmV3c1BhZ2VJbml0YWxJRFg=',
            name: 'int',
            nullable: false,
          ),
          'searchText': debugSerializeParam(
            widget?.searchText,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            searchReference:
                'reference=SiIKFAoKc2VhcmNoVGV4dBIGaHphbzhlKgQSAiAgcgQIAyAAUAFaCnNlYXJjaFRleHQ=',
            name: 'String',
            nullable: false,
          ),
          'newsType': debugSerializeParam(
            widget?.newsType,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            searchReference:
                'reference=SiEKEgoIbmV3c1R5cGUSBm8xd2I4bCoFEgNhbGxyBAgDIABQAVoIbmV3c1R5cGU=',
            name: 'String',
            nullable: false,
          )
        }.withoutNulls,
        localStates: {
          'imageAssetsForSave': debugSerializeParam(
            imageAssetsForSave,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            searchReference:
                'reference=QiwKGwoSaW1hZ2VBc3NldHNGb3JTYXZlEgV5cjN0MCoHEgVmYWxzZXIECAQgAVABWhJpbWFnZUFzc2V0c0ZvclNhdmViFk5ld3NEZXRhaWxDYXJvdXNlbFBhZ2U=',
            name: 'String',
            nullable: false,
          ),
          'imageAssets': debugSerializeParam(
            imageAssets,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            searchReference:
                'reference=QiUKFAoLaW1hZ2VBc3NldHMSBTcyOXJ6KgcSBWZhbHNlcgQIBCABUAFaC2ltYWdlQXNzZXRzYhZOZXdzRGV0YWlsQ2Fyb3VzZWxQYWdl',
            name: 'String',
            nullable: false,
          ),
          'commentDotFlag': debugSerializeParam(
            commentDotFlag,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            searchReference:
                'reference=Qh0KFwoOY29tbWVudERvdEZsYWcSBXV5cmp3cgIIAVABWg5jb21tZW50RG90RmxhZ2IWTmV3c0RldGFpbENhcm91c2VsUGFnZQ==',
            name: 'int',
            nullable: true,
          ),
          'isPageSwiped': debugSerializeParam(
            isPageSwiped,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            searchReference:
                'reference=QiYKFQoMaXNQYWdlU3dpcGVkEgU4cXN5aioHEgVmYWxzZXIECAUgAVABWgxpc1BhZ2VTd2lwZWRiFk5ld3NEZXRhaWxDYXJvdXNlbFBhZ2U=',
            name: 'bool',
            nullable: false,
          ),
          'newsListPageStateArray': debugSerializeParam(
            newsListPageStateArray,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            searchReference:
                'reference=QicKHwoWbmV3c0xpc3RQYWdlU3RhdGVBcnJheRIFZWF3bWJyBBICCAlQAVoWbmV3c0xpc3RQYWdlU3RhdGVBcnJheWIWTmV3c0RldGFpbENhcm91c2VsUGFnZQ==',
            name: 'dynamic',
            nullable: false,
          ),
          'isNewsLiked': debugSerializeParam(
            isNewsLiked,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            searchReference:
                'reference=QiUKFAoLaXNOZXdzTGlrZWQSBW8yaGFhKgcSBWZhbHNlcgQIBSABUAFaC2lzTmV3c0xpa2VkYhZOZXdzRGV0YWlsQ2Fyb3VzZWxQYWdl',
            name: 'bool',
            nullable: false,
          ),
          'isNewsSaved': debugSerializeParam(
            isNewsSaved,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            searchReference:
                'reference=QiUKFAoLaXNOZXdzU2F2ZWQSBXI0Y2kxKgcSBWZhbHNlcgQIBSABUAFaC2lzTmV3c1NhdmVkYhZOZXdzRGV0YWlsQ2Fyb3VzZWxQYWdl',
            name: 'bool',
            nullable: false,
          ),
          'advertismentData': debugSerializeParam(
            advertismentData,
            ParamType.JSON,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            searchReference:
                'reference=Qh8KGQoQYWR2ZXJ0aXNtZW50RGF0YRIFZGZka2dyAggJUAFaEGFkdmVydGlzbWVudERhdGFiFk5ld3NEZXRhaWxDYXJvdXNlbFBhZ2U=',
            name: 'dynamic',
            nullable: true,
          ),
          'isAdvertismentEmpty': debugSerializeParam(
            isAdvertismentEmpty,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            searchReference:
                'reference=Qi0KHAoTaXNBZHZlcnRpc21lbnRFbXB0eRIFcHp5ODIqBxIFZmFsc2VyBAgFIAFQAVoTaXNBZHZlcnRpc21lbnRFbXB0eWIWTmV3c0RldGFpbENhcm91c2VsUGFnZQ==',
            name: 'bool',
            nullable: false,
          )
        },
        widgetStates: {
          'carouselCurrentIndex': debugSerializeParam(
            carouselCurrentIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            name: 'int',
            nullable: true,
          )
        },
        actionOutputs: {
          'fcmToken': debugSerializeParam(
            fcmToken,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            name: 'String',
            nullable: true,
          ),
          'apiResultGuestUser': debugSerializeParam(
            apiResultGuestUser,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultNews': debugSerializeParam(
            apiResultNews,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultAdvertise': debugSerializeParam(
            apiResultAdvertise,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultLike': debugSerializeParam(
            apiResultLike,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultSaved': debugSerializeParam(
            apiResultSaved,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=NewsDetailCarouselPage',
        searchReference:
            'reference=OhZOZXdzRGV0YWlsQ2Fyb3VzZWxQYWdlUAFaFk5ld3NEZXRhaWxDYXJvdXNlbFBhZ2U=',
        widgetClassName: 'NewsDetailCarouselPage',
      );
}
