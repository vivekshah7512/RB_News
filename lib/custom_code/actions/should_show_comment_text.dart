// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

bool shouldShowCommentText(
  List<String> list,
  int index,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  if (index == 0) {
    return true; // Always show text for index 0
  }

  if (list[index] == list[index - 1]) {
    return true; // Show text if the current value is the same as the previous one
  }

  return false;
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
}
