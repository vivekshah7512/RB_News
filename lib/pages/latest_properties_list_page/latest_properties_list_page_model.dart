import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'latest_properties_list_page_widget.dart'
    show LatestPropertiesListPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LatestPropertiesListPageModel
    extends FlutterFlowModel<LatestPropertiesListPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Latest Property List )] action in LatestPropertiesListPage widget.
  ApiCallResponse? _apiResult4pq;
  set apiResult4pq(ApiCallResponse? value) {
    _apiResult4pq = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult4pq => _apiResult4pq;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Latest Property List )] action in Button widget.
  ApiCallResponse? _apiResultz0zCopy;
  set apiResultz0zCopy(ApiCallResponse? value) {
    _apiResultz0zCopy = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultz0zCopy => _apiResultz0zCopy;

  // Stores action output result for [Backend Call - API (Latest Property List )] action in Button widget.
  ApiCallResponse? _apiResultg10Copy;
  set apiResultg10Copy(ApiCallResponse? value) {
    _apiResultg10Copy = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultg10Copy => _apiResultg10Copy;

  // Stores action output result for [Backend Call - API (Latest Property List )] action in Button widget.
  ApiCallResponse? _apiResultz0z;
  set apiResultz0z(ApiCallResponse? value) {
    _apiResultz0z = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultz0z => _apiResultz0z;

  // Stores action output result for [Backend Call - API (Latest Property List )] action in Button widget.
  ApiCallResponse? _apiResultg10;
  set apiResultg10(ApiCallResponse? value) {
    _apiResultg10 = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultg10 => _apiResultg10;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'propertyType': debugSerializeParam(
            widget?.propertyType,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LatestPropertiesListPage',
            searchReference:
                'reference=SiUKFgoMcHJvcGVydHlUeXBlEgZ0aW9taWkqBRIDYWxscgQIAyABUAFaDHByb3BlcnR5VHlwZQ==',
            name: 'String',
            nullable: false,
          ),
          'propertyTitle': debugSerializeParam(
            widget?.propertyTitle,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LatestPropertiesListPage',
            searchReference:
                'reference=Sj8KFwoNcHJvcGVydHlUaXRsZRIGdTBuaGk4Kh4SHOCqpOCqruCqvuCqriDgqq7gqr/gqrLgqpXgqqRyBAgDIAFQAVoNcHJvcGVydHlUaXRsZQ==',
            name: 'String',
            nullable: false,
          )
        }.withoutNulls,
        widgetStates: {
          'textFieldText': debugSerializeParam(
            textController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LatestPropertiesListPage',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResult4pq': debugSerializeParam(
            apiResult4pq,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LatestPropertiesListPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultz0zCopy': debugSerializeParam(
            apiResultz0zCopy,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LatestPropertiesListPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultg10Copy': debugSerializeParam(
            apiResultg10Copy,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LatestPropertiesListPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultz0z': debugSerializeParam(
            apiResultz0z,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LatestPropertiesListPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultg10': debugSerializeParam(
            apiResultg10,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LatestPropertiesListPage',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=LatestPropertiesListPage',
        searchReference:
            'reference=OhhMYXRlc3RQcm9wZXJ0aWVzTGlzdFBhZ2VQAVoYTGF0ZXN0UHJvcGVydGllc0xpc3RQYWdl',
        widgetClassName: 'LatestPropertiesListPage',
      );
}
