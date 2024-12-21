import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'property_detail_new_widget.dart' show PropertyDetailNewWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PropertyDetailNewModel extends FlutterFlowModel<PropertyDetailNewWidget> {
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
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailNew',
            searchReference:
                'reference=SiEKFAoKcHJvcGVydHlJZBIGanI0dnpsKgMSATFyBAgBIAFQAVoKcHJvcGVydHlJZA==',
            name: 'int',
            nullable: false,
          )
        }.withoutNulls,
        localStates: {
          'isNewsLiked': debugSerializeParam(
            isNewsLiked,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailNew',
            searchReference:
                'reference=QiUKFAoLaXNOZXdzTGlrZWQSBWprNjluKgcSBWZhbHNlcgQIBSABUAFaC2lzTmV3c0xpa2VkYhFQcm9wZXJ0eURldGFpbE5ldw==',
            name: 'bool',
            nullable: false,
          ),
          'isNewsSaved': debugSerializeParam(
            isNewsSaved,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailNew',
            searchReference:
                'reference=QiUKFAoLaXNOZXdzU2F2ZWQSBXRqcnMyKgcSBWZhbHNlcgQIBSABUAFaC2lzTmV3c1NhdmVkYhFQcm9wZXJ0eURldGFpbE5ldw==',
            name: 'bool',
            nullable: false,
          ),
          'viewMoreURL': debugSerializeParam(
            viewMoreURL,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailNew',
            searchReference:
                'reference=QiAKFAoLdmlld01vcmVVUkwSBXRseDAxKgISAHIECAMgAFABWgt2aWV3TW9yZVVSTGIRUHJvcGVydHlEZXRhaWxOZXc=',
            name: 'String',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=PropertyDetailNew',
        searchReference:
            'reference=OhFQcm9wZXJ0eURldGFpbE5ld1ABWhFQcm9wZXJ0eURldGFpbE5ldw==',
        widgetClassName: 'PropertyDetailNew',
      );
}
