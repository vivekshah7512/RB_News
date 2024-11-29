import '/flutter_flow/flutter_flow_util.dart';
import 'all_properties_list_page_widget.dart' show AllPropertiesListPageWidget;
import 'package:flutter/material.dart';

class AllPropertiesListPageModel
    extends FlutterFlowModel<AllPropertiesListPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
