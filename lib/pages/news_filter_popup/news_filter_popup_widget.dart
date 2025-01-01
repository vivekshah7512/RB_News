import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'news_filter_popup_model.dart';
export 'news_filter_popup_model.dart';

class NewsFilterPopupWidget extends StatefulWidget {
  const NewsFilterPopupWidget({super.key});

  @override
  State<NewsFilterPopupWidget> createState() => _NewsFilterPopupWidgetState();
}

class _NewsFilterPopupWidgetState extends State<NewsFilterPopupWidget>
    with RouteAware {
  late NewsFilterPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsFilterPopupModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ફિલ્ટર કરો',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Outfit',
                        letterSpacing: 0.0,
                      ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().selectedFilterIds = '  ';
                    FFAppState().selectedNewsCategoryTop = [];
                    safeSetState(() {});
                  },
                  child: Text(
                    'બધા સાફ કરો',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFF5374FF),
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FutureBuilder<ApiCallResponse>(
                  future: RBNewsAPIGroup.newsCategoriesListCall.call(
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
                    final listViewNewsCategoriesListResponse = snapshot.data!;
                    _model.debugBackendQueries[
                            'RBNewsAPIGroup.newsCategoriesListCall_statusCode_ListView_cconploo'] =
                        debugSerializeParam(
                      listViewNewsCategoriesListResponse.statusCode,
                      ParamType.int,
                      link:
                          'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
                      name: 'int',
                      nullable: false,
                    );
                    _model.debugBackendQueries[
                            'RBNewsAPIGroup.newsCategoriesListCall_responseBody_ListView_cconploo'] =
                        debugSerializeParam(
                      listViewNewsCategoriesListResponse.bodyText,
                      ParamType.String,
                      link:
                          'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
                      name: 'String',
                      nullable: false,
                    );
                    debugLogWidgetClass(_model);

                    return Builder(
                      builder: (context) {
                        final categoryListArray =
                            RBNewsAPIGroup.newsCategoriesListCall
                                .newsCategoryArray(
                                  listViewNewsCategoriesListResponse.jsonBody,
                                )
                                .toList();
                        _model.debugGeneratorVariables[
                                'categoryListArray${categoryListArray.length > 100 ? ' (first 100)' : ''}'] =
                            debugSerializeParam(
                          categoryListArray.take(100),
                          ParamType.JSON,
                          link:
                              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsFilterPopup',
                          name: 'dynamic',
                          nullable: false,
                        );
                        debugLogWidgetClass(_model);

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: categoryListArray.length,
                          itemBuilder: (context, categoryListArrayIndex) {
                            final categoryListArrayItem =
                                categoryListArray[categoryListArrayIndex];
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  getJsonField(
                                    categoryListArrayItem,
                                    r'''$.newsCategoryName''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor: Color(0xFFB4B5B9),
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValueMap1[
                                            categoryListArrayItem] ??=
                                        functions.isFilterChecked(
                                            getJsonField(
                                              categoryListArrayItem,
                                              r'''$.newsCategoryID''',
                                            ),
                                            FFAppState()
                                                .selectedNewsCategoryTop
                                                .toList())!,
                                    onChanged: (newValue) async {
                                      safeSetState(() => _model
                                              .checkboxValueMap1[
                                          categoryListArrayItem] = newValue!);
                                      if (newValue!) {
                                        _model.testresult = await actions
                                            .manageNewsCategoryFilter(
                                          getJsonField(
                                            categoryListArrayItem,
                                            r'''$.newsCategoryName''',
                                          ).toString(),
                                          getJsonField(
                                            categoryListArrayItem,
                                            r'''$.newsCategoryID''',
                                          ),
                                          true,
                                        );

                                        safeSetState(() {});
                                      } else {
                                        _model.testresultCopy = await actions
                                            .manageNewsCategoryFilter(
                                          getJsonField(
                                            categoryListArrayItem,
                                            r'''$.newsCategoryName''',
                                          ).toString(),
                                          getJsonField(
                                            categoryListArrayItem,
                                            r'''$.newsCategoryID''',
                                          ),
                                          false,
                                        );

                                        safeSetState(() {});
                                      }
                                    },
                                    side: BorderSide(
                                      width: 2,
                                      color: Color(0xFFB4B5B9),
                                    ),
                                    activeColor: Color(0xFF5374FF),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
