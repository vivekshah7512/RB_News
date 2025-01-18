import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/custom_components/news_filter_popup/news_filter_popup_widget.dart';
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
import 'news_list_page_model.dart';
export 'news_list_page_model.dart';

class NewsListPageWidget extends StatefulWidget {
  const NewsListPageWidget({
    super.key,
    String? newsType,
    String? newsTitle,
    String? searchKeyword,
    int? searchForNews,
  })  : this.newsType = newsType ?? 'all',
        this.newsTitle = newsTitle ?? 'બધા સમાચાર',
        this.searchKeyword = searchKeyword ?? '   ',
        this.searchForNews = searchForNews ?? 0;

  final String newsType;
  final String newsTitle;
  final String searchKeyword;
  final int searchForNews;

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
      FFAppState().update(() {});
      _model.apiResultudj = await RBNewsAPIGroup.newsListCall.call(
        authToken: FFAppState().authTokenAPI,
        userId: FFAppState().userIdAPI.toString(),
        searchText: widget!.searchKeyword,
        pageNumber: FFAppState().currentNewsPage,
        newsType: widget!.newsType,
        pageSize: FFAppState().pageSize,
        filterCategoriesIdListString: FFAppState().selectedFilterIds,
      );

      if (widget!.searchForNews == 1) {
        safeSetState(() {
          _model.textFieldSearchTextController?.text = '';
          _model.textFieldSearchFocusNode?.requestFocus();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _model.textFieldSearchTextController?.selection =
                const TextSelection.collapsed(offset: 0);
          });
        });
      }
      if ((_model.apiResultudj?.succeeded ?? true)) {
        FFAppState().totalNewsPage = functions.getDivideVars(
            getJsonField(
              (_model.apiResultudj?.jsonBody ?? ''),
              r'''$.totalCount''',
            ),
            FFAppState().pageSize);
        safeSetState(() {});
      }
      _model.isListEmpty = getJsonField(
        (_model.apiResultudj?.jsonBody ?? ''),
        r'''$.isSuccessfull''',
      );
      safeSetState(() {});
      if (_model.isListEmpty == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'No data found',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                fontSize: 14.0,
              ),
            ),
            duration: Duration(milliseconds: 2500),
            backgroundColor: Color(0xFF748187),
          ),
        );
      }
    });

    _model.textFieldSearchTextController ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.textFieldSearchFocusNode ??= FocusNode();
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
          title: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      FFAppState().selectedNewsCategoryTop = [];
                      FFAppState().selectedFilterIds = '  ';
                      safeSetState(() {});
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
                    widget!.newsTitle,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                height: MediaQuery.sizeOf(context).height * 0.8,
                                child: NewsFilterPopupWidget(
                                  newsType: widget!.newsType,
                                  searchKeyword:
                                      _model.textFieldSearchTextController.text,
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.asset(
                        'assets/images/filter.svg',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          toolbarHeight: 60.0,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
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
                                  controller:
                                      _model.textFieldSearchTextController,
                                  focusNode: _model.textFieldSearchFocusNode,
                                  onFieldSubmitted: (_) async {
                                    FFAppState().currentNewsPage = 1;
                                    safeSetState(() {});
                                    _model.apiResultudjS =
                                        await RBNewsAPIGroup.newsListCall.call(
                                      authToken: FFAppState().authTokenAPI,
                                      userId: FFAppState().userIdAPI.toString(),
                                      searchText: _model
                                          .textFieldSearchTextController.text,
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
                                  validator: _model
                                      .textFieldSearchTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ].divide(SizedBox(width: 0.0)),
                          ),
                        ),
                      ),
                    ),
                    if (FFAppState().selectedNewsCategoryTop.length != 0)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _model.rowController,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 2.0, 16.0),
                              child: Container(
                                height: 30.0,
                                decoration: BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final filterCategoryArray = FFAppState()
                                        .selectedNewsCategoryTop
                                        .toList();
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
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            border: Border.all(
                                              color: Color(0xFF5374FF),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  filterCategoryArrayItem.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'BalooBhaiGujarati',
                                                        color:
                                                            Color(0xFF5374FF),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.testresult =
                                                        await actions
                                                            .manageNewsCategoryFilter(
                                                      filterCategoryArrayItem
                                                          .name,
                                                      filterCategoryArrayItem
                                                          .id,
                                                      false,
                                                    );
                                                    _model.apiResultOnCancelFilter =
                                                        await RBNewsAPIGroup
                                                            .newsListCall
                                                            .call(
                                                      authToken: FFAppState()
                                                          .authTokenAPI,
                                                      userId: FFAppState()
                                                          .userIdAPI
                                                          .toString(),
                                                      searchText:
                                                          widget!.searchKeyword,
                                                      pageNumber: FFAppState()
                                                          .currentNewsPage,
                                                      newsType:
                                                          widget!.newsType,
                                                      pageSize:
                                                          FFAppState().pageSize,
                                                      filterCategoriesIdListString:
                                                          FFAppState()
                                                              .selectedFilterIds,
                                                    );

                                                    if ((_model
                                                            .apiResultOnCancelFilter
                                                            ?.succeeded ??
                                                        true)) {
                                                      FFAppState()
                                                              .totalNewsPage =
                                                          functions
                                                              .getDivideVars(
                                                                  getJsonField(
                                                                    (_model.apiResultOnCancelFilter
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.totalCount''',
                                                                  ),
                                                                  FFAppState()
                                                                      .pageSize);
                                                      safeSetState(() {});
                                                    }

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
                                      controller: _model.listViewController,
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                              child: VerticalDivider(
                                thickness: 1.5,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 16.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().selectedFilterIds = '  ';
                                  FFAppState().selectedNewsCategoryTop = [];
                                  safeSetState(() {});
                                  _model.apiResultOnCancelAll =
                                      await RBNewsAPIGroup.newsListCall.call(
                                    authToken: FFAppState().authTokenAPI,
                                    userId: FFAppState().userIdAPI.toString(),
                                    searchText: widget!.searchKeyword,
                                    pageNumber: FFAppState().currentNewsPage,
                                    newsType: widget!.newsType,
                                    pageSize: FFAppState().pageSize,
                                    filterCategoriesIdListString:
                                        FFAppState().selectedFilterIds,
                                  );

                                  if ((_model.apiResultOnCancelAll?.succeeded ??
                                      true)) {
                                    FFAppState().totalNewsPage =
                                        functions.getDivideVars(
                                            getJsonField(
                                              (_model.apiResultOnCancelAll
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.totalCount''',
                                            ),
                                            FFAppState().pageSize);
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                },
                                child: Text(
                                  'બધા દૂર કરો',
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
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: RBNewsAPIGroup.newsListCall.call(
                          authToken: FFAppState().authTokenAPI,
                          userId: FFAppState().userIdAPI.toString(),
                          searchText: _model.textFieldSearchTextController.text,
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
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 300.0, 0.0, 0.0),
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
                          final listViewNewsNewsListResponse = snapshot.data!;
                          _model.debugBackendQueries[
                                  'RBNewsAPIGroup.newsListCall_statusCode_ListView_7a4vkb11'] =
                              debugSerializeParam(
                            listViewNewsNewsListResponse.statusCode,
                            ParamType.int,
                            link:
                                'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsListPage',
                            name: 'int',
                            nullable: false,
                          );
                          _model.debugBackendQueries[
                                  'RBNewsAPIGroup.newsListCall_responseBody_ListView_7a4vkb11'] =
                              debugSerializeParam(
                            listViewNewsNewsListResponse.bodyText,
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
                                        listViewNewsNewsListResponse.jsonBody,
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
                                      _model.selectedRowIndex =
                                          newsListArrayIndex;
                                      safeSetState(() {});

                                      context.pushNamed(
                                        'NewsDetailCarouselPage',
                                        queryParameters: {
                                          'newsListPageArray': serializeParam(
                                            getJsonField(
                                              listViewNewsNewsListResponse
                                                  .jsonBody,
                                              r'''$.data''',
                                              true,
                                            ),
                                            ParamType.JSON,
                                            isList: true,
                                          ),
                                          'isFromList': serializeParam(
                                            true,
                                            ParamType.bool,
                                          ),
                                          'currentNewsPageInitalIDX':
                                              serializeParam(
                                            newsListArrayIndex,
                                            ParamType.int,
                                          ),
                                          'searchText': serializeParam(
                                            _model.textFieldSearchTextController
                                                .text,
                                            ParamType.String,
                                          ),
                                          'newsType': serializeParam(
                                            widget!.newsType,
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
                                                                            'BalooBhaiGujarati',
                                                                        color: Color(
                                                                            0xFF5374FF),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
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
                                                                              'BalooBhaiGujarati',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              false,
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
                                controller: _model.listViewNews,
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
            if (_model.isListEmpty == true)
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
                                          searchText: _model
                                              .textFieldSearchTextController
                                              .text,
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
                                              searchText: _model
                                                  .textFieldSearchTextController
                                                  .text,
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
                                  color: Color(0xFF5374FF),
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
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                                        _model.apiResultz0z =
                                            await RBNewsAPIGroup.newsListCall
                                                .call(
                                          authToken: FFAppState().authTokenAPI,
                                          userId:
                                              FFAppState().userIdAPI.toString(),
                                          pageNumber:
                                              FFAppState().currentNewsPage,
                                          newsType: widget!.newsType,
                                          searchText: _model
                                              .textFieldSearchTextController
                                              .text,
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
                                              searchText: _model
                                                  .textFieldSearchTextController
                                                  .text,
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'BalooBhaiGujarati',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
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
