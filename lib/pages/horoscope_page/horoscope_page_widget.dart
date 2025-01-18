import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'horoscope_page_model.dart';
export 'horoscope_page_model.dart';

class HoroscopePageWidget extends StatefulWidget {
  const HoroscopePageWidget({super.key});

  @override
  State<HoroscopePageWidget> createState() => _HoroscopePageWidgetState();
}

class _HoroscopePageWidgetState extends State<HoroscopePageWidget>
    with RouteAware {
  late HoroscopePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HoroscopePageModel());
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF8F8F8),
        appBar: AppBar(
          backgroundColor: Color(0xFFF8F8F8),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/back.svg',
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'રાશિફળ',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'BalooBhaiGujarati',
                          color: Color(0xFF1A1A1A),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.0,
                child: FlutterFlowIconButton(
                  borderColor: Color(0xFFE6E6E6),
                  borderRadius: 12.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    color: Color(0xFF808080),
                    size: 24.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        child: FutureBuilder<ApiCallResponse>(
                          future: RBNewsAPIGroup.zodiacListCall.call(
                            authToken: FFAppState().authTokenAPI,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 320.0, 0.0, 0.0),
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
                            final listViewZodiacListResponse = snapshot.data!;
                            _model.debugBackendQueries[
                                    'RBNewsAPIGroup.zodiacListCall_statusCode_ListView_ji81sl0p'] =
                                debugSerializeParam(
                              listViewZodiacListResponse.statusCode,
                              ParamType.int,
                              link:
                                  'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HoroscopePage',
                              name: 'int',
                              nullable: false,
                            );
                            _model.debugBackendQueries[
                                    'RBNewsAPIGroup.zodiacListCall_responseBody_ListView_ji81sl0p'] =
                                debugSerializeParam(
                              listViewZodiacListResponse.bodyText,
                              ParamType.String,
                              link:
                                  'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HoroscopePage',
                              name: 'String',
                              nullable: false,
                            );
                            debugLogWidgetClass(_model);

                            return Builder(
                              builder: (context) {
                                final zodiacList = RBNewsAPIGroup.zodiacListCall
                                        .zodiaListArray(
                                          listViewZodiacListResponse.jsonBody,
                                        )
                                        ?.toList() ??
                                    [];
                                _model.debugGeneratorVariables[
                                        'zodiacList${zodiacList.length > 100 ? ' (first 100)' : ''}'] =
                                    debugSerializeParam(
                                  zodiacList.take(100),
                                  ParamType.JSON,
                                  isList: true,
                                  link:
                                      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HoroscopePage',
                                  name: 'dynamic',
                                  nullable: false,
                                );
                                debugLogWidgetClass(_model);

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: zodiacList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 12.0),
                                  itemBuilder: (context, zodiacListIndex) {
                                    final zodiacListItem =
                                        zodiacList[zodiacListIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'HoroscopeDetailNew',
                                          queryParameters: {
                                            'zodiacSignId': serializeParam(
                                              getJsonField(
                                                zodiacListItem,
                                                r'''$.zodiacSignId''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                            'currentZodiacIndex':
                                                serializeParam(
                                              zodiacListIndex,
                                              ParamType.int,
                                            ),
                                            'zodiacListArray': serializeParam(
                                              getJsonField(
                                                listViewZodiacListResponse
                                                    .jsonBody,
                                                r'''$.data''',
                                                true,
                                              ),
                                              ParamType.JSON,
                                              isList: true,
                                            ),
                                          }.withoutNulls,
                                        );

                                        FFAppState().zodiacLDetailIndex =
                                            zodiacListIndex;
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 90.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 1.0,
                                                color: Color(0x11B0B0B0),
                                                offset: Offset(
                                                  0.0,
                                                  1.0,
                                                ),
                                                spreadRadius: 0.0,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(6.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 78.0,
                                                      height: 78.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEEF1FF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 32.0,
                                                        height: 32.0,
                                                        child: custom_widgets
                                                            .ImageNetworkWidget(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          url: getJsonField(
                                                            zodiacListItem,
                                                            r'''$.zodiacSignIcon''',
                                                          ).toString(),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              zodiacListItem,
                                                              r'''$.zodiacSignName''',
                                                            ).toString(),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'BalooBhaiGujarati',
                                                                  color: Color(
                                                                      0xFF4D4D4D),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 20.0,
                                                            child:
                                                                custom_widgets
                                                                    .HtmlViewer(
                                                              width: double
                                                                  .infinity,
                                                              height: 20.0,
                                                              htmlContent:
                                                                  getJsonField(
                                                                zodiacListItem,
                                                                r'''$.zodiacSignDescription''',
                                                              ).toString(),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
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
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                      child: Text(
                        'Developed By ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
  }
}
