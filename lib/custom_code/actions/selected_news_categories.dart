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
  String? name,
) {
  final selectedCategoryMap = Map<int, String>.from(
    FFAppState().selectedNewsCategoryTop as Map,
  );
  if (id != null) {
    int categoryId = int.tryParse(id) ?? 0; // Convert String to int safely
    if (categoryId != 0) {
      final newCategory = {
        'id': categoryId,
        'name': name,
      };

      if (isChecked == true) {
        // Add the object if it doesn't already exist in the list
        if (!selectedCategoryMap.containsKey(categoryId)) {
          selectedCategoryMap[categoryId] = name!;
          FFAppState().update(() {
            FFAppState().selectedNewsCategoryTop = selectedCategoryMap as List<SelectedNewsCategoryDataStruct>;
          });
        }
      } else {
        // Remove the object if it exists in the list
        selectedCategoryMap.remove(categoryId);
        FFAppState().update(() {
          FFAppState().selectedNewsCategoryTop = selectedCategoryMap as List<SelectedNewsCategoryDataStruct>;
        });
      }
    }
  }

  // Return the list as a comma-separated string
  return selectedCategoryMap.values.join(',');
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
