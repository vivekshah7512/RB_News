// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:readmore/readmore.dart';

class ReadMoreWidget extends StatelessWidget {
  final String textContent;
  final int trimLines;
  final String trimCollapsedText;
  final String trimExpandedText;
  final Color colorClickableText;
  final double? width; // Optional width

  ReadMoreWidget({
    required this.textContent,
    required this.trimLines,
    required this.trimCollapsedText,
    required this.trimExpandedText,
    required this.colorClickableText,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to calculate height dynamically
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = width ?? constraints.maxWidth;
        return Container(
          width: maxWidth,
          child: ReadMoreText(
            textContent,
            trimLines: trimLines,
            trimMode: TrimMode.Line,
            trimCollapsedText: trimCollapsedText,
            trimExpandedText: trimExpandedText,
            style: TextStyle(fontSize: 16, color: Colors.black),
            moreStyle: TextStyle(fontSize: 16, color: colorClickableText),
            lessStyle: TextStyle(fontSize: 16, color: colorClickableText),
          ),
        );
      },
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
