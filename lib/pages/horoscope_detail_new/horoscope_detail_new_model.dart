import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'horoscope_detail_new_widget.dart' show HoroscopeDetailNewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HoroscopeDetailNewModel
    extends FlutterFlowModel<HoroscopeDetailNewWidget> {
  ///  Local state fields for this page.

  late LoggableList<dynamic> _zodiacListPageStateArray = LoggableList([]);
  set zodiacListPageStateArray(List<dynamic> value) {
    if (value != null) {
      _zodiacListPageStateArray = LoggableList(value);
    }

    debugLogWidgetClass(this);
  }

  List<dynamic> get zodiacListPageStateArray =>
      _zodiacListPageStateArray?..logger = () => debugLogWidgetClass(this);
  void addToZodiacListPageStateArray(dynamic item) =>
      zodiacListPageStateArray.add(item);
  void removeFromZodiacListPageStateArray(dynamic item) =>
      zodiacListPageStateArray.remove(item);
  void removeAtIndexFromZodiacListPageStateArray(int index) =>
      zodiacListPageStateArray.removeAt(index);
  void insertAtIndexInZodiacListPageStateArray(int index, dynamic item) =>
      zodiacListPageStateArray.insert(index, item);
  void updateZodiacListPageStateArrayAtIndex(
          int index, Function(dynamic) updateFn) =>
      zodiacListPageStateArray[index] =
          updateFn(zodiacListPageStateArray[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (ZodiacList)] action in HoroscopeDetailNew widget.
  ApiCallResponse? _apiResultnoa;
  set apiResultnoa(ApiCallResponse? value) {
    _apiResultnoa = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultnoa => _apiResultnoa;

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
          'zodiacSignId': debugSerializeParam(
            widget?.zodiacSignId,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HoroscopeDetailNew',
            searchReference:
                'reference=SiMKFgoMem9kaWFjU2lnbklkEgY2dWV6M2cqAxIBMHIECAMgAVABWgx6b2RpYWNTaWduSWQ=',
            name: 'String',
            nullable: false,
          ),
          'currentZodiacIndex': debugSerializeParam(
            widget?.currentZodiacIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HoroscopeDetailNew',
            searchReference:
                'reference=SikKHAoSY3VycmVudFpvZGlhY0luZGV4EgY2dTlxNmIqAxIBMHIECAEgAFABWhJjdXJyZW50Wm9kaWFjSW5kZXg=',
            name: 'int',
            nullable: false,
          ),
          'zodiacListArray': debugSerializeParam(
            widget?.zodiacListArray,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HoroscopeDetailNew',
            searchReference:
                'reference=SiMKGQoPem9kaWFjTGlzdEFycmF5EgZhMDg3NmRyBhICCAkgAFABWg96b2RpYWNMaXN0QXJyYXk=',
            name: 'dynamic',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'zodiacListPageStateArray': debugSerializeParam(
            zodiacListPageStateArray,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HoroscopeDetailNew',
            searchReference:
                'reference=QikKIQoYem9kaWFjTGlzdFBhZ2VTdGF0ZUFycmF5EgV3dGRieXIEEgIICVABWhh6b2RpYWNMaXN0UGFnZVN0YXRlQXJyYXliEkhvcm9zY29wZURldGFpbE5ldw==',
            name: 'dynamic',
            nullable: false,
          )
        },
        widgetStates: {
          'pageViewCurrentIndex': debugSerializeParam(
            pageViewCurrentIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HoroscopeDetailNew',
            name: 'int',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultnoa': debugSerializeParam(
            apiResultnoa,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HoroscopeDetailNew',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=HoroscopeDetailNew',
        searchReference:
            'reference=OhJIb3Jvc2NvcGVEZXRhaWxOZXdQAVoSSG9yb3Njb3BlRGV0YWlsTmV3',
        widgetClassName: 'HoroscopeDetailNew',
      );
}
