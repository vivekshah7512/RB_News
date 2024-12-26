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
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_properties_list_page_model.dart';
export 'all_properties_list_page_model.dart';

class AllPropertiesListPageWidget extends StatefulWidget {
  const AllPropertiesListPageWidget({
    super.key,
    String? propertyType,
    String? propertyTitle,
  })  : this.propertyType = propertyType ?? 'all',
        this.propertyTitle = propertyTitle ?? 'તમામ મિલકત';

  final String propertyType;
  final String propertyTitle;

  @override
  State<AllPropertiesListPageWidget> createState() =>
      _AllPropertiesListPageWidgetState();
}

class _AllPropertiesListPageWidgetState
    extends State<AllPropertiesListPageWidget> with RouteAware {
  late AllPropertiesListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllPropertiesListPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().currentNewsPage = 1;
      safeSetState(() {});
      _model.apiResult4pq = await RBNewsAPIGroup.propertyListCall.call(
        authToken: FFAppState().authTokenAPI,
        pageNumber: FFAppState().currentNewsPage,
        pageSize: FFAppState().pageSize.toString(),
        searchText: _model.textController.text,
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlutterFlowIconButton(
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
                  context.safePop();
                },
              ),
              Text(
                widget!.propertyTitle,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF1A1A1A),
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
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
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
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
                                    12.0, 0.0, 5.0, 0.0),
                                child: Icon(
                                  Icons.search,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onFieldSubmitted: (_) async {
                                    FFAppState().currentNewsPage = 1;
                                    safeSetState(() {});
                                    _model.apiResult4pqs = await RBNewsAPIGroup
                                        .propertyListCall
                                        .call(
                                      authToken: FFAppState().authTokenAPI,
                                      pageNumber: FFAppState().currentNewsPage,
                                      pageSize:
                                          FFAppState().pageSize.toString(),
                                      searchText: _model.textController.text,
                                    );

                                    if ((_model.apiResult4pqs?.succeeded ??
                                        true)) {
                                      FFAppState().totalNewsPage =
                                          functions.getDivideVars(
                                              getJsonField(
                                                (_model.apiResult4pqs
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
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
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
                        future: RBNewsAPIGroup.propertyListCall.call(
                          authToken: FFAppState().authTokenAPI,
                          pageNumber: FFAppState().currentNewsPage,
                          pageSize: FFAppState().pageSize.toString(),
                          searchText: _model.textController.text,
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
                          final listViewPropertyListResponse = snapshot.data!;
                          _model.debugBackendQueries[
                                  'RBNewsAPIGroup.propertyListCall_statusCode_ListView_h37i9eyg'] =
                              debugSerializeParam(
                            listViewPropertyListResponse.statusCode,
                            ParamType.int,
                            link:
                                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=AllPropertiesListPage',
                            name: 'int',
                            nullable: false,
                          );
                          _model.debugBackendQueries[
                                  'RBNewsAPIGroup.propertyListCall_responseBody_ListView_h37i9eyg'] =
                              debugSerializeParam(
                            listViewPropertyListResponse.bodyText,
                            ParamType.String,
                            link:
                                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=AllPropertiesListPage',
                            name: 'String',
                            nullable: false,
                          );
                          debugLogWidgetClass(_model);

                          return Builder(
                            builder: (context) {
                              final allPropertyList =
                                  RBNewsAPIGroup.propertyListCall
                                      .propertylistArray(
                                        listViewPropertyListResponse.jsonBody,
                                      )
                                      .toList();
                              _model.debugGeneratorVariables[
                                      'allPropertyList${allPropertyList.length > 100 ? ' (first 100)' : ''}'] =
                                  debugSerializeParam(
                                allPropertyList.take(100),
                                ParamType.JSON,
                                link:
                                    'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=AllPropertiesListPage',
                                name: 'dynamic',
                                nullable: false,
                              );
                              debugLogWidgetClass(_model);

                              return ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: allPropertyList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 12.0),
                                itemBuilder: (context, allPropertyListIndex) {
                                  final allPropertyListItem =
                                      allPropertyList[allPropertyListIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'PropertyDetailNew',
                                        queryParameters: {
                                          'propertyId': serializeParam(
                                            getJsonField(
                                              allPropertyListItem,
                                              r'''$.propertyId''',
                                            ),
                                            ParamType.int,
                                          ),
                                          'propertyAllImages': serializeParam(
                                            getJsonField(
                                              allPropertyListItem,
                                              r'''$.propertyImagesURL''',
                                              true,
                                            ),
                                            ParamType.String,
                                            isList: true,
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
                                          padding: EdgeInsets.all(6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                child: Image.network(
                                                  functions.getImagePath(
                                                      getJsonField(
                                                    allPropertyListItem,
                                                    r'''$.propertyImagesURL[0]''',
                                                  ).toString()),
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
                                                                                'Readex Pro',
                                                                            color:
                                                                                Color(0xFF5374FF),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
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
                                                                          5.0,
                                                                          3.0,
                                                                          10.0,
                                                                          3.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          allPropertyListItem,
                                                                          r'''$.propertyType''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
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
                                                                width: 32.0,
                                                                height: 32.0,
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
                                                        allPropertyListItem,
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
                                                                'Readex Pro',
                                                            color: Color(
                                                                0xFF4D4D4D),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                            allPropertyListItem,
                                                            r'''$.propertyDescription''',
                                                          ).toString(),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
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
                                                            allPropertyListItem,
                                                            r'''$.propertyLocation''',
                                                          ).toString(),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Color(
                                                                    0xFF808080),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
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
                                                                    'Readex Pro',
                                                                color: Color(
                                                                    0xFF1A1A1A),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
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
                                                                  allPropertyListItem,
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
                                                                      'Readex Pro',
                                                                  color: Color(
                                                                      0xFF1A1A1A),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
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
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 0.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
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
                                                .propertyListCall
                                                .call(
                                          authToken: FFAppState().authTokenAPI,
                                          pageNumber:
                                              FFAppState().currentNewsPage,
                                          pageSize:
                                              FFAppState().pageSize.toString(),
                                          searchText:
                                              _model.textController.text,
                                        );

                                        if ((_model
                                                .apiResultz0zCopy?.succeeded ??
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
                                          if (FFAppState().currentNewsPage !=
                                              1) {
                                            FFAppState().currentNewsPage =
                                                FFAppState().currentNewsPage +
                                                    -1;
                                            safeSetState(() {});
                                            _model.apiResultg10Copy =
                                                await RBNewsAPIGroup
                                                    .propertyListCall
                                                    .call(
                                              authToken:
                                                  FFAppState().authTokenAPI,
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
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
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
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
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
                                        _model.apiResultz0z =
                                            await RBNewsAPIGroup
                                                .propertyListCall
                                                .call(
                                          authToken: FFAppState().authTokenAPI,
                                          pageNumber:
                                              FFAppState().currentNewsPage,
                                          pageSize:
                                              FFAppState().pageSize.toString(),
                                          searchText:
                                              _model.textController.text,
                                        );

                                        if ((_model.apiResultz0z?.succeeded ??
                                            true)) {
                                          FFAppState().totalNewsDataSize =
                                              getJsonField(
                                            (_model.apiResultz0z?.jsonBody ??
                                                ''),
                                            r'''$.totalCount''',
                                          );
                                          safeSetState(() {});
                                          FFAppState().totalNewsPage =
                                              functions.getDivideVars(
                                                  FFAppState()
                                                      .totalNewsDataSize,
                                                  FFAppState().pageSize);
                                          safeSetState(() {});
                                          if (FFAppState().currentNewsPage !=
                                              FFAppState().totalNewsPage) {
                                            FFAppState().currentNewsPage =
                                                FFAppState().currentNewsPage +
                                                    1;
                                            safeSetState(() {});
                                            _model.apiResultg10 =
                                                await RBNewsAPIGroup
                                                    .propertyListCall
                                                    .call(
                                              authToken:
                                                  FFAppState().authTokenAPI,
                                            );

                                            if ((_model
                                                    .apiResultg10?.succeeded ??
                                                true)) {
                                              FFAppState().totalNewsDataSize =
                                                  getJsonField(
                                                (_model.apiResultg10
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.totalCount''',
                                              );
                                              safeSetState(() {});
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'No more data found',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 2500),
                                                backgroundColor:
                                                    Color(0xFF748187),
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
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
