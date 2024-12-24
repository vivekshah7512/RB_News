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

class ReadMoreWidget extends StatefulWidget {
  final String textContent; // Text content (plain or HTML)
  final int trimLines;
  final String trimCollapsedText;
  final String trimExpandedText;
  final Color colorClickableText;
  final double? width; // Optional width
  final bool isHtml; // Flag to indicate if the text is HTML

  ReadMoreWidget({
    required this.textContent,
    required this.trimLines,
    required this.trimCollapsedText,
    required this.trimExpandedText,
    required this.colorClickableText,
    this.width,
    this.isHtml = false, // Default is plain text
  });

  @override
  _ReadMoreWidgetState createState() => _ReadMoreWidgetState();
}

class _ReadMoreWidgetState extends State<ReadMoreWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = widget.width ?? constraints.maxWidth;

        return Container(
          width: maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Render content
              widget.isHtml
                  ? Html(
                      data: widget.textContent,
                      style: {
                        'body': Style(
                          fontSize: FontSize(16.0),
                          color: Colors.black,
                          maxLines: isExpanded ? null : widget.trimLines,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      },
                    )
                  : Text(
                      widget.textContent,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      maxLines: isExpanded ? null : widget.trimLines,
                      overflow: TextOverflow.ellipsis,
                    ),
              // "Read More" or "Read Less" button
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded
                      ? widget.trimExpandedText
                      : widget.trimCollapsedText,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: widget.colorClickableText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
