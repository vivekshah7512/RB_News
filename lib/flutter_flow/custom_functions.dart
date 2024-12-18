import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

String? formateAPIDate(String? apiDate) {
  // format the date in today, yesterday, week ago and months ago. the date is parameter and return string of  formatted date.
  if (apiDate == null) {
    return null;
  }

  DateTime date = DateTime.parse(apiDate);
  DateTime now = DateTime.now();

  if (date.year == now.year && date.month == now.month && date.day == now.day) {
    return 'Today';
  }

  if (date.year == now.year &&
      date.month == now.month &&
      date.day == now.day - 1) {
    return 'Yesterday';
  }

  if (date.isAfter(now.subtract(Duration(days: 7))) && date.isBefore(now)) {
    return timeago.format(date, locale: 'en_short');
  }

  if (date.year == now.year && date.month == now.month) {
    return DateFormat('dd MMM').format(date);
  }

  return DateFormat('dd MMM yyyy').format(date);
}

String? getTodayDate() {
  // custom functiona name getTodayDate that return todays date in string formate yyyy-mm-dd this formate
  return DateFormat('yyyy-MM-dd').format(DateTime.now());
}

int getDivideVars(
  int? varA,
  int? varB,
) {
  if (varA == null || varB == null || varB == 0) {
    return 0; // Return 0 if inputs are null or division by zero
  }
  // Perform division as a double
  double result = varA / varB;

  // Check if the result ends in .5 and round up
  if (result % 1 == 0.5) {
    return result.ceil(); // Round up to the nearest integer
  }

  // Otherwise, return the rounded integer
  return result.round();
}

String? newCustomFunction() {
  // Return the list as a comma-separated string
  return "";
}
