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

import 'package:flutter_svg/flutter_svg.dart';

class ImageNetworkWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;

  ImageNetworkWidget({required this.url, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    // Check the file extension (if the URL is a .svg, .png, or .jpg)
    if (url.toLowerCase().endsWith('.svg')) {
      // Load the SVG image from network
      return SvgPicture.network(
        url,
        width: width ?? 32.0, // Default width if not provided
        height: height ?? 32.0, // Default height if not provided
        placeholderBuilder: (context) => Center(
          child: SizedBox(
            width: 40, // Set loader width to 40px
            height: 40, // Set loader height to 40px
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else {
      // Load PNG or JPG images from network
      return Image.network(
        url,
        width: width ?? 32.0, // Default width if not provided
        height: height ?? 32.0, // Default height if not provided
        loadingBuilder: (context, child, progress) {
          if (progress == null) {
            return child;
          } else {
            return Center(
              child: SizedBox(
                width: 40, // Set loader width to 40px
                height: 40, // Set loader height to 40px
                child: CircularProgressIndicator(
                  value: progress.cumulativeBytesLoaded /
                      (progress.expectedTotalBytes ?? 1),
                ),
              ),
            );
          }
        },
      );
    }
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
