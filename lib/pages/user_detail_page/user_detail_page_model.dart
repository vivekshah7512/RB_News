import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/edit_profile_popup/edit_profile_popup_widget.dart';
import 'dart:ui';
import 'user_detail_page_widget.dart' show UserDetailPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserDetailPageModel extends FlutterFlowModel<UserDetailPageWidget> {
  ///  Local state fields for this page.

  String? _termsAndConditionLink;
  set termsAndConditionLink(String? value) {
    _termsAndConditionLink = value;
    debugLogWidgetClass(this);
  }

  String? get termsAndConditionLink => _termsAndConditionLink;

  String? _privacyPolicyLink;
  set privacyPolicyLink(String? value) {
    _privacyPolicyLink = value;
    debugLogWidgetClass(this);
  }

  String? get privacyPolicyLink => _privacyPolicyLink;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Static Link)] action in UserDetailPage widget.
  ApiCallResponse? _apiResultpt3;
  set apiResultpt3(ApiCallResponse? value) {
    _apiResultpt3 = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultpt3 => _apiResultpt3;

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
        localStates: {
          'termsAndConditionLink': debugSerializeParam(
            termsAndConditionLink,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=UserDetailPage',
            searchReference:
                'reference=QioKHgoVdGVybXNBbmRDb25kaXRpb25MaW5rEgV5ZXN0OCoCEgByBAgDIABQAVoVdGVybXNBbmRDb25kaXRpb25MaW5rYg5Vc2VyRGV0YWlsUGFnZQ==',
            name: 'String',
            nullable: true,
          ),
          'privacyPolicyLink': debugSerializeParam(
            privacyPolicyLink,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=UserDetailPage',
            searchReference:
                'reference=QiYKGgoRcHJpdmFjeVBvbGljeUxpbmsSBXZmZ2U5KgISAHIECAMgAFABWhFwcml2YWN5UG9saWN5TGlua2IOVXNlckRldGFpbFBhZ2U=',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultpt3': debugSerializeParam(
            apiResultpt3,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=UserDetailPage',
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=UserDetailPage',
        searchReference:
            'reference=Og5Vc2VyRGV0YWlsUGFnZVABWg5Vc2VyRGV0YWlsUGFnZQ==',
        widgetClassName: 'UserDetailPage',
      );
}
