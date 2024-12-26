// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

List<SelectedNewsCategoryDataStruct>? manageNewsCategoryFilter(
  String? filterName,
  int? filterId,
  bool? isChecked,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

//  List<SelectedNewsCategoryDataStruct> selectedCategories = [];

  List<SelectedNewsCategoryDataStruct> selectedCategories = [];

  selectedCategories = List<SelectedNewsCategoryDataStruct>.from(
      FFAppState().selectedNewsCategoryTop);

  // Check if the provided filterName and filterId are not null
  if (filterName != null && filterId != null) {
    // Check if the ID already exists in the list
    int existingIndex =
        selectedCategories.indexWhere((category) => category.id == filterId);

    if (existingIndex != -1) {
      // If the ID exists, remove it
      selectedCategories.removeAt(existingIndex);
      FFAppState().update(() {
        FFAppState().selectedNewsCategoryTop.removeAt(existingIndex);
      });
    } else {
      // If the ID does not exist, add a new entry
      SelectedNewsCategoryDataStruct category = SelectedNewsCategoryDataStruct(
        name: filterName,
        id: filterId,
      );
      FFAppState().update(() {
        FFAppState().selectedNewsCategoryTop.add(category);
      });
      selectedCategories.add(category);
    }
  }

  FFAppState().update(() {
    FFAppState().selectedFilterIds = FFAppState()
        .selectedNewsCategoryTop
        .map((category) => category.id.toString())
        .join(',');
  });
  // Return the updated list
  return selectedCategories;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
