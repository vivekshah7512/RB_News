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
    return SizedBox(
      height: height,
      width: width,
      child: Html(
        data: htmlContent,
        style: {
          "body": Style(
            textAlign: TextAlign.left, // Align text to the left
            margin: Margins.zero, // Set margin to zero
            padding: HtmlPaddings.zero,
            textOverflow: TextOverflow.ellipsis, // Show ellipsis for overflow
            color: Color(0xFF808080), // Set text color to #808080
            fontSize: FontSize(14.0), // Set font size to 14
            maxLines: 2, // Set max lines to 2
            fontWeight: FontWeight.w500, // Set font type to medium
          ),
          "p": Style(
            margin: Margins.zero, // Remove default margin for <p> tags
            padding: HtmlPaddings.zero, // Remove padding for <p> tags
          ),
        },
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
