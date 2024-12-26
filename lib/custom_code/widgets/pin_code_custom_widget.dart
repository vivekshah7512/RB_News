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

import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeCustomWidget extends StatefulWidget {
  final Function(String) onCompleted;

  PinCodeCustomWidget({required this.onCompleted});

  @override
  _PinCodeCustomWidgetState createState() => _PinCodeCustomWidgetState();
}

class _PinCodeCustomWidgetState extends State<PinCodeCustomWidget> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: textEditingController,
      appContext: context,
      length: 4, // Set the number of digits
      obscureText: false, // Set to false for no hidden characters
      animationType: AnimationType.none, // Disable the animation
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.underline, // You can customize the field shape
        fieldHeight: 50,
        fieldWidth: 40,
        inactiveColor: Colors.grey,
        activeColor: Colors.blue,
        selectedColor: Colors.blue,
      ),
      onChanged: (value) {
        currentText = value;
      },
      onCompleted: widget.onCompleted, // Callback when the PIN code is entered
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
