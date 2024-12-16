// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// BEGIN FUNCTION
import 'package:geolocator/geolocator.dart';

Future<void> getCurrentLatLng() async {
  // Request permission to access location
  LocationPermission permission = await Geolocator.requestPermission();

  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    throw Exception('Location permissions are denied');
  }

  // Get current location
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  FFAppState().update(() {
    FFAppState().latitude = position.latitude.toString();
    FFAppState().longitude = position.longitude.toString();
  });

  // Return latitude and longitude as a Map
  /*return {
    'latitude': position.latitude,
    'longitude': position.longitude,
  };*/
}
// END FUNCTION

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
