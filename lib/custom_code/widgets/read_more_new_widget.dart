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
import 'dart:ui' as ui;

class ReadMoreNewWidget extends StatefulWidget {
  final String textContent; // Text content (plain or HTML)
  final String trimCollapsedText; // Text for collapsed state
  final String trimExpandedText; // Text for expanded state
  final Color colorClickableText; // Color for "Read More/Less"
  final double? width; // Optional width
  final bool isHtml; // Flag to indicate if the text is HTML

  const ReadMoreNewWidget({
    required this.textContent,
    required this.trimCollapsedText,
    required this.trimExpandedText,
    required this.colorClickableText,
    this.width,
    this.isHtml = false, // Default is plain text
    Key? key,
  }) : super(key: key);

  @override
  _ReadMoreNewWidgetState createState() => _ReadMoreNewWidgetState();
}

class _ReadMoreNewWidgetState extends State<ReadMoreNewWidget> {
  bool isExpanded = false;
  late String collapsedText;
  late String fullText;

  @override
  void initState() {
    super.initState();
    _initializeText();
  }

  void _initializeText() {
    final textDirection = Directionality.maybeOf(context) ?? TextDirection.LTR;
    final textPainter = TextPainter(
        text: TextSpan(
          text: widget.textContent,
          style: const TextStyle(
            fontSize: 16.0,
            color: Color(0xFF808080),
            fontWeight: FontWeight.w400,
          ),
        ),
        maxLines: 3,
        textDirection: ui.TextDirection.ltr);

    textPainter.layout(maxWidth: widget.width ?? double.infinity);

    if (textPainter.didExceedMaxLines) {
      final endIndex = textPainter
          .getPositionForOffset(
            textPainter.getOffsetForCaret(
              TextPosition(offset: textPainter.text!.toPlainText().length),
              Rect.zero,
            ),
          )
          .offset;
      collapsedText = widget.textContent.substring(0, endIndex).trim() +
          '... ${widget.trimCollapsedText}';
      fullText = widget.textContent;
    } else {
      collapsedText = widget.textContent;
      fullText = widget.textContent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayText = isExpanded ? fullText : collapsedText;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = widget.width ?? constraints.maxWidth;

        return Container(
          width: maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.isHtml
                  ? Html(
                      data: displayText,
                      style: {
                        'body': Style(
                          fontSize: FontSize(16.0),
                          color: const Color(0xFF808080),
                          fontWeight: FontWeight.w400,
                        ),
                      },
                    )
                  : Text(
                      displayText,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
              if (collapsedText != fullText)
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
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
