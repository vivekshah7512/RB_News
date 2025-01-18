import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'advertisement_popup_widget.dart' show AdvertisementPopupWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdvertisementPopupModel
    extends FlutterFlowModel<AdvertisementPopupWidget> {
  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'advertisementImageUrl': debugSerializeParam(
            widget?.advertisementImageUrl,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=AdvertisementPopup',
            searchReference:
                'reference=SicKHwoVYWR2ZXJ0aXNlbWVudEltYWdlVXJsEgZodmJ5aWhyBAgEIABQAFoVYWR2ZXJ0aXNlbWVudEltYWdlVXJs',
            name: 'String',
            nullable: true,
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=AdvertisementPopup',
        searchReference:
            'reference=OhJBZHZlcnRpc2VtZW50UG9wdXBQAFoSQWR2ZXJ0aXNlbWVudFBvcHVw',
        widgetClassName: 'AdvertisementPopup',
      );
}
