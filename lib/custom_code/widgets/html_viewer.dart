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

import 'package:flutter_html/flutter_html.dart';

class HtmlViewer extends StatelessWidget {
  final String htmlContent;
  final double height;
  final double width;

  HtmlViewer({
    required this.htmlContent,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 22.0, // Minimum height for single-line content
            maxHeight: 40.0, // Maximum height for two lines
          ),
          child: SizedBox(
            width: double.infinity, // Set width to infinite
            child: Html(
              data: htmlContent,
              style: {
                "body": Style(
                  textAlign: TextAlign.left,
                  margin: Margins.zero,
                  padding: HtmlPaddings.zero,
                  textOverflow:
                      TextOverflow.ellipsis, // Show ellipsis if overflow
                  color: Color(0xFF808080),
                  fontSize: FontSize(14.0),
                  maxLines: 2, // Limit to 2 lines maximum
                  fontWeight: FontWeight.w500,
                ),
                "p": Style(
                  margin: Margins.zero,
                  padding: HtmlPaddings.zero,
                ),
              },
            ),
          ),
        );
      },
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
