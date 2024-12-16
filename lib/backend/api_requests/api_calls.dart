import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start RB News API Group Code

class RBNewsAPIGroup {
  static String getBaseUrl() =>
      'http://rbnews-stage.ap-south-1.elasticbeanstalk.com';
  static Map<String, String> headers = {};
  static LoginAPICall loginAPICall = LoginAPICall();
  static DashboardDataCall dashboardDataCall = DashboardDataCall();
  static NewsDetailCall newsDetailCall = NewsDetailCall();
  static GuestUserCall guestUserCall = GuestUserCall();
  static NewsListCall newsListCall = NewsListCall();
  static NewsCommentCall newsCommentCall = NewsCommentCall();
  static HoroscopeListCall horoscopeListCall = HoroscopeListCall();
  static ZodiacListCall zodiacListCall = ZodiacListCall();
  static HoroscopeDetailCall horoscopeDetailCall = HoroscopeDetailCall();
  static PropertyListCall propertyListCall = PropertyListCall();
  static LatestPropertyListCall latestPropertyListCall =
      LatestPropertyListCall();
  static PostNewsCommentCall postNewsCommentCall = PostNewsCommentCall();
}

class LoginAPICall {
  Future<ApiCallResponse> call() async {
    final baseUrl = RBNewsAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Login API',
      apiUrl: '${baseUrl}/api/account/log-in',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': "vivekshah.it@gmail.com",
        'device_type': "iOS",
        'device_token': "sdfavjkhfkghaf90fvf=",
        'device_id': "12345",
        'device_info': "iPhone 12",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DashboardDataCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = RBNewsAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'DashboardData',
      apiUrl: '${baseUrl}/api/details/get-dashboard-data-list',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? responseData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List? newsListArray(dynamic response) => getJsonField(
        response,
        r'''$.data.newsList''',
        true,
      ) as List?;
  List? propertyListArray(dynamic response) => getJsonField(
        response,
        r'''$.data.propertiesList''',
        true,
      ) as List?;
  List? zodiacSignList(dynamic response) => getJsonField(
        response,
        r'''$.data.zodiacSignList''',
        true,
      ) as List?;
}

class NewsDetailCall {
  Future<ApiCallResponse> call({
    String? newsId = '0',
    String? authToken = '',
    int? userId,
  }) async {
    final baseUrl = RBNewsAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'NewsDetail',
      apiUrl: '${baseUrl}/api/news/get-news-record-by-id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'newsId': newsId,
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? newsData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class GuestUserCall {
  Future<ApiCallResponse> call({
    String? latitude = '',
    String? longitude = '',
    String? deviceInfo = '',
    String? deviceId = '',
    String? deviceType = '',
  }) async {
    final baseUrl = RBNewsAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GuestUser',
      apiUrl: '${baseUrl}/api/account/create-guest',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'device_type': deviceType,
        'device_id': deviceId,
        'device_token': "urgyug+fasgr1cgsf=",
        'device_info': deviceInfo,
        'longitude': longitude,
        'latitude': latitude,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? userData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class NewsListCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? searchText = '',
    int? pageNumber,
    String? newsType = '',
    String? userId = '',
  }) async {
    final baseUrl = RBNewsAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'NewsList',
      apiUrl: '${baseUrl}/api/news/get-news-list',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer  ${authToken}',
      },
      params: {
        'userId': userId,
        'newsType': newsType,
        'pageNumber': pageNumber,
        'searchText': searchText,
        'pageSize': "2",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? newsArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  int? totalPageCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

class NewsCommentCall {
  Future<ApiCallResponse> call({
    String? newsId = '',
    String? authToken = '',
  }) async {
    final baseUrl = RBNewsAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'NewsComment',
      apiUrl: '${baseUrl}/api/news/get-news-comment-list-by-news-id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer  ${authToken}',
      },
      params: {
        'newsId': newsId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? newsCommentArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class HoroscopeListCall {
  Future<ApiCallResponse> call({
    String? dateInput = '',
    String? authToken = '',
  }) async {
    final baseUrl = RBNewsAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'HoroscopeList',
      apiUrl: '${baseUrl}/api/zodiacs/get-horoscope-list',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'dateInput': dateInput,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ZodiacListCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = RBNewsAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ZodiacList',
      apiUrl: '${baseUrl}/api/zodiacs/get-zodiac-signs-list',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? zodiaListArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class HoroscopeDetailCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? dateInput = '2024-11-20',
    String? zodiacSignId = '10',
  }) async {
    final baseUrl = RBNewsAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Horoscope Detail',
      apiUrl: '${baseUrl}/api/zodiacs/get-horoscope-details-by-id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'dateInput': "2024-11-20",
        'zodiacSignId': "10",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic horoscopeData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class PropertyListCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = RBNewsAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Property List',
      apiUrl: '${baseUrl}/api/property/get-property-data-list',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic propertylistArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class LatestPropertyListCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? pageNumber,
  }) async {
    final baseUrl = RBNewsAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Latest Property List ',
      apiUrl: '${baseUrl}/api/property/get-latest-property-list',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'pageNumber': pageNumber,
        'pageSize': "2",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic latestPropertylistArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class PostNewsCommentCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? comment = '',
    String? newsId = '',
    String? authToken = '',
  }) async {
    final baseUrl = RBNewsAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Post News Comment',
      apiUrl: '${baseUrl}/api/news/add-user-comment',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'userId': userId,
        'comment': comment,
        'newsId': newsId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End RB News API Group Code

class HoroscopeAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'HoroscopeAPI',
      apiUrl: 'https://dummyjson.com/products',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? productData(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
