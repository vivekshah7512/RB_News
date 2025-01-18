import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

const debugRouteLinkMap = {
  '/loginPage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LoginPage',
  '/registrationPage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=RegistrationPage',
  '/oTPVerificationPage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=OTPVerificationPage',
  '/horoscopePage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HoroscopePage',
  '/homePage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
  '/newsDetailPage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailPage',
  '/userDetailPage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=UserDetailPage',
  '/allPropertiesListPage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=AllPropertiesListPage',
  '/NewsListPage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
  '/latestPropertiesListPage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LatestPropertiesListPage',
  '/horoscopeDetailNew':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HoroscopeDetailNew',
  '/PropertyDetailNew':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailNew',
  '/newsPagesListViewPage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
  '/PropertyDetailListPage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailListPage',
  '/newsDetailCarouselPage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
  '/pageNotFoundPage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PageNotFoundPage',
  '/noInternetPage':
      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NoInternetPage'
};

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/Splash.png',
                  fit: BoxFit.fill,
                ),
              ),
            )
          : NavBarPage(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/Splash.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              : NavBarPage(),
        ),
        FFRoute(
          name: 'LoginPage',
          path: '/loginPage',
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: 'RegistrationPage',
          path: '/registrationPage',
          builder: (context, params) => RegistrationPageWidget(),
        ),
        FFRoute(
          name: 'OTPVerificationPage',
          path: '/oTPVerificationPage',
          builder: (context, params) => OTPVerificationPageWidget(
            emailAddress: params.getParam(
              'emailAddress',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'HoroscopePage',
          path: '/horoscopePage',
          builder: (context, params) => HoroscopePageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HomePage')
              : NavBarPage(
                  initialPage: 'HomePage',
                  page: HomePageWidget(
                    hintFlag: params.getParam(
                      'hintFlag',
                      ParamType.int,
                    ),
                  ),
                ),
        ),
        FFRoute(
          name: 'NewsDetailPage',
          path: '/newsDetailPage',
          builder: (context, params) => NewsDetailPageWidget(
            newsId: params.getParam(
              'newsId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'UserDetailPage',
          path: '/userDetailPage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'UserDetailPage')
              : UserDetailPageWidget(),
        ),
        FFRoute(
          name: 'AllPropertiesListPage',
          path: '/allPropertiesListPage',
          builder: (context, params) => AllPropertiesListPageWidget(
            propertyType: params.getParam(
              'propertyType',
              ParamType.String,
            ),
            propertyTitle: params.getParam(
              'propertyTitle',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'NewsListPage',
          path: '/NewsListPage',
          builder: (context, params) => NewsListPageWidget(
            newsType: params.getParam(
              'newsType',
              ParamType.String,
            ),
            newsTitle: params.getParam(
              'newsTitle',
              ParamType.String,
            ),
            searchKeyword: params.getParam(
              'searchKeyword',
              ParamType.String,
            ),
            searchForNews: params.getParam(
              'searchForNews',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'LatestPropertiesListPage',
          path: '/latestPropertiesListPage',
          builder: (context, params) => LatestPropertiesListPageWidget(
            propertyType: params.getParam(
              'propertyType',
              ParamType.String,
            ),
            propertyTitle: params.getParam(
              'propertyTitle',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'HoroscopeDetailNew',
          path: '/horoscopeDetailNew',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HoroscopeDetailNew')
              : NavBarPage(
                  initialPage: 'HoroscopeDetailNew',
                  page: HoroscopeDetailNewWidget(
                    zodiacSignId: params.getParam(
                      'zodiacSignId',
                      ParamType.String,
                    ),
                    currentZodiacIndex: params.getParam(
                      'currentZodiacIndex',
                      ParamType.int,
                    ),
                    zodiacListArray: params.getParam<dynamic>(
                      'zodiacListArray',
                      ParamType.JSON,
                      isList: true,
                    ),
                  ),
                ),
        ),
        FFRoute(
          name: 'PropertyDetailNew',
          path: '/PropertyDetailNew',
          builder: (context, params) => PropertyDetailNewWidget(
            propertyId: params.getParam(
              'propertyId',
              ParamType.int,
            ),
            propertyAllImages: params.getParam<String>(
              'propertyAllImages',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'NewsPagesListViewPage',
          path: '/newsPagesListViewPage',
          builder: (context, params) => NewsPagesListViewPageWidget(
            newsListPageArray: params.getParam<dynamic>(
              'newsListPageArray',
              ParamType.JSON,
              isList: true,
            ),
            currentNewsPageInitalIDX: params.getParam(
              'currentNewsPageInitalIDX',
              ParamType.int,
            ),
            isFromList: params.getParam(
              'isFromList',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'PropertyDetailListPage',
          path: '/PropertyDetailListPage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'PropertyDetailListPage')
              : NavBarPage(
                  initialPage: 'PropertyDetailListPage',
                  page: PropertyDetailListPageWidget(
                    propertyId: params.getParam(
                      'propertyId',
                      ParamType.int,
                    ),
                    propertyListArray: params.getParam<dynamic>(
                      'propertyListArray',
                      ParamType.JSON,
                      isList: true,
                    ),
                    currentPageIndex: params.getParam(
                      'currentPageIndex',
                      ParamType.int,
                    ),
                  ),
                ),
        ),
        FFRoute(
          name: 'NewsDetailCarouselPage',
          path: '/newsDetailCarouselPage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'NewsDetailCarouselPage')
              : NavBarPage(
                  initialPage: 'NewsDetailCarouselPage',
                  page: NewsDetailCarouselPageWidget(
                    newsListPageArray: params.getParam<dynamic>(
                      'newsListPageArray',
                      ParamType.JSON,
                      isList: true,
                    ),
                    isFromList: params.getParam(
                      'isFromList',
                      ParamType.bool,
                    ),
                    currentNewsPageInitalIDX: params.getParam(
                      'currentNewsPageInitalIDX',
                      ParamType.int,
                    ),
                    searchText: params.getParam(
                      'searchText',
                      ParamType.String,
                    ),
                    newsType: params.getParam(
                      'newsType',
                      ParamType.String,
                    ),
                  ),
                ),
        ),
        FFRoute(
          name: 'PageNotFoundPage',
          path: '/pageNotFoundPage',
          builder: (context, params) => PageNotFoundPageWidget(),
        ),
        FFRoute(
          name: 'NoInternetPage',
          path: '/noInternetPage',
          builder: (context, params) => NoInternetPageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
