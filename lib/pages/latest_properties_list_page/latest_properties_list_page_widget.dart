import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
import 'latest_properties_list_page_model.dart';
export 'latest_properties_list_page_model.dart';

class LatestPropertiesListPageWidget extends StatefulWidget {
  const LatestPropertiesListPageWidget({
    super.key,
    String? propertyType,
    String? propertyTitle,
  })  : this.propertyType = propertyType ?? 'all',
        this.propertyTitle = propertyTitle ?? 'તમામ મિલકત';

  final String propertyType;
  final String propertyTitle;

  @override
  State<LatestPropertiesListPageWidget> createState() =>
      _LatestPropertiesListPageWidgetState();
}

class _LatestPropertiesListPageWidgetState
    extends State<LatestPropertiesListPageWidget> with RouteAware {
  late LatestPropertiesListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LatestPropertiesListPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().currentNewsPage = 1;
      safeSetState(() {});
      _model.apiResult4pq = await RBNewsAPIGroup.latestPropertyListCall.call(
        authToken: FFAppState().authTokenAPI,
        pageNumber: FFAppState().currentNewsPage,
        searchText: _model.textController.text,
        pageSize: FFAppState().pageSize,
      );

      if ((_model.apiResult4pq?.succeeded ?? true)) {
        FFAppState().totalNewsPage = functions.getDivideVars(
            getJsonField(
              (_model.apiResult4pq?.jsonBody ?? ''),
              r'''$.totalCount''',
            ),
            10);
        safeSetState(() {});
      }
    });

    _model.textController ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.textFieldFocusNode ??= FocusNode();
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Text(
                widget!.propertyTitle,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'BalooBhaiGujarati',
                      color: Color(0xFF1A1A1A),
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: false,
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
                controller: _model.columnController,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Color(0xFFE0E0E0),
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/search-normal.svg',
                                    width: 20.0,
                                    height: 20.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onFieldSubmitted: (_) async {
                                    FFAppState().currentNewsPage = 1;
                                    safeSetState(() {});
                                    _model.apiResult4pqsearch =
                                        await RBNewsAPIGroup
                                            .latestPropertyListCall
                                            .call(
                                      authToken: FFAppState().authTokenAPI,
                                      pageNumber: FFAppState().currentNewsPage,
                                      searchText: _model.textController.text,
                                      pageSize: FFAppState().pageSize,
                                    );

                                    if ((_model.apiResult4pqsearch?.succeeded ??
                                        true)) {
                                      FFAppState().totalNewsPage =
                                          functions.getDivideVars(
                                              getJsonField(
                                                (_model.apiResult4pqsearch
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.totalCount''',
                                              ),
                                              FFAppState().pageSize);
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  },
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'મિલકત શોધો',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'BalooBhaiGujarati',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'BalooBhaiGujarati',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  minLines: 1,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ].divide(SizedBox(width: 0.0)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: RBNewsAPIGroup.latestPropertyListCall.call(
                          authToken: FFAppState().authTokenAPI,
                          pageNumber: FFAppState().currentNewsPage,
                          searchText: _model.textController.text,
                          pageSize: FFAppState().pageSize,
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
                          final listViewLatestPropertyListResponse =
                              snapshot.data!;
                          _model.debugBackendQueries[
                                  'RBNewsAPIGroup.latestPropertyListCall_statusCode_ListView_2j9cjsuo'] =
                              debugSerializeParam(
                            listViewLatestPropertyListResponse.statusCode,
                            ParamType.int,
                            link:
                                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LatestPropertiesListPage',
                            name: 'int',
                            nullable: false,
                          );
                          _model.debugBackendQueries[
                                  'RBNewsAPIGroup.latestPropertyListCall_responseBody_ListView_2j9cjsuo'] =
                              debugSerializeParam(
                            listViewLatestPropertyListResponse.bodyText,
                            ParamType.String,
                            link:
                                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LatestPropertiesListPage',
                            name: 'String',
                            nullable: false,
                          );
                          debugLogWidgetClass(_model);

                          return Builder(
                            builder: (context) {
                              final latestPropertyList = RBNewsAPIGroup
                                  .latestPropertyListCall
                                  .latestPropertylistArray(
                                    listViewLatestPropertyListResponse.jsonBody,
                                  )
                                  .toList();
                              _model.debugGeneratorVariables[
                                      'latestPropertyList${latestPropertyList.length > 100 ? ' (first 100)' : ''}'] =
                                  debugSerializeParam(
                                latestPropertyList.take(100),
                                ParamType.JSON,
                                link:
                                    'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=LatestPropertiesListPage',
                                name: 'dynamic',
                                nullable: false,
                              );
                              debugLogWidgetClass(_model);

                              return ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: latestPropertyList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 12.0),
                                itemBuilder:
                                    (context, latestPropertyListIndex) {
                                  final latestPropertyListItem =
                                      latestPropertyList[
                                          latestPropertyListIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'PropertyDetailListPage',
                                        queryParameters: {
                                          'propertyId': serializeParam(
                                            getJsonField(
                                              latestPropertyListItem,
                                              r'''$.propertyId''',
                                            ),
                                            ParamType.int,
                                          ),
                                          'propertyListArray': serializeParam(
                                            getJsonField(
                                              listViewLatestPropertyListResponse
                                                  .jsonBody,
                                              r'''$.data''',
                                              true,
                                            ),
                                            ParamType.JSON,
                                            isList: true,
                                          ),
                                          'currentPageIndex': serializeParam(
                                            latestPropertyListIndex,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
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
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8.0),
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                                child: Image.network(
                                                  getJsonField(
                                                    latestPropertyListItem,
                                                    r'''$.data.propertyImagesURL[0]''',
                                                  ).toString(),
                                                  width: 98.0,
                                                  height: 162.0,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.png',
                                                    width: 98.0,
                                                    height: 162.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF1F3FE),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            7.0,
                                                                            3.0,
                                                                            0.0,
                                                                            3.0),
                                                                    child: Text(
                                                                      '•',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'BalooBhaiGujarati',
                                                                            color:
                                                                                Color(0xFF5374FF),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
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
                                                                          latestPropertyListItem,
                                                                          r'''$.propertyType''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: 'BalooBhaiGujarati',
                                                                              color: Color(0xFF5374FF),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/share_property.png',
                                                                width: 32.0,
                                                                height: 32.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/call.png',
                                                                width: 35.0,
                                                                height: 35.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      getJsonField(
                                                        latestPropertyListItem,
                                                        r'''$.propertyName''',
                                                      )
                                                          .toString()
                                                          .maybeHandleOverflow(
                                                            maxChars: 58,
                                                            replacement: '…',
                                                          ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'BalooBhaiGujarati',
                                                            color: Color(
                                                                0xFF4D4D4D),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        child: custom_widgets
                                                            .HtmlViewer(
                                                          width:
                                                              double.infinity,
                                                          height: 40.0,
                                                          htmlContent:
                                                              getJsonField(
                                                            latestPropertyListItem,
                                                            r'''$.propertyDescription''',
                                                          ).toString(),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/location.png',
                                                              width: 20.0,
                                                              height: 20.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                              latestPropertyListItem,
                                                              r'''$.propertyLocation''',
                                                            ).toString(),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'BalooBhaiGujarati',
                                                                  color: Color(
                                                                      0xFF808080),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          '₹',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'BalooBhaiGujarati',
                                                                color: Color(
                                                                    0xFF1A1A1A),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      3.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            functions
                                                                .formatAmount(
                                                                    getJsonField(
                                                                  latestPropertyListItem,
                                                                  r'''$.propertyPrice''',
                                                                ))
                                                                .maybeHandleOverflow(
                                                                  maxChars: 24,
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
                                                                  color: Color(
                                                                      0xFF1A1A1A),
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
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 4.0)),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                controller: _model.listViewController,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 0.0)),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                child: Container(
                  width: 159.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: (FFAppState().currentNewsPage == 1)
                                  ? null
                                  : () async {
                                      _model.apiResultz0zCopy =
                                          await RBNewsAPIGroup
                                              .latestPropertyListCall
                                              .call(
                                        authToken: FFAppState().authTokenAPI,
                                        pageNumber:
                                            FFAppState().currentNewsPage,
                                        searchText: _model.textController.text,
                                        pageSize: FFAppState().pageSize,
                                      );

                                      if ((_model.apiResultz0zCopy?.succeeded ??
                                          true)) {
                                        FFAppState().totalNewsPage =
                                            functions.getDivideVars(
                                                getJsonField(
                                                  (_model.apiResultz0zCopy
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.totalCount''',
                                                ),
                                                FFAppState().pageSize);
                                        safeSetState(() {});
                                        if (FFAppState().currentNewsPage != 1) {
                                          FFAppState().currentNewsPage =
                                              FFAppState().currentNewsPage + -1;
                                          safeSetState(() {});
                                          _model.apiResultg10Copy =
                                              await RBNewsAPIGroup
                                                  .latestPropertyListCall
                                                  .call(
                                            authToken:
                                                FFAppState().authTokenAPI,
                                            pageNumber:
                                                FFAppState().currentNewsPage,
                                            searchText:
                                                _model.textController.text,
                                            pageSize: FFAppState().pageSize,
                                          );

                                          if ((_model.apiResultg10Copy
                                                  ?.succeeded ??
                                              true)) {
                                            FFAppState().totalNewsDataSize =
                                                getJsonField(
                                              (_model.apiResultg10Copy
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.totalCount''',
                                            );
                                            safeSetState(() {});
                                            await _model.columnController
                                                ?.animateTo(
                                              0,
                                              duration:
                                                  Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                          }
                                        }
                                      }

                                      safeSetState(() {});
                                    },
                              text: '',
                              icon: Icon(
                                Icons.chevron_left_rounded,
                                color: FFAppState().currentNewsPage == 1
                                    ? Color(0xFF808080)
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                size: 16.0,
                              ),
                              options: FFButtonOptions(
                                width: 40.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconAlignment: IconAlignment.start,
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).alternate,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'BalooBhaiGujarati',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFF2F2F2),
                                disabledTextColor: Color(0xFF808080),
                                hoverColor:
                                    FlutterFlowTheme.of(context).primary,
                                hoverTextColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '${FFAppState().currentNewsPage.toString()} / ${FFAppState().totalNewsPage.toString()}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'BalooBhaiGujarati',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: (FFAppState().currentNewsPage ==
                                      FFAppState().totalNewsPage)
                                  ? null
                                  : () async {
                                      _model.apiResultz0z = await RBNewsAPIGroup
                                          .latestPropertyListCall
                                          .call(
                                        authToken: FFAppState().authTokenAPI,
                                        pageNumber:
                                            FFAppState().currentNewsPage,
                                        searchText: _model.textController.text,
                                        pageSize: FFAppState().pageSize,
                                      );

                                      if ((_model.apiResultz0z?.succeeded ??
                                          true)) {
                                        FFAppState().totalNewsDataSize =
                                            getJsonField(
                                          (_model.apiResultz0z?.jsonBody ?? ''),
                                          r'''$.totalCount''',
                                        );
                                        safeSetState(() {});
                                        FFAppState().totalNewsPage =
                                            functions.getDivideVars(
                                                FFAppState().totalNewsDataSize,
                                                FFAppState().pageSize);
                                        safeSetState(() {});
                                        if (FFAppState().currentNewsPage !=
                                            FFAppState().totalNewsPage) {
                                          FFAppState().currentNewsPage =
                                              FFAppState().currentNewsPage + 1;
                                          safeSetState(() {});
                                          _model.apiResultg10 =
                                              await RBNewsAPIGroup
                                                  .latestPropertyListCall
                                                  .call(
                                            authToken:
                                                FFAppState().authTokenAPI,
                                            pageNumber:
                                                FFAppState().currentNewsPage,
                                            searchText:
                                                _model.textController.text,
                                            pageSize: FFAppState().pageSize,
                                          );

                                          if ((_model.apiResultg10?.succeeded ??
                                              true)) {
                                            FFAppState().totalNewsDataSize =
                                                getJsonField(
                                              (_model.apiResultg10?.jsonBody ??
                                                  ''),
                                              r'''$.totalCount''',
                                            );
                                            safeSetState(() {});
                                            await _model.columnController
                                                ?.animateTo(
                                              0,
                                              duration:
                                                  Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'No more data found',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'BalooBhaiGujarati',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }
                                      }

                                      safeSetState(() {});
                                    },
                              text: '',
                              icon: Icon(
                                Icons.navigate_next_rounded,
                                color: FFAppState().currentNewsPage ==
                                        FFAppState().totalNewsPage
                                    ? Color(0xFF808080)
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                size: 16.0,
                              ),
                              options: FFButtonOptions(
                                width: 40.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconAlignment: IconAlignment.start,
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'BalooBhaiGujarati',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFF2F2F2),
                                disabledTextColor: Color(0xFF808080),
                                hoverColor:
                                    FlutterFlowTheme.of(context).primary,
                                hoverTextColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
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
