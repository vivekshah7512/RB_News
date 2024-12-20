import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    routeObserver.subscribe(this, DebugModalRoute.of(context)!);
    debugLogGlobalProperty(context);
  }

  @override
  void didPopNext() {
    safeSetState(() => _model.isRouteVisible = true);
    debugLogWidgetClass(_model);
  }

  @override
  void didPush() {
    safeSetState(() => _model.isRouteVisible = true);
    debugLogWidgetClass(_model);
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: FlutterFlowIconButton(
                    borderColor: Color(0xFFE6E6E6),
                    borderRadius: 12.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF808080),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                ),
                Expanded(
                  child: Text(
                    'રાશિફળ',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFF1A1A1A),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
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
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitFadingFour(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
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
                                    SizedBox(height: 20.0),
                                itemBuilder: (context, zodiacListIndex) {
                                  final zodiacListItem =
                                      zodiacList[zodiacListIndex];
                                  return Material(
                                    color: Colors.transparent,
                                    elevation: 2.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'HoroscopesDetailPage',
                                                  queryParameters: {
                                                    'horoscopeId':
                                                        serializeParam(
                                                      getJsonField(
                                                        zodiacListItem,
                                                        r'''$.zodiacSignId''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 85.0,
                                                    height: 85.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF1F3FE),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(24.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          getJsonField(
                                                            zodiacListItem,
                                                            r'''$.zodiacSignIcon''',
                                                          ).toString(),
                                                          width: 80.0,
                                                          height: 80.0,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.png',
                                                            width: 80.0,
                                                            height: 80.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
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
                                                                    'Readex Pro',
                                                                color: Color(
                                                                    0xFF4D4D4D),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 50.0,
                                                            child:
                                                                custom_widgets
                                                                    .HtmlViewer(
                                                              width: double
                                                                  .infinity,
                                                              height: 50.0,
                                                              htmlContent:
                                                                  getJsonField(
                                                                zodiacListItem,
                                                                r'''$.zodiacSignDescription''',
                                                              ).toString(),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 16.0)),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
