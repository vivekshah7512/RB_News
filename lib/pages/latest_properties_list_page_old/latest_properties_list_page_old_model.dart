import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'latest_properties_list_page_old_widget.dart'
    show LatestPropertiesListPageOldWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LatestPropertiesListPageOldModel
    extends FlutterFlowModel<LatestPropertiesListPageOldWidget> {
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
          'propertyTitle': debugSerializeParam(
            widget?.propertyTitle,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LatestPropertiesListPageOld',
            searchReference:
                'reference=Sj8KFwoNcHJvcGVydHlUaXRsZRIGazl1b3VsKh4SHOCqpOCqruCqvuCqriDgqq7gqr/gqrLgqpXgqqRyBAgDIAFQAVoNcHJvcGVydHlUaXRsZQ==',
            name: 'String',
            nullable: false,
          )
        }.withoutNulls,
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=LatestPropertiesListPageOld',
        searchReference:
            'reference=OhtMYXRlc3RQcm9wZXJ0aWVzTGlzdFBhZ2VPbGRQAVobTGF0ZXN0UHJvcGVydGllc0xpc3RQYWdlT2xk',
        widgetClassName: 'LatestPropertiesListPageOld',
      );
}
