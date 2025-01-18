import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/custom_components/login_popup/login_popup_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    int? hintFlag,
  }) : this.hintFlag = hintFlag ?? 1;

  final int hintFlag;

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> with RouteAware {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().authTokenAPI == '') {
        await actions.getDeviceInfo();
        await actions.getCurrentLatLng();
        _model.fcmToken = await actions.getFirebaseToken();
        FFAppState().deviceToken = _model.fcmToken!;
        safeSetState(() {});
        _model.apiResultrfs = await RBNewsAPIGroup.guestUserCall.call(
          deviceId: FFAppState().deviceId,
          deviceType: FFAppState().deviceType,
          deviceInfo: FFAppState().deviceInfo,
          latitude: FFAppState().latitude,
          longitude: FFAppState().longitude,
          deviceToken: FFAppState().deviceToken,
        );

        if ((_model.apiResultrfs?.succeeded ?? true)) {
          FFAppState().authTokenAPI = getJsonField(
            (_model.apiResultrfs?.jsonBody ?? ''),
            r'''$.data.jwtTokenString''',
          ).toString().toString();
          FFAppState().userIdAPI = getJsonField(
            (_model.apiResultrfs?.jsonBody ?? ''),
            r'''$.data.userId''',
          );
          safeSetState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = DebugModalRoute.of(context);
    if (route != null) {
      routeObserver.subscribe(this, route);
    }
    debugLogGlobalProperty(context);
  }

  @override
  void didPopNext() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPush() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPop() {
    _model.isRouteVisible = false;
  }

  @override
  void didPushNext() {
    _model.isRouteVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    DebugFlutterFlowModelContext.maybeOf(context)
        ?.parentModelCallback
        ?.call(_model);
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: RBNewsAPIGroup.dashboardDataCall.call(
        authToken: FFAppState().authTokenAPI,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF8F8F8),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final homePageDashboardDataResponse = snapshot.data!;
        _model.debugBackendQueries[
                'RBNewsAPIGroup.dashboardDataCall_statusCode_Scaffold_le9rd6yl'] =
            debugSerializeParam(
          homePageDashboardDataResponse.statusCode,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
          name: 'int',
          nullable: false,
        );
        _model.debugBackendQueries[
                'RBNewsAPIGroup.dashboardDataCall_responseBody_Scaffold_le9rd6yl'] =
            debugSerializeParam(
          homePageDashboardDataResponse.bodyText,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
          name: 'String',
          nullable: false,
        );
        debugLogWidgetClass(_model);

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF8F8F8),
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F8F8),
                    ),
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 28.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/actionbar_logo.png',
                                              width: 137.0,
                                              height: 24.0,
                                              fit: BoxFit.contain,
                                              alignment: Alignment(0.0, 0.0),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.result = await actions
                                                .areNotificationsEnabled();
                                            if (_model.result!) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Notifications are already enabled.',
                                                    style: GoogleFonts.getFont(
                                                      'Readex Pro',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 2500),
                                                  backgroundColor:
                                                      Color(0xFF748187),
                                                ),
                                              );
                                            } else {
                                              await actions
                                                  .openNotificationSettings();
                                            }

                                            safeSetState(() {});
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: SvgPicture.asset(
                                              'assets/images/notification.svg',
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0xFFE0E0E0),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'NewsListPage',
                                            queryParameters: {
                                              'newsType': serializeParam(
                                                'all',
                                                ParamType.String,
                                              ),
                                              'newsTitle': serializeParam(
                                                'બધા સમાચાર',
                                                ParamType.String,
                                              ),
                                              'searchKeyword': serializeParam(
                                                '',
                                                ParamType.String,
                                              ),
                                              'searchForNews': serializeParam(
                                                1,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/search-normal.svg',
                                                  width: 20.0,
                                                  height: 20.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'સમાચાર શોધો',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'BalooBhaiGujarati',
                                                    color: Color(0xFF808080),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 0.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (FFAppState().isUserLoggedIn) {
                                            context.pushNamed(
                                              'NewsListPage',
                                              queryParameters: {
                                                'newsType': serializeParam(
                                                  'saved',
                                                  ParamType.String,
                                                ),
                                                'newsTitle': serializeParam(
                                                  'સાચવેલા સમાચાર',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: LoginPopupWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.45,
                                          height: 52.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3.0,
                                                color: Color(0x0FB0B0B0),
                                                offset: Offset(
                                                  0.0,
                                                  4.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/grid1.png',
                                                  width: 40.0,
                                                  height: 40.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                'સાચવેલા સમાચાર',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Color(0xFF1A1A1A),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ]
                                                .divide(SizedBox(width: 5.0))
                                                .addToStart(
                                                    SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'NewsListPage',
                                            queryParameters: {
                                              'newsType': serializeParam(
                                                'all',
                                                ParamType.String,
                                              ),
                                              'newsTitle': serializeParam(
                                                'બધા સમાચાર',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.45,
                                          height: 52.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3.0,
                                                color: Color(0x0FB0B0B0),
                                                offset: Offset(
                                                  0.0,
                                                  4.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/grid2.png',
                                                  width: 40.0,
                                                  height: 40.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                'બધા સમાચાર',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Color(0xFF1A1A1A),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ]
                                                .divide(SizedBox(width: 5.0))
                                                .addToStart(
                                                    SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .addToStart(SizedBox(width: 0.0))
                                        .addToEnd(SizedBox(width: 0.0)),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'NewsListPage',
                                              queryParameters: {
                                                'newsType': serializeParam(
                                                  'top',
                                                  ParamType.String,
                                                ),
                                                'newsTitle': serializeParam(
                                                  'મુખ્ય સમાચાર',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.45,
                                            height: 52.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 3.0,
                                                  color: Color(0x0FB0B0B0),
                                                  offset: Offset(
                                                    0.0,
                                                    4.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/grid3.png',
                                                    width: 40.0,
                                                    height: 40.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  'મુખ્ય સમાચાર',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            Color(0xFF1A1A1A),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ]
                                                  .divide(SizedBox(width: 5.0))
                                                  .addToStart(
                                                      SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'LatestPropertiesListPage',
                                              queryParameters: {
                                                'propertyType': serializeParam(
                                                  'latest',
                                                  ParamType.String,
                                                ),
                                                'propertyTitle': serializeParam(
                                                  'નવી મિલકત',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.45,
                                            height: 52.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 3.0,
                                                  color: Color(0x0FB0B0B0),
                                                  offset: Offset(
                                                    0.0,
                                                    4.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/grid4.png',
                                                    width: 40.0,
                                                    height: 40.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  'નવી મિલકત',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            Color(0xFF1A1A1A),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ]
                                                  .divide(SizedBox(width: 5.0))
                                                  .addToStart(
                                                      SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(width: 8.0))
                                          .addToStart(SizedBox(width: 0.0))
                                          .addToEnd(SizedBox(width: 0.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'AllPropertiesListPage',
                                              queryParameters: {
                                                'propertyType': serializeParam(
                                                  'all',
                                                  ParamType.String,
                                                ),
                                                'propertyTitle': serializeParam(
                                                  'તમામ મિલકત',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.45,
                                            height: 52.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 3.0,
                                                  color: Color(0x0FB0B0B0),
                                                  offset: Offset(
                                                    0.0,
                                                    4.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/grid5.png',
                                                    width: 40.0,
                                                    height: 40.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  'તમામ મિલકત',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            Color(0xFF1A1A1A),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ]
                                                  .divide(SizedBox(width: 5.0))
                                                  .addToStart(
                                                      SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('HoroscopePage');
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.45,
                                            height: 52.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 3.0,
                                                  color: Color(0x0FB0B0B0),
                                                  offset: Offset(
                                                    0.0,
                                                    4.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/grid6.png',
                                                    width: 40.0,
                                                    height: 40.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  'રાશિફળ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            Color(0xFF1A1A1A),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ]
                                                  .divide(SizedBox(width: 5.0))
                                                  .addToStart(
                                                      SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(width: 8.0))
                                          .addToStart(SizedBox(width: 0.0))
                                          .addToEnd(SizedBox(width: 0.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'મુખ્ય સમાચાર',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'BalooBhaiGujarati',
                                                color: Color(0xFF1A1A1A),
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'NewsListPage',
                                              queryParameters: {
                                                'newsType': serializeParam(
                                                  'top',
                                                  ParamType.String,
                                                ),
                                                'newsTitle': serializeParam(
                                                  'મુખ્ય સમાચાર',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'વધુ જુઓ ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'BalooBhaiGujarati',
                                                          color:
                                                              Color(0xFF5374FF),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.angleRight,
                                                color: Color(0xFF5374FF),
                                                size: 16.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (FFAppState().authTokenAPI != null &&
                                      FFAppState().authTokenAPI != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: RBNewsAPIGroup.dashboardDataCall
                                            .call(
                                          authToken: FFAppState().authTokenAPI,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewDashboardDataResponse =
                                              snapshot.data!;
                                          _model.debugBackendQueries[
                                                  'RBNewsAPIGroup.dashboardDataCall_statusCode_ListView_2ilb4548'] =
                                              debugSerializeParam(
                                            listViewDashboardDataResponse
                                                .statusCode,
                                            ParamType.int,
                                            link:
                                                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
                                            name: 'int',
                                            nullable: false,
                                          );
                                          _model.debugBackendQueries[
                                                  'RBNewsAPIGroup.dashboardDataCall_responseBody_ListView_2ilb4548'] =
                                              debugSerializeParam(
                                            listViewDashboardDataResponse
                                                .bodyText,
                                            ParamType.String,
                                            link:
                                                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
                                            name: 'String',
                                            nullable: false,
                                          );
                                          debugLogWidgetClass(_model);

                                          return Builder(
                                            builder: (context) {
                                              final newsList = (RBNewsAPIGroup
                                                          .dashboardDataCall
                                                          .newsListArray(
                                                            listViewDashboardDataResponse
                                                                .jsonBody,
                                                          )
                                                          ?.toList() ??
                                                      [])
                                                  .take(3)
                                                  .toList();
                                              _model.debugGeneratorVariables[
                                                      'newsList${newsList.length > 100 ? ' (first 100)' : ''}'] =
                                                  debugSerializeParam(
                                                newsList.take(100),
                                                ParamType.JSON,
                                                isList: true,
                                                link:
                                                    'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
                                                name: 'dynamic',
                                                nullable: false,
                                              );
                                              debugLogWidgetClass(_model);

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: newsList.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 12.0),
                                                itemBuilder:
                                                    (context, newsListIndex) {
                                                  final newsListItem =
                                                      newsList[newsListIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'NewsDetailCarouselPage',
                                                        queryParameters: {
                                                          'newsListPageArray':
                                                              serializeParam(
                                                            getJsonField(
                                                              listViewDashboardDataResponse
                                                                  .jsonBody,
                                                              r'''$.data.newsList''',
                                                              true,
                                                            ),
                                                            ParamType.JSON,
                                                            isList: true,
                                                          ),
                                                          'isFromList':
                                                              serializeParam(
                                                            true,
                                                            ParamType.bool,
                                                          ),
                                                          'currentNewsPageInitalIDX':
                                                              serializeParam(
                                                            newsListIndex,
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 3.0,
                                                            color: Color(
                                                                0x0FB0B0B0),
                                                            offset: Offset(
                                                              0.0,
                                                              4.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              child:
                                                                  Image.network(
                                                                getJsonField(
                                                                  newsListItem,
                                                                  r'''$.newsImage''',
                                                                ).toString(),
                                                                width: 98.0,
                                                                height: 128.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  width: 98.0,
                                                                  height: 128.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFF1F3FE),
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 0.0, 3.0),
                                                                                child: Text(
                                                                                  '•',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'BalooBhaiGujarati',
                                                                                        color: Color(0xFF5374FF),
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 10.0, 3.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      newsListItem,
                                                                                      r'''$.newsCategoryName''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          fontFamily: 'BalooBhaiGujarati',
                                                                                          color: Color(0xFF5374FF),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    getJsonField(
                                                                      newsListItem,
                                                                      r'''$.newsTitle''',
                                                                    )
                                                                        .toString()
                                                                        .maybeHandleOverflow(
                                                                          maxChars:
                                                                              58,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'BalooBhaiGujarati',
                                                                          color:
                                                                              Color(0xFF4D4D4D),
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        42.0,
                                                                    child: custom_widgets
                                                                        .HtmlViewer(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          42.0,
                                                                      htmlContent:
                                                                          getJsonField(
                                                                        newsListItem,
                                                                        r'''$.newsDescription''',
                                                                      ).toString(),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'નવી મિલકત',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'BalooBhaiGujarati',
                                                color: Color(0xFF1A1A1A),
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'LatestPropertiesListPage',
                                              queryParameters: {
                                                'propertyType': serializeParam(
                                                  'latest',
                                                  ParamType.String,
                                                ),
                                                'propertyTitle': serializeParam(
                                                  'નવી મિલકત',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'વધુ જુઓ ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'BalooBhaiGujarati',
                                                          color:
                                                              Color(0xFF5374FF),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.angleRight,
                                                color: Color(0xFF5374FF),
                                                size: 16.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final propertyList =
                                            (RBNewsAPIGroup.dashboardDataCall
                                                        .propertyListArray(
                                                          homePageDashboardDataResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [])
                                                .take(3)
                                                .toList();
                                        _model.debugGeneratorVariables[
                                                'propertyList${propertyList.length > 100 ? ' (first 100)' : ''}'] =
                                            debugSerializeParam(
                                          propertyList.take(100),
                                          ParamType.JSON,
                                          isList: true,
                                          link:
                                              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
                                          name: 'dynamic',
                                          nullable: false,
                                        );
                                        debugLogWidgetClass(_model);

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: propertyList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 12.0),
                                          itemBuilder:
                                              (context, propertyListIndex) {
                                            final propertyListItem =
                                                propertyList[propertyListIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'PropertyDetailListPage',
                                                  queryParameters: {
                                                    'propertyId':
                                                        serializeParam(
                                                      getJsonField(
                                                        propertyListItem,
                                                        r'''$.propertyId''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                    'propertyListArray':
                                                        serializeParam(
                                                      getJsonField(
                                                        homePageDashboardDataResponse
                                                            .jsonBody,
                                                        r'''$.data.propertiesList''',
                                                        true,
                                                      ),
                                                      ParamType.JSON,
                                                      isList: true,
                                                    ),
                                                    'currentPageIndex':
                                                        serializeParam(
                                                      propertyListIndex,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 3.0,
                                                      color: Color(0x0FB0B0B0),
                                                      offset: Offset(
                                                        0.0,
                                                        4.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        child: Image.network(
                                                          functions
                                                              .getImagePath(
                                                                  getJsonField(
                                                            propertyListItem,
                                                            r'''$.propertyImagesURL[0]''',
                                                          ).toString()),
                                                          width: 98.0,
                                                          height: 128.0,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.png',
                                                            width: 98.0,
                                                            height: 128.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFF1F3FE),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            7.0,
                                                                            3.0,
                                                                            0.0,
                                                                            3.0),
                                                                        child:
                                                                            Text(
                                                                          '•',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'BalooBhaiGujarati',
                                                                                color: Color(0xFF5374FF),
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              7.0,
                                                                              3.0,
                                                                              10.0,
                                                                              3.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              propertyListItem,
                                                                              r'''$.propertyType''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: 'BalooBhaiGujarati',
                                                                                  color: Color(0xFF5374FF),
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              getJsonField(
                                                                propertyListItem,
                                                                r'''$.propertyName''',
                                                              )
                                                                  .toString()
                                                                  .maybeHandleOverflow(
                                                                    maxChars:
                                                                        58,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'BalooBhaiGujarati',
                                                                    color: Color(
                                                                        0xFF4D4D4D),
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 42.0,
                                                              child:
                                                                  custom_widgets
                                                                      .HtmlViewer(
                                                                width: double
                                                                    .infinity,
                                                                height: 42.0,
                                                                htmlContent:
                                                                    getJsonField(
                                                                  propertyListItem,
                                                                  r'''$.propertyDescription''',
                                                                ).toString(),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'રાશિફળ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'BalooBhaiGujarati',
                                                color: Color(0xFF1A1A1A),
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('HoroscopePage');
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'વધુ જુઓ ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'BalooBhaiGujarati',
                                                          color:
                                                              Color(0xFF5374FF),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.angleRight,
                                                color: Color(0xFF5374FF),
                                                size: 16.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final horoscopeList =
                                              RBNewsAPIGroup.dashboardDataCall
                                                      .zodiacSignList(
                                                        homePageDashboardDataResponse
                                                            .jsonBody,
                                                      )
                                                      ?.toList() ??
                                                  [];
                                          _model.debugGeneratorVariables[
                                                  'horoscopeList${horoscopeList.length > 100 ? ' (first 100)' : ''}'] =
                                              debugSerializeParam(
                                            horoscopeList.take(100),
                                            ParamType.JSON,
                                            isList: true,
                                            link:
                                                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HomePage',
                                            name: 'dynamic',
                                            nullable: false,
                                          );
                                          debugLogWidgetClass(_model);

                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                              childAspectRatio: 1.0,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: horoscopeList.length,
                                            itemBuilder:
                                                (context, horoscopeListIndex) {
                                              final horoscopeListItem =
                                                  horoscopeList[
                                                      horoscopeListIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'HoroscopeDetailNew',
                                                    queryParameters: {
                                                      'zodiacSignId':
                                                          serializeParam(
                                                        getJsonField(
                                                          horoscopeListItem,
                                                          r'''$.zodiacSignId''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'currentZodiacIndex':
                                                          serializeParam(
                                                        horoscopeListIndex,
                                                        ParamType.int,
                                                      ),
                                                      'zodiacListArray':
                                                          serializeParam(
                                                        getJsonField(
                                                          homePageDashboardDataResponse
                                                              .jsonBody,
                                                          r'''$.data.zodiacSignList''',
                                                          true,
                                                        ),
                                                        ParamType.JSON,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  FFAppState()
                                                          .zodiacLDetailIndex =
                                                      horoscopeListIndex;
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Container(
                                                    width: 70.0,
                                                    height: 70.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 3.0,
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          child: custom_widgets
                                                              .ImageNetworkWidget(
                                                            width: 32.0,
                                                            height: 32.0,
                                                            url: getJsonField(
                                                              horoscopeListItem,
                                                              r'''$.zodiacSignIcon''',
                                                            ).toString(),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      8.0,
                                                                      2.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              horoscopeListItem,
                                                              r'''$.zodiacSignName''',
                                                            )
                                                                .toString()
                                                                .maybeHandleOverflow(
                                                                  maxChars: 7,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'BalooBhaiGujarati',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: Text(
                            'Developed By ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'BalooBhaiGujarati',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL('http://theuniqueitsolution.com');
                          },
                          child: Text(
                            'Unique IT Solution',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'BalooBhaiGujarati',
                                  color: Color(0xFF5374FF),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
