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
  if (apiDate == null) {
    return null;
  }

  try {
    DateTime date = DateTime.parse(apiDate);
    DateTime now = DateTime.now();

    String formattedTime =
        "${date.hour % 12 == 0 ? 12 : date.hour % 12}:${date.minute.toString().padLeft(2, '0')} ${date.hour >= 12 ? 'PM' : 'AM'}";

    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return 'Today, $formattedTime';
    }

    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1) {
      return 'Yesterday, $formattedTime';
    }
    String formattedDate =
        "${date.day} ${_getMonthName(date.month)} ${date.year}";
    return "$formattedDate, $formattedTime";
  } catch (e) {
    return "Invalid Date";
  }
}

/// Helper function to get the month name.
String _getMonthName(int month) {
  const monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  return monthNames[month - 1];
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
  if (result % 1 != 0) {
    return result.toInt() + 1; // Round up to the nearest integer
  }

  // Otherwise, return the rounded integer
  return result.toInt();
}

String? newCustomFunction() {
  // Return the list as a comma-separated string
  return "";
}

bool? areNumbersEqual(
  String num1,
  int num2,
) {
  try {
    int number = int.parse(num1);
    return number == num2;
  } catch (e) {
    // Return null if the string cannot be parsed as an integer
    return null;
  }
}

Color getColor(
  List<Color> colors,
  int index,
) {
  if (colors.isEmpty) {
    return Colors.transparent; // Default fallback color if list is empty
  }

  return colors[index % colors.length];
}

String? getSingleString(
  String? inputString,
  int index,
) {
  if (inputString == null || inputString.isEmpty) {
    return ''; // Return an empty string or handle the null case as needed
  }
  return inputString.split(',')[index].trim();
}

bool shouldShowText(
  List<String> list,
  int index,
) {
  if (index == 0) {
    return true; // Always show text for index 0
  }

  if (list[index] == list[index - 1]) {
    return true; // Show text if the current value is the same as the previous one
  }

  return false;
}

bool isValidPincode(String otp) {
  return otp != null && otp.isNotEmpty && otp.length == 4;
}

String getFirstChar(String input) {
  if (input.isEmpty) {
    return "RB"; // Return an empty string if the input is empty
  }
  return input[0].toUpperCase();
}

String? horoscopeDateRangeFormat(String dateTimeString) {
  try {
    // Parse the input string into a DateTime object
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Get the month and day
    int month = dateTime.month;
    int day = dateTime.day;

    // Map month number to month name
    List<String> monthNames = [
      "Jan",
      "Feb",
      "March",
      "April",
      "May",
      "June",
      "July",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    String monthName = monthNames[month - 1]; // Month is 1-based

    // Return the formatted "Month Day" string
    return '$monthName $day';
  } catch (e) {
    // Return an empty string if parsing fails
    return '';
  }
}

bool? isValidTextView(String? textString) {
  return textString != null && textString.isNotEmpty;
}
