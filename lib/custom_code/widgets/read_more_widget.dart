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
  bool showReadMore = false; // Flag to control visibility of Read More

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkTextOverflow());
  }

  void _checkTextOverflow() {
    // Create a TextPainter to measure text size
    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.textContent,
        style: TextStyle(
          fontSize: 16.0, // Match font size used in the widget
          color: Color(0xFF808080),
          fontWeight: FontWeight.w400,
        ),
      ),
      maxLines: widget.trimLines,
    );

    textPainter.layout(maxWidth: widget.width ?? double.infinity);

    // Check if text overflows the trimLines
    if (textPainter.didExceedMaxLines) {
      setState(() {
        showReadMore = true;
      });
    }
  }

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
                          fontSize: FontSize(16.0), // Text size 16px
                          color: Color(0xFF808080), // Text color #808080
                          fontWeight: FontWeight.w400, // Text weight 400
                          maxLines: isExpanded ? null : widget.trimLines,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        'p': Style(
                          margin: Margins
                              .zero, // Remove default margin for <p> tags
                          padding:
                              HtmlPaddings.zero, // Remove padding for <p> tags
                        ),
                      },
                    )
                  : Text(
                      widget.textContent,
                      style: TextStyle(
                        fontSize: 16.0, // Text size 16px
                        color: Color(0xFF808080), // Text color #808080
                        fontWeight: FontWeight.w400, // Text weight 400
                      ),
                      maxLines: isExpanded ? null : widget.trimLines,
                      overflow: TextOverflow.ellipsis,
                    ),
              if (showReadMore)
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
                      fontSize: 16.0, // Text size 16px
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
