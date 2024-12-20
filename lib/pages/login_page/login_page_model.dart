import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  Local state fields for this page.

  int? _statusCodeAPI;
  set statusCodeAPI(int? value) {
    _statusCodeAPI = value;
    debugLogWidgetClass(this);
  }

  int? get statusCodeAPI => _statusCodeAPI;

  bool _isUserRegistred = true;
  set isUserRegistred(bool value) {
    _isUserRegistred = value;
    debugLogWidgetClass(this);
  }

  bool get isUserRegistred => _isUserRegistred;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Login-email widget.
  FocusNode? loginEmailFocusNode;
  TextEditingController? loginEmailTextController;
  String? Function(BuildContext, String?)? loginEmailTextControllerValidator;
  String? _loginEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your email id';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please enter valid email id';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (Login API)] action in Login-button widget.
  ApiCallResponse? _apiResultmrl;
  set apiResultmrl(ApiCallResponse? value) {
    _apiResultmrl = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultmrl => _apiResultmrl;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    loginEmailTextControllerValidator = _loginEmailTextControllerValidator;

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    loginEmailFocusNode?.dispose();
    loginEmailTextController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'statusCodeAPI': debugSerializeParam(
            statusCodeAPI,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LoginPage',
            searchReference:
                'reference=QhwKFgoNc3RhdHVzQ29kZUFQSRIFcmVsdzhyAggBUAFaDXN0YXR1c0NvZGVBUEliCUxvZ2luUGFnZQ==',
            name: 'int',
            nullable: true,
          ),
          'isUserRegistred': debugSerializeParam(
            isUserRegistred,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LoginPage',
            searchReference:
                'reference=QikKGAoPaXNVc2VyUmVnaXN0cmVkEgU3MzIxZyoHEgVmYWxzZXIECAUgAVABWg9pc1VzZXJSZWdpc3RyZWRiCUxvZ2luUGFnZQ==',
            name: 'bool',
            nullable: false,
          )
        },
        widgetStates: {
          'loginEmailText': debugSerializeParam(
            loginEmailTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LoginPage',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultmrl': debugSerializeParam(
            apiResultmrl,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LoginPage',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=LoginPage',
        searchReference: 'reference=OglMb2dpblBhZ2VQAVoJTG9naW5QYWdl',
        widgetClassName: 'LoginPage',
      );
}
