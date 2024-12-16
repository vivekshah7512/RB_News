// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

Future<void> getDeviceInfo() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  String deviceId = "Unknown";
  String deviceTypeLocal = "Unknown";
  String deviceInfoString = "Unknown";

  // For Android devices
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.id ?? "Unknown";
    deviceTypeLocal = 'Android';
    deviceInfoString =
        'Manufacturer: ${androidInfo.manufacturer}, Model: ${androidInfo.model}, Version: ${androidInfo.version.release}';

    FFAppState().update(() {
      FFAppState().deviceType = deviceTypeLocal;
      FFAppState().deviceId = deviceId;
      FFAppState().deviceInfo = deviceInfoString;
    });
  }

  // For iOS devices
  else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceId = iosInfo.identifierForVendor ?? "Unknown";
    deviceTypeLocal = 'iOS';
    deviceInfoString =
        'Model: ${iosInfo.model}, Version: ${iosInfo.systemVersion}';

    FFAppState().update(() {
      FFAppState().deviceType = deviceTypeLocal;
      FFAppState().deviceId = deviceId;
      FFAppState().deviceInfo = deviceInfoString;
    });
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
