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

class BackNavigationExample extends StatelessWidget {
  final double height;
  final double width;

  BackNavigationExample({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          // Logic for back navigation
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Confirm Exit'),
              content: Text('Do you really want to go back?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Yes'),
                ),
              ],
            ),
          );

          return shouldPop ?? false; // Prevent back navigation if null
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('WillPopScope Example'),
          ),
          body: Center(
            child: SizedBox(
              width: width, // Use the provided width
              height: height, // Use the provided height
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Trigger back navigation manually
                },
                child: Text('Go Back'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(BackNavigationExample(
      height: 50, width: 150)); // Pass height and width here
}
