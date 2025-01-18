import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comments_list_page_model.dart';
export 'comments_list_page_model.dart';

class CommentsListPageWidget extends StatefulWidget {
  const CommentsListPageWidget({
    super.key,
    String? newsId,
  }) : this.newsId = newsId ?? '0';

  final String newsId;

  @override
  State<CommentsListPageWidget> createState() => _CommentsListPageWidgetState();
}

class _CommentsListPageWidgetState extends State<CommentsListPageWidget>
    with RouteAware {
  late CommentsListPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentsListPageModel());

    _model.textController ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.textFieldFocusNode ??= FocusNode();
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

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 0.8,
          constraints: BoxConstraints(
            minHeight: MediaQuery.sizeOf(context).height * 0.5,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ટિપ્પણીઓ',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'BalooBhaiGujarati',
                          color: Color(0xFF1A1A1A),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(15.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(15.0),
                            ),
                            border: Border.all(
                              color: Color(0xFFE6E6E6),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: false,
                                      readOnly:
                                          FFAppState().isUserLoggedIn == false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'તમારી ટિપ્પણી અહીં લખો...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'BalooBhaiGujarati',
                                              color: Color(0xFF999999),
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
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                      textAlign: TextAlign.start,
                                      maxLength: 500,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.none,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.textController.text != null &&
                                      _model.textController.text != '') {
                                    _model.apiResulttzlCopy =
                                        await RBNewsAPIGroup.postNewsCommentCall
                                            .call(
                                      userId: FFAppState().userIdAPI.toString(),
                                      comment: _model.textController.text,
                                      newsId: widget!.newsId,
                                      authToken: FFAppState().authTokenAPI,
                                    );

                                    if ((_model.apiResulttzlCopy?.succeeded ??
                                        true)) {
                                      safeSetState(() {});
                                      safeSetState(() {
                                        _model.textController?.clear();
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.apiResulttzlCopy
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString(),
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2500),
                                          backgroundColor: Color(0xFF748187),
                                        ),
                                      );
                                    }
                                  }

                                  safeSetState(() {});
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/comment_send.svg',
                                    width: 55.0,
                                    height: 55.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder<ApiCallResponse>(
                    future: RBNewsAPIGroup.newsCommentCall.call(
                      newsId: widget!.newsId,
                      authToken: FFAppState().authTokenAPI,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      final listViewNewsCommentResponse = snapshot.data!;
                      _model.debugBackendQueries[
                              'RBNewsAPIGroup.newsCommentCall_statusCode_ListView_hn7ekwt9'] =
                          debugSerializeParam(
                        listViewNewsCommentResponse.statusCode,
                        ParamType.int,
                        link:
                            'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=CommentsListPage',
                        name: 'int',
                        nullable: false,
                      );
                      _model.debugBackendQueries[
                              'RBNewsAPIGroup.newsCommentCall_responseBody_ListView_hn7ekwt9'] =
                          debugSerializeParam(
                        listViewNewsCommentResponse.bodyText,
                        ParamType.String,
                        link:
                            'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=CommentsListPage',
                        name: 'String',
                        nullable: false,
                      );
                      debugLogWidgetClass(_model);

                      return Builder(
                        builder: (context) {
                          final eachComment = RBNewsAPIGroup.newsCommentCall
                                  .newsCommentArray(
                                    listViewNewsCommentResponse.jsonBody,
                                  )
                                  ?.toList() ??
                              [];
                          _model.debugGeneratorVariables[
                                  'eachComment${eachComment.length > 100 ? ' (first 100)' : ''}'] =
                              debugSerializeParam(
                            eachComment.take(100),
                            ParamType.JSON,
                            isList: true,
                            link:
                                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=CommentsListPage',
                            name: 'dynamic',
                            nullable: false,
                          );
                          debugLogWidgetClass(_model);

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: eachComment.length,
                            separatorBuilder: (_, __) => SizedBox(height: 12.0),
                            itemBuilder: (context, eachCommentIndex) {
                              final eachCommentItem =
                                  eachComment[eachCommentIndex];
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if ((valueOrDefault<String>(
                                              functions.getSingleString(
                                                  functions.formateAPIDate(
                                                      getJsonField(
                                                    eachCommentItem,
                                                    r'''$.modifiedDate''',
                                                  ).toString()),
                                                  0),
                                              'Today',
                                            ) !=
                                            valueOrDefault<String>(
                                              functions.getSingleString(
                                                  functions.formateAPIDate(
                                                      functions.dateHeaderString(
                                                          getJsonField(
                                                            listViewNewsCommentResponse
                                                                .jsonBody,
                                                            r'''$.data''',
                                                            true,
                                                          )!,
                                                          eachCommentIndex)),
                                                  0),
                                              'Blank',
                                            )) ||
                                        (eachCommentIndex == 0))
                                      Text(
                                        valueOrDefault<String>(
                                          functions.getSingleString(
                                              functions
                                                  .formateAPIDate(getJsonField(
                                                eachCommentItem,
                                                r'''$.modifiedDate''',
                                              ).toString()),
                                              0),
                                          'Today',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'BalooBhaiGujarati',
                                              color: Color(0xFF8D8D8D),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: functions.getColor(
                                                  FFAppState()
                                                      .commentColors
                                                      .toList(),
                                                  eachCommentIndex),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                functions
                                                    .getFirstChar(getJsonField(
                                                  eachCommentItem,
                                                  r'''$.userName''',
                                                ).toString()),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'BalooBhaiGujarati',
                                                          color:
                                                              Color(0xFF8D8D8D),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
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
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        eachCommentItem,
                                                        r'''$.userName''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'BalooBhaiGujarati',
                                                            color: Color(
                                                                0xFF808080),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .getSingleString(
                                                                      functions
                                                                          .formateAPIDate(
                                                                              getJsonField(
                                                                        eachCommentItem,
                                                                        r'''$.modifiedDate''',
                                                                      ).toString()),
                                                                      1),
                                                              'Today',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'BalooBhaiGujarati',
                                                                  color: Color(
                                                                      0xFF808080),
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
                                                        if (functions
                                                                .areNumbersEqual(
                                                                    getJsonField(
                                                                      eachCommentItem,
                                                                      r'''$.userId''',
                                                                    )
                                                                        .toString(),
                                                                    FFAppState()
                                                                        .userIdAPI) ??
                                                            true)
                                                          SizedBox(
                                                            height: 16.0,
                                                            child:
                                                                VerticalDivider(
                                                              thickness: 1.5,
                                                              color: Color(
                                                                  0xFFCCCCCC),
                                                            ),
                                                          ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.apiResulty9j =
                                                                await RBNewsAPIGroup
                                                                    .deleteNewsCommentCall
                                                                    .call(
                                                              authToken:
                                                                  FFAppState()
                                                                      .authTokenAPI,
                                                              commentId:
                                                                  getJsonField(
                                                                eachCommentItem,
                                                                r'''$.commentId''',
                                                              ).toString(),
                                                              deletedBy:
                                                                  FFAppState()
                                                                      .userName,
                                                              newsId: widget!
                                                                  .newsId,
                                                            );

                                                            if ((_model
                                                                    .apiResulty9j
                                                                    ?.succeeded ??
                                                                true)) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    getJsonField(
                                                                      (_model.apiResulty9j
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.message''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xFF748187),
                                                                ),
                                                              );
                                                              _model.apiResult7quCopy =
                                                                  await RBNewsAPIGroup
                                                                      .newsCommentCall
                                                                      .call(
                                                                newsId: widget!
                                                                    .newsId,
                                                                authToken:
                                                                    FFAppState()
                                                                        .authTokenAPI,
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/comment_delete.svg',
                                                            width: 30.0,
                                                            height: 30.0,
                                                            fit: BoxFit.none,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  child: custom_widgets
                                                      .ReadMoreWidgetForComment(
                                                    width: double.infinity,
                                                    textContent: getJsonField(
                                                      eachCommentItem,
                                                      r'''$.commentText''',
                                                    ).toString(),
                                                    trimCollapsedText:
                                                        'વધુ વાંચો',
                                                    trimExpandedText:
                                                        'ઓછું વાંચો',
                                                    colorClickableText:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    isHtml: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 1.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
