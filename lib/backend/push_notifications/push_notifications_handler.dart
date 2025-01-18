import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Splash.png',
            fit: BoxFit.fill,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'LoginPage': ParameterData.none(),
  'RegistrationPage': ParameterData.none(),
  'OTPVerificationPage': (data) async => ParameterData(
        allParams: {
          'emailAddress': getParameter<String>(data, 'emailAddress'),
        },
      ),
  'HoroscopePage': ParameterData.none(),
  'HomePage': (data) async => ParameterData(
        allParams: {
          'hintFlag': getParameter<int>(data, 'hintFlag'),
        },
      ),
  'NewsDetailPage': (data) async => ParameterData(
        allParams: {
          'newsId': getParameter<String>(data, 'newsId'),
        },
      ),
  'UserDetailPage': ParameterData.none(),
  'AllPropertiesListPage': (data) async => ParameterData(
        allParams: {
          'propertyType': getParameter<String>(data, 'propertyType'),
          'propertyTitle': getParameter<String>(data, 'propertyTitle'),
        },
      ),
  'NewsListPage': (data) async => ParameterData(
        allParams: {
          'newsType': getParameter<String>(data, 'newsType'),
          'newsTitle': getParameter<String>(data, 'newsTitle'),
          'searchKeyword': getParameter<String>(data, 'searchKeyword'),
          'searchForNews': getParameter<int>(data, 'searchForNews'),
        },
      ),
  'LatestPropertiesListPage': (data) async => ParameterData(
        allParams: {
          'propertyType': getParameter<String>(data, 'propertyType'),
          'propertyTitle': getParameter<String>(data, 'propertyTitle'),
        },
      ),
  'HoroscopeDetailNew': (data) async => ParameterData(
        allParams: {
          'zodiacSignId': getParameter<String>(data, 'zodiacSignId'),
          'currentZodiacIndex': getParameter<int>(data, 'currentZodiacIndex'),
        },
      ),
  'PropertyDetailNew': (data) async => ParameterData(
        allParams: {
          'propertyId': getParameter<int>(data, 'propertyId'),
        },
      ),
  'NewsPagesListViewPage': (data) async => ParameterData(
        allParams: {
          'currentNewsPageInitalIDX':
              getParameter<int>(data, 'currentNewsPageInitalIDX'),
          'isFromList': getParameter<bool>(data, 'isFromList'),
        },
      ),
  'PropertyDetailListPage': (data) async => ParameterData(
        allParams: {
          'propertyId': getParameter<int>(data, 'propertyId'),
          'currentPageIndex': getParameter<int>(data, 'currentPageIndex'),
        },
      ),
  'NewsDetailCarouselPage': (data) async => ParameterData(
        allParams: {
          'isFromList': getParameter<bool>(data, 'isFromList'),
          'currentNewsPageInitalIDX':
              getParameter<int>(data, 'currentNewsPageInitalIDX'),
          'searchText': getParameter<String>(data, 'searchText'),
          'newsType': getParameter<String>(data, 'newsType'),
        },
      ),
  'PageNotFoundPage': ParameterData.none(),
  'NoInternetPage': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
