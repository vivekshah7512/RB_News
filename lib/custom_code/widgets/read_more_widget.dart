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

class ReadMoreWidget extends StatefulWidget {
  final String textContent; // Text content (plain or HTML)
  final int trimCharacters; // Number of characters for "Read More"
  final String trimCollapsedText; // Text for collapsed state
  final String trimExpandedText; // Text for expanded state
  final Color colorClickableText; // Color for "Read More/Less"
  final double? width; // Optional width
  final bool isHtml; // Flag to indicate if the text is HTML

  const ReadMoreWidget({
    required this.textContent,
    this.trimCharacters = 175,
    this.trimCollapsedText = 'વધુ વાંચો',
    this.trimExpandedText = 'ઓછું વાંચો',
    required this.colorClickableText,
    this.width,
    this.isHtml = true, // Default is true (HTML content)
    Key? key,
  }) : super(key: key);

  @override
  _ReadMoreWidgetState createState() => _ReadMoreWidgetState();
}

class _ReadMoreWidgetState extends State<ReadMoreWidget> {
  bool isExpanded = false; // Tracks expanded/collapsed state
  late String displayText;

  @override
  void initState() {
    super.initState();
    _initializeText();
  }

  void _initializeText() {
    if (widget.textContent.length > widget.trimCharacters) {
      displayText =
          widget.textContent.substring(0, widget.trimCharacters) + "...";
    } else {
      displayText = widget.textContent;
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
              widget.isHtml
                  ? Html(
                      data: isExpanded ? widget.textContent : displayText,
                      style: {
                        'body': Style(
                          fontSize: FontSize(16.0),
                          color: const Color(0xFF808080),
                          fontWeight: FontWeight.w400,
                        ),
                      },
                    )
                  : Text(
                      isExpanded ? widget.textContent : displayText,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
              if (widget.textContent.length > widget.trimCharacters)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
            ],
          ),
        );
      },
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
