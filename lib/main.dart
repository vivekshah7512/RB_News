import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'backend/firebase/firebase_config.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';

import 'notification/PushNotificationsManager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();
  debugLogAppConstant();

  await initFirebase();
  await Firebase.initializeApp();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();
  debugLogAppState(appState);
  appState.addListener(() {
    debugLogAppState(appState);
  });

  final originalErrorWidgetBuilder = ErrorWidget.builder;
  ErrorWidget.builder = (FlutterErrorDetails details) {
    try {
      final match = RegExp(
          r'The relevant error-causing widget was:\s+([a-zA-Z0-9]+)(.|\n)*When the exception was thrown, this was the stack:((.|\n)*)')
          .firstMatch(details.toString());
      if (match == null) {
        return originalErrorWidgetBuilder(details);
      }
      final widgetName = match.group(1);
      final stackTrace = match.group(3)!;

      // The stack trace usually is very long, and most of it is entirely
      // irrelevant for troubleshooting, e.g.:
      //
      // dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 251:49  throw_
      // dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 29:3    assertFailed
      // packages/flutter/src/widgets/text.dart 378:14                                 new
      // packages/debug_screen_test/home_page/home_page_widget.dart 51:15              build
      // packages/flutter/src/widgets/framework.dart 4870:27                           build
      // packages/flutter/src/widgets/framework.dart 4754:15                           performRebuild
      // packages/flutter/src/widgets/framework.dart 4928:11                           performRebuild
      // packages/flutter/src/widgets/framework.dart 4477:5                            rebuild
      // <a long long list of internal libraries>
      //
      // We truncate everything after project-specific code.

      final filteredStackTrace = <String>[];
      var foundProjectTraces = false;
      for (final line in stackTrace.split('\n')) {
        if (line.startsWith('packages/r_b_news/')) {
          foundProjectTraces = true;
        } else {
          if (foundProjectTraces) {
            filteredStackTrace.add('...');
            break;
          }
        }
        filteredStackTrace.add(line);
      }

      final result = '''${details.exceptionAsString()}
      
The relevant error-causing widget was: $widgetName

Stack trace: ${filteredStackTrace.join("\n")}''';

      return ErrorWidget.withDetails(message: result);
    } catch (_) {
      return originalErrorWidgetBuilder(details);
    }
  };

  /// Every second, fire logging call for different channel (tag) so that frequent
  /// logging calls don't get delayed too much
  Timer.periodic(const Duration(seconds: 2), (timer) {
    EasyDebounce.fire('405ebf2ff50c295c675b5802889ea941f081fd51');
    EasyDebounce.cancel('405ebf2ff50c295c675b5802889ea941f081fd51');
    EasyDebounce.fire('fbcc19a787981a30d86b10103c2f3951604b2ae6');
    EasyDebounce.cancel('fbcc19a787981a30d86b10103c2f3951604b2ae6');

    EasyDebounce.fire('508f3c74205c87928b71f49040062e732f9c20b0');
    EasyDebounce.cancel('508f3c74205c87928b71f49040062e732f9c20b0');
  });

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Lock to portrait mode
  ]);

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  Locale? get locale => _locale;
  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();

  bool displaySplashImage = true;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);

    Future.delayed(Duration(milliseconds: 1500),
            () => safeSetState(() => _appStateNotifier.stopShowingSplashImage()));
    _router.routerDelegate.addListener(() {
      if (mounted) {
        debugLogGlobalProperty(
          context,
          locale: locale.toString(),
          routePath: getRoute(),
          routeStack: getRouteStack(),
        );
      }
    });
  }

  void setLocale(String language) {
    safeSetState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
    _themeMode = mode;
  });

  @override
  Widget build(BuildContext context) {
    PushNotificationsManager(context).init();
    return MaterialApp.router(
      title: 'RB News',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationDelegate(),
        FallbackCupertinoLocalizationDelegate(),
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('gu'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  // String _currentPageName = 'HomePage';
  String _currentPageName = 'NewsDetailCarouselPage';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
      'NewsDetailCarouselPage': NewsDetailCarouselPageWidget(),
      'PropertyDetailListPage': PropertyDetailListPageWidget(),
      'HoroscopeDetailNew': HoroscopeDetailNewWidget(),
      'UserDetailPage': UserDetailPageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => safeSetState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF5374FF),
          unselectedItemColor: Color(0xFF808080),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/home_inactive.svg',
                width: 24.0, // Set the desired width
                height: 24.0, // Set the desired height
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/home_active.svg',
                width: 24.0, // Set the desired width
                height: 24.0, // Set the desired height
              ),
              label: 'ઘર',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/news_inactive.svg',
                width: 24.0, // Set the desired width
                height: 24.0, // Set the desired height
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/news_active.svg',
                width: 24.0, // Set the desired width
                height: 24.0, // Set the desired height
              ),
              label: 'સમાચાર',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/property_inactive.svg',
                width: 24.0, // Set the desired width
                height: 24.0, // Set the desired height
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/property_active.svg',
                width: 24.0, // Set the desired width
                height: 24.0, // Set the desired height
              ),
              label: 'મિલકત',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/horoscopes_inactive.svg',
                width: 24.0, // Set the desired width
                height: 24.0, // Set the desired height
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/horoscopes_active.svg',
                width: 24.0, // Set the desired width
                height: 24.0, // Set the desired height
              ),
              label: 'રાશિફળ',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/user_inactive.svg',
                width: 24.0, // Set the desired width
                height: 24.0, // Set the desired height
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/user_active.svg',
                width: 24.0, // Set the desired width
                height: 24.0, // Set the desired height
              ),
              label: 'વપરાશકર્તા',
              tooltip: '',
            )
          ],
        ),
      ),
    );
  }
}
