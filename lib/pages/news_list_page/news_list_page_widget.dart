import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/news_filter_popup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'news_list_page_model.dart';
export 'news_list_page_model.dart';

class NewsListPageWidget extends StatefulWidget {
  const NewsListPageWidget({
    super.key,
    String? newsType,
    String? newsTitle,
  })  : this.newsType = newsType ?? 'all',
        this.newsTitle = newsTitle ?? 'બધા સમાચાર';

  final String newsType;
  final String newsTitle;

  @override
  State<NewsListPageWidget> createState() => _NewsListPageWidgetState();
}

class _NewsListPageWidgetState extends State<NewsListPageWidget>
    with RouteAware {
  late NewsListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsListPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().currentNewsPage = 1;
      FFAppState().totalNewsPage = 1;
      FFAppState().totalNewsDataSize = 0;
      safeSetState(() {});
      _model.apiResultudj = await RBNewsAPIGroup.newsListCall.call(
        authToken: FFAppState().authTokenAPI,
        userId: FFAppState().userIdAPI.toString(),
        searchText: _model.textController.text,
        pageNumber: FFAppState().currentNewsPage,
        newsType: widget!.newsType,
        pageSize: FFAppState().pageSize,
        filterCategoriesIdListString: FFAppState().selectedFilterIds,
      );

      if ((_model.apiResultudj?.succeeded ?? true)) {
        FFAppState().totalNewsPage = functions.getDivideVars(
            getJsonField(
              (_model.apiResultudj?.jsonBody ?? ''),
              r'''$.totalCount''',
            ),
            FFAppState().pageSize);
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
                  context.pop();
                },
              ),
              Text(
                widget!.newsTitle,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF1A1A1A),
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              FlutterFlowIconButton(
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
                onPressed: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.7,
                            child: NewsFilterPopupWidget(),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
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
                  mainAxisSize: MainAxisSize.min,
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
                                    _model.apiResultudjS =
                                        await RBNewsAPIGroup.newsListCall.call(
                                      authToken: FFAppState().authTokenAPI,
                                      userId: FFAppState().userIdAPI.toString(),
                                      searchText: _model.textController.text,
                                      pageNumber: FFAppState().currentNewsPage,
                                      newsType: widget!.newsType,
                                      pageSize: FFAppState().pageSize,
                                      filterCategoriesIdListString:
                                          FFAppState().selectedFilterIds,
                                    );

                                    if ((_model.apiResultudjS?.succeeded ??
                                        true)) {
                                      FFAppState().totalNewsPage =
                                          functions.getDivideVars(
                                              getJsonField(
                                                (_model.apiResultudjS
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
                                    hintText: 'સમાચાર શોધો',
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
                    if (FFAppState().selectedNewsCategoryTop.length != 0)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Container(
                          width: 400.0,
                          height: 30.0,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final filterCategoryArray =
                                  FFAppState().selectedNewsCategoryTop.toList();
                              _model.debugGeneratorVariables[
                                      'filterCategoryArray${filterCategoryArray.length > 100 ? ' (first 100)' : ''}'] =
                                  debugSerializeParam(
                                filterCategoryArray.take(100),
                                ParamType.DataStruct,
                                isList: true,
                                link:
                                    'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
                                name: 'SelectedNewsCategoryData',
                                nullable: false,
                              );
                              debugLogWidgetClass(_model);

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: filterCategoryArray.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(width: 15.0),
                                itemBuilder:
                                    (context, filterCategoryArrayIndex) {
                                  final filterCategoryArrayItem =
                                      filterCategoryArray[
                                          filterCategoryArrayIndex];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF1F3FE),
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: Color(0xFF5374FF),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            filterCategoryArrayItem.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF5374FF),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.testresult = await actions
                                                  .manageNewsCategoryFilter(
                                                filterCategoryArrayItem.name,
                                                filterCategoryArrayItem.id,
                                                false,
                                              );
                                              FFAppState().currentNewsPage = 1;
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Color(0xFF5374FF),
                                              size: 22.0,
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 6.0)),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: RBNewsAPIGroup.newsListCall.call(
                          authToken: FFAppState().authTokenAPI,
                          userId: FFAppState().userIdAPI.toString(),
                          searchText: _model.textController.text,
                          pageNumber: FFAppState().currentNewsPage,
                          newsType: widget!.newsType,
                          filterCategoriesIdListString:
                              FFAppState().selectedFilterIds,
                          pageSize: FFAppState().pageSize,
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
                          final listViewNewsListResponse = snapshot.data!;
                          _model.debugBackendQueries[
                                  'RBNewsAPIGroup.newsListCall_statusCode_ListView_7a4vkb11'] =
                              debugSerializeParam(
                            listViewNewsListResponse.statusCode,
                            ParamType.int,
                            link:
                                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
                            name: 'int',
                            nullable: false,
                          );
                          _model.debugBackendQueries[
                                  'RBNewsAPIGroup.newsListCall_responseBody_ListView_7a4vkb11'] =
                              debugSerializeParam(
                            listViewNewsListResponse.bodyText,
                            ParamType.String,
                            link:
                                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
                            name: 'String',
                            nullable: false,
                          );
                          debugLogWidgetClass(_model);

                          return Builder(
                            builder: (context) {
                              final newsListArray = RBNewsAPIGroup.newsListCall
                                      .newsArray(
                                        listViewNewsListResponse.jsonBody,
                                      )
                                      ?.toList() ??
                                  [];
                              _model.debugGeneratorVariables[
                                      'newsListArray${newsListArray.length > 100 ? ' (first 100)' : ''}'] =
                                  debugSerializeParam(
                                newsListArray.take(100),
                                ParamType.JSON,
                                isList: true,
                                link:
                                    'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
                                name: 'dynamic',
                                nullable: false,
                              );
                              debugLogWidgetClass(_model);

                              return ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: newsListArray.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 12.0),
                                itemBuilder: (context, newsListArrayIndex) {
                                  final newsListArrayItem =
                                      newsListArray[newsListArrayIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'NewsDetailPage',
                                        queryParameters: {
                                          'newsId': serializeParam(
                                            getJsonField(
                                              newsListArrayItem,
                                              r'''$.newsId''',
                                            ).toString(),
                                            ParamType.String,
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
                                                  getJsonField(
                                                    newsListArrayItem,
                                                    r'''$.newsImage''',
                                                  ).toString(),
                                                  width: 98.0,
                                                  height: 128.0,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.png',
                                                    width: 98.0,
                                                    height: 128.0,
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
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                        color: Color(
                                                                            0xFF5374FF),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          7.0,
                                                                          3.0,
                                                                          10.0,
                                                                          3.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      newsListArrayItem,
                                                                      r'''$.newsCategoryName''',
                                                                    ).toString(),
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
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
                                                        newsListArrayItem,
                                                        r'''$.newsTitle''',
                                                      ).toString(),
                                                      maxLines: 2,
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
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      child: custom_widgets
                                                          .HtmlViewer(
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        htmlContent:
                                                            getJsonField(
                                                          newsListArrayItem,
                                                          r'''$.newsDescription''',
                                                        ).toString(),
                                                      ),
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
                                            await RBNewsAPIGroup.newsListCall
                                                .call(
                                          authToken: FFAppState().authTokenAPI,
                                          userId:
                                              FFAppState().userIdAPI.toString(),
                                          pageNumber:
                                              FFAppState().currentNewsPage,
                                          newsType: widget!.newsType,
                                          searchText:
                                              _model.textController.text,
                                          filterCategoriesIdListString:
                                              FFAppState().selectedFilterIds,
                                          pageSize: FFAppState().pageSize,
                                        );

                                        if ((_model
                                                .apiResultg10Copy?.succeeded ??
                                            true)) {
                                          FFAppState().totalNewsDataSize =
                                              getJsonField(
                                            (_model.apiResultz0zCopy
                                                    ?.jsonBody ??
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
                                              1) {
                                            FFAppState().currentNewsPage =
                                                FFAppState().currentNewsPage +
                                                    -1;
                                            safeSetState(() {});
                                            _model.apiResultg10Copy =
                                                await RBNewsAPIGroup
                                                    .newsListCall
                                                    .call(
                                              authToken:
                                                  FFAppState().authTokenAPI,
                                              userId: FFAppState()
                                                  .userIdAPI
                                                  .toString(),
                                              pageNumber:
                                                  FFAppState().currentNewsPage,
                                              newsType: widget!.newsType,
                                              searchText:
                                                  _model.textController.text,
                                              filterCategoriesIdListString:
                                                  FFAppState()
                                                      .selectedFilterIds,
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
                                  color: Color(0xFF5374FF),
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
                                            await RBNewsAPIGroup.newsListCall
                                                .call(
                                          authToken: FFAppState().authTokenAPI,
                                          userId:
                                              FFAppState().userIdAPI.toString(),
                                          pageNumber:
                                              FFAppState().currentNewsPage,
                                          newsType: widget!.newsType,
                                          searchText:
                                              _model.textController.text,
                                          filterCategoriesIdListString:
                                              FFAppState().selectedFilterIds,
                                          pageSize: FFAppState().pageSize,
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
                                                    .newsListCall
                                                    .call(
                                              authToken:
                                                  FFAppState().authTokenAPI,
                                              userId: FFAppState()
                                                  .userIdAPI
                                                  .toString(),
                                              pageNumber:
                                                  FFAppState().currentNewsPage,
                                              newsType: widget!.newsType,
                                              searchText:
                                                  _model.textController.text,
                                              filterCategoriesIdListString:
                                                  FFAppState()
                                                      .selectedFilterIds,
                                              pageSize: FFAppState().pageSize,
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
                                                    milliseconds: 4000),
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
                                  color: Color(0xFF5374FF),
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
