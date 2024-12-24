// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

String? selectedNewsCategories(
  String? id,
  bool? isChecked,
  String? selectedCategoryString,
) {
  List<int> selectedCategoryIds = [];
  selectedCategoryIds = List<int>.from(FFAppState().selectedNewsCategoryTop);

  List<dynamic> selectedCategoryList =
      List<dynamic>.from(FFAppState().selectedNewsCategoryTop);

  if (id != null) {
    int categoryId = int.tryParse(id) ?? 0; // Convert String to int safely
    if (categoryId != 0) {
      if (isChecked == true) {
        if (!selectedCategoryIds.contains(categoryId)) {
          selectedCategoryIds.add(categoryId); // Add ID
          FFAppState().update(() {
            FFAppState().selectedNewsCategory.add(categoryId);
            if (selectedCategoryString != null &&
                selectedCategoryString.isNotEmpty) {
              FFAppState()
                  .selectedNewsCatStringArray
                  .add(selectedCategoryString); // Add String
            }
          });
        }
      } else {
        selectedCategoryIds.remove(categoryId); // Remove ID
        int index = FFAppState().selectedNewsCategory.indexOf(categoryId);

        if (index != -1) {
          FFAppState().update(() {
            FFAppState().selectedNewsCategory.remove(categoryId);
            if (index < FFAppState().selectedNewsCatStringArray.length) {
              FFAppState().selectedNewsCatStringArray.removeAt(index);
            }
          });
        }
      }
    }
  }

  // Return the list as a comma-separated string
  return FFAppState().selectedNewsCategory.join(',');
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
