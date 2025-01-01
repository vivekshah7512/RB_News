import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_t_p_verification_page_widget.dart' show OTPVerificationPageWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class OTPVerificationPageModel
    extends FlutterFlowModel<OTPVerificationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - startDecrementingTimer] action in OTPVerificationPage widget.
  int? _updatedTimer;
  set updatedTimer(int? value) {
    _updatedTimer = value;
    debugLogWidgetClass(this);
  }

  int? get updatedTimer => _updatedTimer;

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (OTP Varification)] action in Button widget.
  ApiCallResponse? _apiResultup6CopyCopy;
  set apiResultup6CopyCopy(ApiCallResponse? value) {
    _apiResultup6CopyCopy = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultup6CopyCopy => _apiResultup6CopyCopy;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(this);
      });

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'emailAddress': debugSerializeParam(
            widget?.emailAddress,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=OTPVerificationPage',
            searchReference:
                'reference=SicKFgoMZW1haWxBZGRyZXNzEgZ6ZnFqZHkqBxIFZW1haWxyBAgDIAFQAVoMZW1haWxBZGRyZXNz',
            name: 'String',
            nullable: false,
          ),
          'timerSeconds': debugSerializeParam(
            widget?.timerSeconds,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=OTPVerificationPage',
            searchReference:
                'reference=SiYKFgoMdGltZXJTZWNvbmRzEgY5ZHAzZjEqBhIEdHJ1ZXIECAUgAVABWgx0aW1lclNlY29uZHM=',
            name: 'bool',
            nullable: false,
          ),
          'resendTextState': debugSerializeParam(
            widget?.resendTextState,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=OTPVerificationPage',
            searchReference:
                'reference=SiYKGQoPcmVzZW5kVGV4dFN0YXRlEgY0YXBid3kqAxIBMHIECAEgAVABWg9yZXNlbmRUZXh0U3RhdGU=',
            name: 'int',
            nullable: false,
          )
        }.withoutNulls,
        widgetStates: {
          'pinCodeText': debugSerializeParam(
            pinCodeController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=OTPVerificationPage',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'updatedTimer': debugSerializeParam(
            updatedTimer,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=OTPVerificationPage',
            name: 'int',
            nullable: true,
          ),
          'apiResultup6CopyCopy': debugSerializeParam(
            apiResultup6CopyCopy,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=OTPVerificationPage',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=OTPVerificationPage',
        searchReference:
            'reference=OhNPVFBWZXJpZmljYXRpb25QYWdlUAFaE09UUFZlcmlmaWNhdGlvblBhZ2U=',
        widgetClassName: 'OTPVerificationPage',
      );
}
