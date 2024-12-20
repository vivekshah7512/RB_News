import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/comments_list_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'news_detail_page_widget.dart' show NewsDetailPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewsDetailPageModel extends FlutterFlowModel<NewsDetailPageWidget> {
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

  String? _viewMoreURL;
  set viewMoreURL(String? value) {
    _viewMoreURL = value;
    debugLogWidgetClass(this);
  }

  String? get viewMoreURL => _viewMoreURL;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (NewsDetail)] action in NewsDetailPage widget.
  ApiCallResponse? _apiResultoqq;
  set apiResultoqq(ApiCallResponse? value) {
    _apiResultoqq = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultoqq => _apiResultoqq;

  // Stores action output result for [Backend Call - API (Like UnLike News)] action in Image widget.
  ApiCallResponse? _apiResultmjdLikeCopy;
  set apiResultmjdLikeCopy(ApiCallResponse? value) {
    _apiResultmjdLikeCopy = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultmjdLikeCopy => _apiResultmjdLikeCopy;

  // Stores action output result for [Backend Call - API (Save Unsave News)] action in Image widget.
  ApiCallResponse? _apiResultmjd;
  set apiResultmjd(ApiCallResponse? value) {
    _apiResultmjd = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultmjd => _apiResultmjd;

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
          'newsId': debugSerializeParam(
            widget?.newsId,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailPage',
            searchReference:
                'reference=Sh4KEAoGbmV3c0lkEgZqcjR2emwqBBICOTZyBAgDIAFQAVoGbmV3c0lk',
            name: 'String',
            nullable: false,
          )
        }.withoutNulls,
        localStates: {
          'isNewsLiked': debugSerializeParam(
            isNewsLiked,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailPage',
            searchReference:
                'reference=QiUKFAoLaXNOZXdzTGlrZWQSBWprNjluKgcSBWZhbHNlcgQIBSABUAFaC2lzTmV3c0xpa2VkYg5OZXdzRGV0YWlsUGFnZQ==',
            name: 'bool',
            nullable: false,
          ),
          'isNewsSaved': debugSerializeParam(
            isNewsSaved,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailPage',
            searchReference:
                'reference=QiUKFAoLaXNOZXdzU2F2ZWQSBXRqcnMyKgcSBWZhbHNlcgQIBSABUAFaC2lzTmV3c1NhdmVkYg5OZXdzRGV0YWlsUGFnZQ==',
            name: 'bool',
            nullable: false,
          ),
          'viewMoreURL': debugSerializeParam(
            viewMoreURL,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailPage',
            searchReference:
                'reference=QiAKFAoLdmlld01vcmVVUkwSBXRseDAxKgISAHIECAMgAFABWgt2aWV3TW9yZVVSTGIOTmV3c0RldGFpbFBhZ2U=',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultoqq': debugSerializeParam(
            apiResultoqq,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultmjdLikeCopy': debugSerializeParam(
            apiResultmjdLikeCopy,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultmjd': debugSerializeParam(
            apiResultmjd,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailPage',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=NewsDetailPage',
        searchReference:
            'reference=Og5OZXdzRGV0YWlsUGFnZVABWg5OZXdzRGV0YWlsUGFnZQ==',
        widgetClassName: 'NewsDetailPage',
      );
}
