import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'property_detail_page_copy_widget.dart'
    show PropertyDetailPageCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PropertyDetailPageCopyModel
    extends FlutterFlowModel<PropertyDetailPageCopyWidget> {
  ///  Local state fields for this page.

  String? _bannerImage;
  set bannerImage(String? value) {
    _bannerImage = value;
    debugLogWidgetClass(this);
  }

  String? get bannerImage => _bannerImage;

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
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailPageCopy',
            searchReference:
                'reference=ShwKFAoKcHJvcGVydHlJZBIGaWw3eXA2cgQIASABUAFaCnByb3BlcnR5SWQ=',
            name: 'int',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'bannerImage': debugSerializeParam(
            bannerImage,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailPageCopy',
            searchReference:
                'reference=QiAKFAoLYmFubmVySW1hZ2USBTcwdzMwKgISAHIECAMgAFABWgtiYW5uZXJJbWFnZWIWUHJvcGVydHlEZXRhaWxQYWdlQ29weQ==',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=PropertyDetailPageCopy',
        searchReference:
            'reference=OhZQcm9wZXJ0eURldGFpbFBhZ2VDb3B5UAFaFlByb3BlcnR5RGV0YWlsUGFnZUNvcHk=',
        widgetClassName: 'PropertyDetailPageCopy',
      );
}