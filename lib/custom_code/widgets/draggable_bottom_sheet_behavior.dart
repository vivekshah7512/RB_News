// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class DraggableBottomSheetBehavior extends StatefulWidget {
  final double initialHeight; // Initial height percentage (0.0 to 1.0)
  final double minHeight; // Minimum height percentage (0.0 to 1.0)
  final double maxHeight; // Maximum height percentage (0.0 to 1.0)

  const DraggableBottomSheetBehavior({
    Key? key,
    required this.initialHeight,
    required this.minHeight,
    required this.maxHeight,
  }) : super(key: key);

  @override
  _DraggableBottomSheetBehaviorState createState() =>
      _DraggableBottomSheetBehaviorState();
}

class _DraggableBottomSheetBehaviorState
    extends State<DraggableBottomSheetBehavior> {
  late double _currentHeight;

  @override
  void initState() {
    super.initState();
    _currentHeight = widget.initialHeight; // Set initial height
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight * widget.maxHeight;
        final minHeight = constraints.maxHeight * widget.minHeight;

        return GestureDetector(
          onVerticalDragUpdate: (details) {
            setState(() {
              _currentHeight = (_currentHeight +
                      details.primaryDelta! / constraints.maxHeight)
                  .clamp(widget.minHeight, widget.maxHeight);
            });
          },
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: _currentHeight * constraints.maxHeight,
              width: double.infinity,
              color: Colors.transparent, // Behavior-only, no specific UI
            ),
          ),
        );
      },
    );
  }
}
