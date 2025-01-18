import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'property_detail_list_page_widget.dart'
    show PropertyDetailListPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetailListPageModel
    extends FlutterFlowModel<PropertyDetailListPageWidget> {
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

  String? _tapImage;
  set tapImage(String? value) {
    _tapImage = value;
    debugLogWidgetClass(this);
  }

  String? get tapImage => _tapImage;

  int? _selectedImageId = 0;
  set selectedImageId(int? value) {
    _selectedImageId = value;
    debugLogWidgetClass(this);
  }

  int? get selectedImageId => _selectedImageId;

  late LoggableList<dynamic> _propertyListPageStateArray = LoggableList([]);
  set propertyListPageStateArray(List<dynamic> value) {
    if (value != null) {
      _propertyListPageStateArray = LoggableList(value);
    }

    debugLogWidgetClass(this);
  }

  List<dynamic> get propertyListPageStateArray =>
      _propertyListPageStateArray?..logger = () => debugLogWidgetClass(this);
  void addToPropertyListPageStateArray(dynamic item) =>
      propertyListPageStateArray.add(item);
  void removeFromPropertyListPageStateArray(dynamic item) =>
      propertyListPageStateArray.remove(item);
  void removeAtIndexFromPropertyListPageStateArray(int index) =>
      propertyListPageStateArray.removeAt(index);
  void insertAtIndexInPropertyListPageStateArray(int index, dynamic item) =>
      propertyListPageStateArray.insert(index, item);
  void updatePropertyListPageStateArrayAtIndex(
          int index, Function(dynamic) updateFn) =>
      propertyListPageStateArray[index] =
          updateFn(propertyListPageStateArray[index]);

  late LoggableList<String> _propertyAllImagesLocal = LoggableList([]);
  set propertyAllImagesLocal(List<String> value) {
    if (value != null) {
      _propertyAllImagesLocal = LoggableList(value);
    }

    debugLogWidgetClass(this);
  }

  List<String> get propertyAllImagesLocal =>
      _propertyAllImagesLocal?..logger = () => debugLogWidgetClass(this);
  void addToPropertyAllImagesLocal(String item) =>
      propertyAllImagesLocal.add(item);
  void removeFromPropertyAllImagesLocal(String item) =>
      propertyAllImagesLocal.remove(item);
  void removeAtIndexFromPropertyAllImagesLocal(int index) =>
      propertyAllImagesLocal.removeAt(index);
  void insertAtIndexInPropertyAllImagesLocal(int index, String item) =>
      propertyAllImagesLocal.insert(index, item);
  void updatePropertyAllImagesLocalAtIndex(
          int index, Function(String) updateFn) =>
      propertyAllImagesLocal[index] = updateFn(propertyAllImagesLocal[index]);

  int _currentIndex = 2;
  set currentIndex(int value) {
    _currentIndex = value;
    debugLogWidgetClass(this);
  }

  int get currentIndex => _currentIndex;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Property List)] action in PropertyDetailListPage widget.
  ApiCallResponse? _apiResultsDetail;
  set apiResultsDetail(ApiCallResponse? value) {
    _apiResultsDetail = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultsDetail => _apiResultsDetail;

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

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
          'propertyId': debugSerializeParam(
            widget?.propertyId,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailListPage',
            searchReference:
                'reference=SiEKFAoKcHJvcGVydHlJZBIGanI0dnpsKgMSATByBAgBIABQAVoKcHJvcGVydHlJZA==',
            name: 'int',
            nullable: false,
          ),
          'propertyListArray': debugSerializeParam(
            widget?.propertyListArray,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailListPage',
            searchReference:
                'reference=SiUKGwoRcHJvcGVydHlMaXN0QXJyYXkSBjlzOWM2d3IGEgIICSAAUAFaEXByb3BlcnR5TGlzdEFycmF5',
            name: 'dynamic',
            nullable: true,
          ),
          'currentPageIndex': debugSerializeParam(
            widget?.currentPageIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailListPage',
            searchReference:
                'reference=SicKGgoQY3VycmVudFBhZ2VJbmRleBIGeTV0MmJyKgMSATByBAgBIABQAVoQY3VycmVudFBhZ2VJbmRleA==',
            name: 'int',
            nullable: false,
          )
        }.withoutNulls,
        localStates: {
          'isNewsLiked': debugSerializeParam(
            isNewsLiked,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailListPage',
            searchReference:
                'reference=QiUKFAoLaXNOZXdzTGlrZWQSBWprNjluKgcSBWZhbHNlcgQIBSABUAFaC2lzTmV3c0xpa2VkYhZQcm9wZXJ0eURldGFpbExpc3RQYWdl',
            name: 'bool',
            nullable: false,
          ),
          'isNewsSaved': debugSerializeParam(
            isNewsSaved,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailListPage',
            searchReference:
                'reference=QiUKFAoLaXNOZXdzU2F2ZWQSBXRqcnMyKgcSBWZhbHNlcgQIBSABUAFaC2lzTmV3c1NhdmVkYhZQcm9wZXJ0eURldGFpbExpc3RQYWdl',
            name: 'bool',
            nullable: false,
          ),
          'viewMoreURL': debugSerializeParam(
            viewMoreURL,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailListPage',
            searchReference:
                'reference=QiAKFAoLdmlld01vcmVVUkwSBXRseDAxKgISAHIECAMgAFABWgt2aWV3TW9yZVVSTGIWUHJvcGVydHlEZXRhaWxMaXN0UGFnZQ==',
            name: 'String',
            nullable: true,
          ),
          'tapImage': debugSerializeParam(
            tapImage,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailListPage',
            searchReference:
                'reference=QiIKEQoIdGFwSW1hZ2USBXpqY2NxKgcSBWZhbHNlcgQIBCAAUAFaCHRhcEltYWdlYhZQcm9wZXJ0eURldGFpbExpc3RQYWdl',
            name: 'String',
            nullable: true,
          ),
          'selectedImageId': debugSerializeParam(
            selectedImageId,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailListPage',
            searchReference:
                'reference=QiAKGAoPc2VsZWN0ZWRJbWFnZUlkEgV4dW4zanIECAEgAFABWg9zZWxlY3RlZEltYWdlSWRiFlByb3BlcnR5RGV0YWlsTGlzdFBhZ2U=',
            name: 'int',
            nullable: true,
          ),
          'propertyListPageStateArray': debugSerializeParam(
            propertyListPageStateArray,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailListPage',
            searchReference:
                'reference=QisKIwoacHJvcGVydHlMaXN0UGFnZVN0YXRlQXJyYXkSBWZrejBrcgQSAggJUAFaGnByb3BlcnR5TGlzdFBhZ2VTdGF0ZUFycmF5YhZQcm9wZXJ0eURldGFpbExpc3RQYWdl',
            name: 'dynamic',
            nullable: false,
          ),
          'propertyAllImagesLocal': debugSerializeParam(
            propertyAllImagesLocal,
            ParamType.String,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailListPage',
            searchReference:
                'reference=QikKHwoWcHJvcGVydHlBbGxJbWFnZXNMb2NhbBIFMWFrMmRyBhICCAQgAVABWhZwcm9wZXJ0eUFsbEltYWdlc0xvY2FsYhZQcm9wZXJ0eURldGFpbExpc3RQYWdl',
            name: 'String',
            nullable: false,
          ),
          'currentIndex': debugSerializeParam(
            currentIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailListPage',
            searchReference:
                'reference=Qh0KFQoMY3VycmVudEluZGV4EgVhdml1OXIECAEgAVABWgxjdXJyZW50SW5kZXhiFlByb3BlcnR5RGV0YWlsTGlzdFBhZ2U=',
            name: 'int',
            nullable: false,
          )
        },
        widgetStates: {
          'pageViewCurrentIndex': debugSerializeParam(
            pageViewCurrentIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailListPage',
            name: 'int',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultsDetail': debugSerializeParam(
            apiResultsDetail,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailListPage',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=PropertyDetailListPage',
        searchReference:
            'reference=OhZQcm9wZXJ0eURldGFpbExpc3RQYWdlUAFaFlByb3BlcnR5RGV0YWlsTGlzdFBhZ2U=',
        widgetClassName: 'PropertyDetailListPage',
      );
}
