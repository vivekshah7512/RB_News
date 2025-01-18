// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  final List<String> titles;
  final double width;
  final double height;
  final Color activeColor;
  final Color inactiveColor;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.titles,
    required this.width,
    required this.height,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF), // Background color
        boxShadow: [
          BoxShadow(
            color: Color(0xFFE6E6E6), // Top elevation
            blurRadius: 1,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(titles.length, (index) {
          final isActive = currentIndex == index;
          return GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  _getImagePath(index, isActive),
                  width: 24,
                  height: 24,
                ),
                SizedBox(height: 4),
                Text(
                  titles[index],
                  style: TextStyle(
                    color: isActive ? activeColor : inactiveColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  /// Get image path based on index and active state
  String _getImagePath(int index, bool isActive) {
    const activeImages = [
      'assets/images/home_active.svg',
      'assets/images/news_active.svg',
      'assets/images/property_active.svg',
      'assets/images/horoscopes_active.svg',
      'assets/images/user_active.svg',
    ];

    const inactiveImages = [
      'assets/images/home_inactive.svg',
      'assets/images/news_inactive.svg',
      'assets/images/property_inactive.svg',
      'assets/images/horoscopes_inactive.svg',
      'assets/images/user_inactive.svg',
    ];

    return isActive ? activeImages[index] : inactiveImages[index];
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
