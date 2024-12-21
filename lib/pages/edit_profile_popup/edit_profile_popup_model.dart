import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_profile_popup_widget.dart' show EditProfilePopupWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfilePopupModel extends FlutterFlowModel<EditProfilePopupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (Edit Profile)] action in Button widget.
  ApiCallResponse? _apiResultu1e;
  set apiResultu1e(ApiCallResponse? value) {
    _apiResultu1e = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultu1e => _apiResultu1e;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'userName': debugSerializeParam(
            widget?.userName,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=EditProfilePopup',
            searchReference:
                'reference=SiIKEgoIdXNlck5hbWUSBmdnbDd4YyoGEgR0ZXN0cgQIAyABUABaCHVzZXJOYW1l',
            name: 'String',
            nullable: false,
          ),
          'userPhone': debugSerializeParam(
            widget?.userPhone,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=EditProfilePopup',
            searchReference:
                'reference=SiIKEwoJdXNlclBob25lEgZreGl3cTkqBRIDMTIzcgQIAyABUABaCXVzZXJQaG9uZQ==',
            name: 'String',
            nullable: false,
          )
        }.withoutNulls,
        widgetStates: {
          'textFieldText1': debugSerializeParam(
            textController1?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=EditProfilePopup',
            name: 'String',
            nullable: true,
          ),
          'textFieldText2': debugSerializeParam(
            textController2?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=EditProfilePopup',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultu1e': debugSerializeParam(
            apiResultu1e,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=EditProfilePopup',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=EditProfilePopup',
        searchReference:
            'reference=OhBFZGl0UHJvZmlsZVBvcHVwUABaEEVkaXRQcm9maWxlUG9wdXA=',
        widgetClassName: 'EditProfilePopup',
      );
}
