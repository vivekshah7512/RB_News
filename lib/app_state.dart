import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _TimerSeconds = 1;
  int get TimerSeconds => _TimerSeconds;
  set TimerSeconds(int value) {
    _TimerSeconds = value;
  }

  bool _IsStartedTIMER = true;
  bool get IsStartedTIMER => _IsStartedTIMER;
  set IsStartedTIMER(bool value) {
    _IsStartedTIMER = value;
  }

  int _resendTimerVisible = 0;
  int get resendTimerVisible => _resendTimerVisible;
  set resendTimerVisible(int value) {
    _resendTimerVisible = value;
  }

  String _userEmail = '';
  String get userEmail => _userEmail;
  set userEmail(String value) {
    _userEmail = value;
  }

  String _deviceType = '';
  String get deviceType => _deviceType;
  set deviceType(String value) {
    _deviceType = value;
  }

  String _deviceId = '';
  String get deviceId => _deviceId;
  set deviceId(String value) {
    _deviceId = value;
  }

  String _deviceToken = '';
  String get deviceToken => _deviceToken;
  set deviceToken(String value) {
    _deviceToken = value;
  }

  String _deviceInfo = '';
  String get deviceInfo => _deviceInfo;
  set deviceInfo(String value) {
    _deviceInfo = value;
  }
}
