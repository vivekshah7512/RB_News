import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'draggable_bootom_sheet_widget.dart' show DraggableBootomSheetWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DraggableBootomSheetModel
    extends FlutterFlowModel<DraggableBootomSheetWidget> {
  ///  Local state fields for this component.

  late LoggableList<String> _commentDatesList = LoggableList([]);
  set commentDatesList(List<String> value) {
    if (value != null) {
      _commentDatesList = LoggableList(value);
    }

    debugLogWidgetClass(this);
  }

  List<String> get commentDatesList =>
      _commentDatesList?..logger = () => debugLogWidgetClass(this);
  void addToCommentDatesList(String item) => commentDatesList.add(item);
  void removeFromCommentDatesList(String item) => commentDatesList.remove(item);
  void removeAtIndexFromCommentDatesList(int index) =>
      commentDatesList.removeAt(index);
  void insertAtIndexInCommentDatesList(int index, String item) =>
      commentDatesList.insert(index, item);
  void updateCommentDatesListAtIndex(int index, Function(String) updateFn) =>
      commentDatesList[index] = updateFn(commentDatesList[index]);

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
          'newsId': debugSerializeParam(
            widget?.newsId,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=DraggableBootomSheet',
            searchReference:
                'reference=Sh0KEAoGbmV3c0lkEgZnOXJzcTIqAxIBMHIECAMgAVAAWgZuZXdzSWQ=',
            name: 'String',
            nullable: false,
          )
        }.withoutNulls,
        localStates: {
          'commentDatesList': debugSerializeParam(
            commentDatesList,
            ParamType.String,
            isList: true,
            link:
                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=DraggableBootomSheet',
            searchReference:
                'reference=QicKGQoQY29tbWVudERhdGVzTGlzdBIFYXVieW0qAhIAcgYSAggDIAFQAFoQY29tbWVudERhdGVzTGlzdGIURHJhZ2dhYmxlQm9vdG9tU2hlZXQ=',
            name: 'String',
            nullable: false,
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
            'https://app.flutterflow.io/project/r-b-news-k9jlh3/tab=uiBuilder&page=DraggableBootomSheet',
        searchReference:
            'reference=OhREcmFnZ2FibGVCb290b21TaGVldFAAWhREcmFnZ2FibGVCb290b21TaGVldA==',
        widgetClassName: 'DraggableBootomSheet',
      );
}
