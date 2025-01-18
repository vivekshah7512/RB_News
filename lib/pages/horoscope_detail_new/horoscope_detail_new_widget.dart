import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'horoscope_detail_new_model.dart';
export 'horoscope_detail_new_model.dart';

class HoroscopeDetailNewWidget extends StatefulWidget {
  const HoroscopeDetailNewWidget({
    super.key,
    String? zodiacSignId,
    int? currentZodiacIndex,
    this.zodiacListArray,
  })  : this.zodiacSignId = zodiacSignId ?? '0',
        this.currentZodiacIndex = currentZodiacIndex ?? 0;

  final String zodiacSignId;
  final int currentZodiacIndex;
  final List<dynamic>? zodiacListArray;

  @override
  State<HoroscopeDetailNewWidget> createState() =>
      _HoroscopeDetailNewWidgetState();
}

class _HoroscopeDetailNewWidgetState extends State<HoroscopeDetailNewWidget>
    with RouteAware {
  late HoroscopeDetailNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HoroscopeDetailNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.zodiacSignId == '0') {
        _model.apiResultnoa = await RBNewsAPIGroup.zodiacListCall.call(
          authToken: FFAppState().authTokenAPI,
        );

        if ((_model.apiResultnoa?.succeeded ?? true)) {
          _model.zodiacListPageStateArray = getJsonField(
            (_model.apiResultnoa?.jsonBody ?? ''),
            r'''$.data''',
            true,
          )!
              .toList()
              .cast<dynamic>();
          safeSetState(() {});
        }
      } else {
        _model.zodiacListPageStateArray =
            widget!.zodiacListArray!.toList().cast<dynamic>();
        safeSetState(() {});
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Builder(
              builder: (context) {
                final zodiacListLocalArray =
                    (!(widget!.zodiacListArray != null &&
                                    (widget!.zodiacListArray)!.isNotEmpty)
                                ? _model.zodiacListPageStateArray
                                : widget!.zodiacListArray)
                            ?.toList() ??
                        [];
                _model.debugGeneratorVariables[
                        'zodiacListLocalArray${zodiacListLocalArray.length > 100 ? ' (first 100)' : ''}'] =
                    debugSerializeParam(
                  zodiacListLocalArray.take(100),
                  ParamType.JSON,
                  isList: true,
                  link:
                      'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=HoroscopeDetailNew',
                  name: 'dynamic',
                  nullable: false,
                );
                debugLogWidgetClass(_model);

                return Container(
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _model.pageViewController ??= PageController(
                        initialPage: max(
                            0,
                            min(
                                valueOrDefault<int>(
                                  widget!.currentZodiacIndex,
                                  0,
                                ),
                                zodiacListLocalArray.length - 1)))
                      ..addListener(() {
                        debugLogWidgetClass(_model);
                      }),
                    scrollDirection: Axis.horizontal,
                    itemCount: zodiacListLocalArray.length,
                    itemBuilder: (context, zodiacListLocalArrayIndex) {
                      final zodiacListLocalArrayItem =
                          zodiacListLocalArray[zodiacListLocalArrayIndex];
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 310.0,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: SvgPicture.network(
                                      getJsonField(
                                        zodiacListLocalArrayItem,
                                        r'''$.zodiacSignImage''',
                                      ).toString(),
                                      width: double.infinity,
                                      height: 310.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.01),
                                    child: Container(
                                      width: double.infinity,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(40.0),
                                          topRight: Radius.circular(40.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 78.0,
                                            height: 78.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF1F3FE),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: SvgPicture.network(
                                                getJsonField(
                                                  zodiacListLocalArrayItem,
                                                  r'''$.zodiacSignIcon''',
                                                ).toString(),
                                                width: 32.0,
                                                height: 32.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 4.0, 0.0),
                                                  child: Text(
                                                    getJsonField(
                                                      zodiacListLocalArrayItem,
                                                      r'''$.zodiacSignName''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'BalooBhaiGujarati',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 4.0, 0.0),
                                                  child: Text(
                                                    '${functions.horoscopeDateRangeFormat(getJsonField(
                                                      zodiacListLocalArrayItem,
                                                      r'''$.createdDate''',
                                                    ).toString())} - ${functions.horoscopeDateRangeFormat(getJsonField(
                                                      zodiacListLocalArrayItem,
                                                      r'''$.modifiedDate''',
                                                    ).toString())}',
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'BalooBhaiGujarati',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'તત્વ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'BalooBhaiGujarati',
                                                        color:
                                                            Color(0xFF999999),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Text(
                                                  getJsonField(
                                                    zodiacListLocalArrayItem,
                                                    r'''$.element''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'BalooBhaiGujarati',
                                                        color:
                                                            Color(0xFF4D4D4D),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'શાસક ગ્રહ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'BalooBhaiGujarati',
                                                        color:
                                                            Color(0xFF999999),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Text(
                                                  getJsonField(
                                                    zodiacListLocalArrayItem,
                                                    r'''$.rulingPlanet''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'BalooBhaiGujarati',
                                                        color:
                                                            Color(0xFF4D4D4D),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'પ્રતીક',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'BalooBhaiGujarati',
                                                        color:
                                                            Color(0xFF999999),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Text(
                                                  getJsonField(
                                                    zodiacListLocalArrayItem,
                                                    r'''$.symbol''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'BalooBhaiGujarati',
                                                        color:
                                                            Color(0xFF4D4D4D),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 0.0, 0.0),
                                        child: Text(
                                          'વર્ણન',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'BalooBhaiGujarati',
                                                color: Color(0xFF999999),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      custom_widgets.ReadMoreWidget(
                                        width: double.infinity,
                                        textContent: getJsonField(
                                          zodiacListLocalArrayItem,
                                          r'''$.zodiacSignDescription''',
                                        ).toString(),
                                        colorClickableText:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 0.0, 0.0),
                                        child: Text(
                                          'દૈનિક સલાહ',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'BalooBhaiGujarati',
                                                color: Color(0xFF999999),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      custom_widgets.ReadMoreWidget(
                                        width: double.infinity,
                                        textContent: getJsonField(
                                                  zodiacListLocalArrayItem,
                                                  r'''$.description''',
                                                ) ==
                                                null
                                            ? 'રાશિફળ હાલમાં ઉપલબ્ધ નથી.'
                                            : getJsonField(
                                                zodiacListLocalArrayItem,
                                                r'''$.description''',
                                              ).toString(),
                                        colorClickableText:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
