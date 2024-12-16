import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'horoscopes_detail_page_widget.dart' show HoroscopesDetailPageWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HoroscopesDetailPageModel
    extends FlutterFlowModel<HoroscopesDetailPageWidget> {
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
          'horoscopeId': debugSerializeParam(
            widget?.horoscopeId,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HoroscopesDetailPage',
            searchReference:
                'reference=SiIKFQoLaG9yb3Njb3BlSWQSBjZsbmZ6bSoDEgEwcgQIAyABUAFaC2hvcm9zY29wZUlk',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=HoroscopesDetailPage',
        searchReference:
            'reference=OhRIb3Jvc2NvcGVzRGV0YWlsUGFnZVABWhRIb3Jvc2NvcGVzRGV0YWlsUGFnZQ==',
        widgetClassName: 'HoroscopesDetailPage',
      );
}
