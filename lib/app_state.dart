import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userId = prefs.getString('ff_userId') ?? _userId;
    });
    _safeInit(() {
      _authToken = prefs.getString('ff_authToken') ?? _authToken;
    });
    _safeInit(() {
      _authTokenAPI = prefs.getString('ff_authTokenAPI') ?? _authTokenAPI;
    });
    _safeInit(() {
      _userIdAPI = prefs.getInt('ff_userIdAPI') ?? _userIdAPI;
    });
    _safeInit(() {
      _isUserLoggedIn = prefs.getBool('ff_isUserLoggedIn') ?? _isUserLoggedIn;
    });
    _safeInit(() {
      _userContactNumber =
          prefs.getString('ff_userContactNumber') ?? _userContactNumber;
    });
    _safeInit(() {
      _userName = prefs.getString('ff_userName') ?? _userName;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _TimerSeconds = 1;
  int get TimerSeconds => _TimerSeconds;
  set TimerSeconds(int value) {
    _TimerSeconds = value;

    debugLogAppState(this);
  }

  bool _IsStartedTIMER = true;
  bool get IsStartedTIMER => _IsStartedTIMER;
  set IsStartedTIMER(bool value) {
    _IsStartedTIMER = value;

    debugLogAppState(this);
  }

  int _resendTimerVisible = 0;
  int get resendTimerVisible => _resendTimerVisible;
  set resendTimerVisible(int value) {
    _resendTimerVisible = value;

    debugLogAppState(this);
  }

  String _userEmail = '';
  String get userEmail => _userEmail;
  set userEmail(String value) {
    _userEmail = value;

    debugLogAppState(this);
  }

  String _deviceType = '';
  String get deviceType => _deviceType;
  set deviceType(String value) {
    _deviceType = value;

    debugLogAppState(this);
  }

  String _deviceId = '';
  String get deviceId => _deviceId;
  set deviceId(String value) {
    _deviceId = value;

    debugLogAppState(this);
  }

  String _deviceToken = '';
  String get deviceToken => _deviceToken;
  set deviceToken(String value) {
    _deviceToken = value;

    debugLogAppState(this);
  }

  String _deviceInfo = '';
  String get deviceInfo => _deviceInfo;
  set deviceInfo(String value) {
    _deviceInfo = value;

    debugLogAppState(this);
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
    prefs.setString('ff_userId', value);
    debugLogAppState(this);
  }

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
    prefs.setString('ff_authToken', value);
    debugLogAppState(this);
  }

  String _authTokenAPI = '';
  String get authTokenAPI => _authTokenAPI;
  set authTokenAPI(String value) {
    _authTokenAPI = value;
    prefs.setString('ff_authTokenAPI', value);
    debugLogAppState(this);
  }

  int _userIdAPI = 0;
  int get userIdAPI => _userIdAPI;
  set userIdAPI(int value) {
    _userIdAPI = value;
    prefs.setInt('ff_userIdAPI', value);
    debugLogAppState(this);
  }

  int _totalNewsDataSize = 0;
  int get totalNewsDataSize => _totalNewsDataSize;
  set totalNewsDataSize(int value) {
    _totalNewsDataSize = value;

    debugLogAppState(this);
  }

  int _totalNewsPage = 0;
  int get totalNewsPage => _totalNewsPage;
  set totalNewsPage(int value) {
    _totalNewsPage = value;

    debugLogAppState(this);
  }

  int _currentNewsPage = 1;
  int get currentNewsPage => _currentNewsPage;
  set currentNewsPage(int value) {
    _currentNewsPage = value;

    debugLogAppState(this);
  }

  String _latitude = '0';
  String get latitude => _latitude;
  set latitude(String value) {
    _latitude = value;

    debugLogAppState(this);
  }

  String _longitude = '0';
  String get longitude => _longitude;
  set longitude(String value) {
    _longitude = value;

    debugLogAppState(this);
  }

  bool _isUserLoggedIn = false;
  bool get isUserLoggedIn => _isUserLoggedIn;
  set isUserLoggedIn(bool value) {
    _isUserLoggedIn = value;
    prefs.setBool('ff_isUserLoggedIn', value);
    debugLogAppState(this);
  }

  String _userContactNumber = '';
  String get userContactNumber => _userContactNumber;
  set userContactNumber(String value) {
    _userContactNumber = value;
    prefs.setString('ff_userContactNumber', value);
    debugLogAppState(this);
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    prefs.setString('ff_userName', value);
    debugLogAppState(this);
  }

  late LoggableList<int> _selectedNewsCategory = LoggableList([]);
  List<int> get selectedNewsCategory =>
      _selectedNewsCategory?..logger = () => debugLogAppState(this);
  set selectedNewsCategory(List<int> value) {
    if (value != null) {
      _selectedNewsCategory = LoggableList(value);
    }

    debugLogAppState(this);
  }

  void addToSelectedNewsCategory(int value) {
    selectedNewsCategory.add(value);
  }

  void removeFromSelectedNewsCategory(int value) {
    selectedNewsCategory.remove(value);
  }

  void removeAtIndexFromSelectedNewsCategory(int index) {
    selectedNewsCategory.removeAt(index);
  }

  void updateSelectedNewsCategoryAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    selectedNewsCategory[index] = updateFn(_selectedNewsCategory[index]);
  }

  void insertAtIndexInSelectedNewsCategory(int index, int value) {
    selectedNewsCategory.insert(index, value);
  }

  String _selectedFilterIds = '  ';
  String get selectedFilterIds => _selectedFilterIds;
  set selectedFilterIds(String value) {
    _selectedFilterIds = value;

    debugLogAppState(this);
  }

  late LoggableList<Color> _commentColors = LoggableList([
    Color(4293849599),
    Color(4293327300),
    Color(4294892993),
    Color(4293709823),
    Color(4289722102)
  ]);
  List<Color> get commentColors =>
      _commentColors?..logger = () => debugLogAppState(this);
  set commentColors(List<Color> value) {
    if (value != null) {
      _commentColors = LoggableList(value);
    }

    debugLogAppState(this);
  }

  void addToCommentColors(Color value) {
    commentColors.add(value);
  }

  void removeFromCommentColors(Color value) {
    commentColors.remove(value);
  }

  void removeAtIndexFromCommentColors(int index) {
    commentColors.removeAt(index);
  }

  void updateCommentColorsAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    commentColors[index] = updateFn(_commentColors[index]);
  }

  void insertAtIndexInCommentColors(int index, Color value) {
    commentColors.insert(index, value);
  }

  String _assetsBaseUrl = 'http://rbnews-stage.ap-south-1.elasticbeanstalk.com';
  String get assetsBaseUrl => _assetsBaseUrl;
  set assetsBaseUrl(String value) {
    _assetsBaseUrl = value;

    debugLogAppState(this);
  }

  late LoggableList<String> _selectedNewsCatStringArray = LoggableList([]);
  List<String> get selectedNewsCatStringArray =>
      _selectedNewsCatStringArray?..logger = () => debugLogAppState(this);
  set selectedNewsCatStringArray(List<String> value) {
    if (value != null) {
      _selectedNewsCatStringArray = LoggableList(value);
    }

    debugLogAppState(this);
  }

  void addToSelectedNewsCatStringArray(String value) {
    selectedNewsCatStringArray.add(value);
  }

  void removeFromSelectedNewsCatStringArray(String value) {
    selectedNewsCatStringArray.remove(value);
  }

  void removeAtIndexFromSelectedNewsCatStringArray(int index) {
    selectedNewsCatStringArray.removeAt(index);
  }

  void updateSelectedNewsCatStringArrayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedNewsCatStringArray[index] =
        updateFn(_selectedNewsCatStringArray[index]);
  }

  void insertAtIndexInSelectedNewsCatStringArray(int index, String value) {
    selectedNewsCatStringArray.insert(index, value);
  }

  late LoggableList<SelectedNewsCategoryDataStruct> _selectedNewsCategoryTop =
      LoggableList([]);
  List<SelectedNewsCategoryDataStruct> get selectedNewsCategoryTop =>
      _selectedNewsCategoryTop?..logger = () => debugLogAppState(this);
  set selectedNewsCategoryTop(List<SelectedNewsCategoryDataStruct> value) {
    if (value != null) {
      _selectedNewsCategoryTop = LoggableList(value);
    }

    debugLogAppState(this);
  }

  void addToSelectedNewsCategoryTop(SelectedNewsCategoryDataStruct value) {
    selectedNewsCategoryTop.add(value);
  }

  void removeFromSelectedNewsCategoryTop(SelectedNewsCategoryDataStruct value) {
    selectedNewsCategoryTop.remove(value);
  }

  void removeAtIndexFromSelectedNewsCategoryTop(int index) {
    selectedNewsCategoryTop.removeAt(index);
  }

  void updateSelectedNewsCategoryTopAtIndex(
    int index,
    SelectedNewsCategoryDataStruct Function(SelectedNewsCategoryDataStruct)
        updateFn,
  ) {
    selectedNewsCategoryTop[index] = updateFn(_selectedNewsCategoryTop[index]);
  }

  void insertAtIndexInSelectedNewsCategoryTop(
      int index, SelectedNewsCategoryDataStruct value) {
    selectedNewsCategoryTop.insert(index, value);
  }

  Map<String, DebugDataField> toDebugSerializableMap() => {
        'TimerSeconds': debugSerializeParam(
          TimerSeconds,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch4KGAoMVGltZXJTZWNvbmRzEghyb2xhNTlkbnICCAFaDFRpbWVyU2Vjb25kcw==',
          name: 'int',
          nullable: false,
        ),
        'IsStartedTIMER': debugSerializeParam(
          IsStartedTIMER,
          ParamType.bool,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CiAKGgoOSXNTdGFydGVkVElNRVISCDdodXM3eTRhcgIIBVoOSXNTdGFydGVkVElNRVI=',
          name: 'bool',
          nullable: false,
        ),
        'resendTimerVisible': debugSerializeParam(
          resendTimerVisible,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CiQKHgoScmVzZW5kVGltZXJWaXNpYmxlEgh0dGI0cHo3Y3ICCAFaEnJlc2VuZFRpbWVyVmlzaWJsZQ==',
          name: 'int',
          nullable: false,
        ),
        'userEmail': debugSerializeParam(
          userEmail,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChsKFQoJdXNlckVtYWlsEggwbjNyYmRieHICCANaCXVzZXJFbWFpbA==',
          name: 'String',
          nullable: false,
        ),
        'deviceType': debugSerializeParam(
          deviceType,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChwKFgoKZGV2aWNlVHlwZRIIaWIwOGxtejVyAggDWgpkZXZpY2VUeXBl',
          name: 'String',
          nullable: false,
        ),
        'deviceId': debugSerializeParam(
          deviceId,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChoKFAoIZGV2aWNlSWQSCHFsNTFzaG83cgIIA1oIZGV2aWNlSWQ=',
          name: 'String',
          nullable: false,
        ),
        'deviceToken': debugSerializeParam(
          deviceToken,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch0KFwoLZGV2aWNlVG9rZW4SCDN0OWl2emxscgIIA1oLZGV2aWNlVG9rZW4=',
          name: 'String',
          nullable: false,
        ),
        'deviceInfo': debugSerializeParam(
          deviceInfo,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChwKFgoKZGV2aWNlSW5mbxIIbnpsMmRxN2pyAggDWgpkZXZpY2VJbmZv',
          name: 'String',
          nullable: false,
        ),
        'userId': debugSerializeParam(
          userId,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChgKEgoGdXNlcklkEgh0ZHJldmxjYnICCANaBnVzZXJJZA==',
          name: 'String',
          nullable: false,
        ),
        'authToken': debugSerializeParam(
          authToken,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChsKFQoJYXV0aFRva2VuEgh1cDVrZzVpN3ICCANaCWF1dGhUb2tlbg==',
          name: 'String',
          nullable: false,
        ),
        'authTokenAPI': debugSerializeParam(
          authTokenAPI,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch4KGAoMYXV0aFRva2VuQVBJEghwc2J4eDh4aXICCANaDGF1dGhUb2tlbkFQSQ==',
          name: 'String',
          nullable: false,
        ),
        'userIdAPI': debugSerializeParam(
          userIdAPI,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChsKFQoJdXNlcklkQVBJEggzNzAwbHExb3ICCAFaCXVzZXJJZEFQSQ==',
          name: 'int',
          nullable: false,
        ),
        'totalNewsDataSize': debugSerializeParam(
          totalNewsDataSize,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CiMKHQoRdG90YWxOZXdzRGF0YVNpemUSCHJmb2IzdGVhcgIIAVoRdG90YWxOZXdzRGF0YVNpemU=',
          name: 'int',
          nullable: false,
        ),
        'totalNewsPage': debugSerializeParam(
          totalNewsPage,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch8KGQoNdG90YWxOZXdzUGFnZRIIOGhueTMxamNyAggBWg10b3RhbE5ld3NQYWdl',
          name: 'int',
          nullable: false,
        ),
        'currentNewsPage': debugSerializeParam(
          currentNewsPage,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CiEKGwoPY3VycmVudE5ld3NQYWdlEghwcjc0eTR4N3ICCAFaD2N1cnJlbnROZXdzUGFnZQ==',
          name: 'int',
          nullable: false,
        ),
        'latitude': debugSerializeParam(
          latitude,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChoKFAoIbGF0aXR1ZGUSCDBjZWRzc25zcgIIA1oIbGF0aXR1ZGU=',
          name: 'String',
          nullable: false,
        ),
        'longitude': debugSerializeParam(
          longitude,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChsKFQoJbG9uZ2l0dWRlEgh6eHlyZmYwcXICCANaCWxvbmdpdHVkZQ==',
          name: 'String',
          nullable: false,
        ),
        'isUserLoggedIn': debugSerializeParam(
          isUserLoggedIn,
          ParamType.bool,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CiAKGgoOaXNVc2VyTG9nZ2VkSW4SCDYyaTd1NWI5cgIIBVoOaXNVc2VyTG9nZ2VkSW4=',
          name: 'bool',
          nullable: false,
        ),
        'userContactNumber': debugSerializeParam(
          userContactNumber,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CiMKHQoRdXNlckNvbnRhY3ROdW1iZXISCDNsN3ZjczlocgIIA1oRdXNlckNvbnRhY3ROdW1iZXI=',
          name: 'String',
          nullable: false,
        ),
        'userName': debugSerializeParam(
          userName,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChoKFAoIdXNlck5hbWUSCDRrdTR1OTNpcgIIA1oIdXNlck5hbWU=',
          name: 'String',
          nullable: false,
        ),
        'selectedNewsCategory': debugSerializeParam(
          selectedNewsCategory,
          ParamType.int,
          isList: true,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CigKIAoUc2VsZWN0ZWROZXdzQ2F0ZWdvcnkSCGhxb2drdjZzcgQSAggBWhRzZWxlY3RlZE5ld3NDYXRlZ29yeQ==',
          name: 'int',
          nullable: false,
        ),
        'selectedFilterIds': debugSerializeParam(
          selectedFilterIds,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CiMKHQoRc2VsZWN0ZWRGaWx0ZXJJZHMSCHA1cmxkYjRmcgIIA1oRc2VsZWN0ZWRGaWx0ZXJJZHM=',
          name: 'String',
          nullable: false,
        ),
        'commentColors': debugSerializeParam(
          commentColors,
          ParamType.Color,
          isList: true,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CiEKGQoNY29tbWVudENvbG9ycxIIYXA1djI2YTVyBBICCBZaDWNvbW1lbnRDb2xvcnM=',
          name: 'Color',
          nullable: false,
        ),
        'assetsBaseUrl': debugSerializeParam(
          assetsBaseUrl,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch8KGQoNYXNzZXRzQmFzZVVybBIIYmFiM3p0aDJyAggDWg1hc3NldHNCYXNlVXJs',
          name: 'String',
          nullable: false,
        ),
        'selectedNewsCatStringArray': debugSerializeParam(
          selectedNewsCatStringArray,
          ParamType.String,
          isList: true,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ci4KJgoac2VsZWN0ZWROZXdzQ2F0U3RyaW5nQXJyYXkSCGg1emE5ejU2cgQSAggDWhpzZWxlY3RlZE5ld3NDYXRTdHJpbmdBcnJheQ==',
          name: 'String',
          nullable: false,
        ),
        'selectedNewsCategoryTop': debugSerializeParam(
          selectedNewsCategoryTop,
          ParamType.DataStruct,
          isList: true,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ClAKIwoXc2VsZWN0ZWROZXdzQ2F0ZWdvcnlUb3ASCDhtMWIwb3pvcikSAggUKiMSIQoYU2VsZWN0ZWROZXdzQ2F0ZWdvcnlEYXRhEgUzcnVlcFoXc2VsZWN0ZWROZXdzQ2F0ZWdvcnlUb3A=',
          name: 'SelectedNewsCategoryData',
          nullable: false,
        )
      };
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
