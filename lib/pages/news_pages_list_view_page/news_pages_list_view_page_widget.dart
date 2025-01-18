import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/custom_components/advertisement_popup/advertisement_popup_widget.dart';
import '/pages/custom_components/comments_list_page/comments_list_page_widget.dart';
import '/pages/custom_components/login_popup/login_popup_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'news_pages_list_view_page_model.dart';
export 'news_pages_list_view_page_model.dart';

class NewsPagesListViewPageWidget extends StatefulWidget {
  const NewsPagesListViewPageWidget({
    super.key,
    this.newsListPageArray,
    int? currentNewsPageInitalIDX,
    bool? isFromList,
  })  : this.currentNewsPageInitalIDX = currentNewsPageInitalIDX ?? 0,
        this.isFromList = isFromList ?? false;

  final List<dynamic>? newsListPageArray;
  final int currentNewsPageInitalIDX;
  final bool isFromList;

  @override
  State<NewsPagesListViewPageWidget> createState() =>
      _NewsPagesListViewPageWidgetState();
}

class _NewsPagesListViewPageWidgetState
    extends State<NewsPagesListViewPageWidget>
    with TickerProviderStateMixin, RouteAware {
  late NewsPagesListViewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsPagesListViewPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().authTokenAPI == '') {
        await actions.getDeviceInfo();
        await actions.getCurrentLatLng();
        _model.apiResultrfs = await RBNewsAPIGroup.guestUserCall.call(
          deviceId: FFAppState().deviceId,
          deviceType: FFAppState().deviceType,
          deviceInfo: FFAppState().deviceInfo,
          latitude: FFAppState().latitude,
          longitude: FFAppState().longitude,
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
      if (widget!.isFromList) {
        _model.newsListPageStateArray =
            widget!.newsListPageArray!.toList().cast<dynamic>();
        safeSetState(() {});
      } else {
        FFAppState().currentNewsPage = 1;
        FFAppState().totalNewsPage = 1;
        FFAppState().totalNewsDataSize = 0;
        safeSetState(() {});
        _model.apiResultNews = await RBNewsAPIGroup.newsListCall.call(
          authToken: FFAppState().authTokenAPI,
          userId: FFAppState().userIdAPI.toString(),
          searchText: '  ',
          pageNumber: FFAppState().currentNewsPage,
          newsType: 'all',
          pageSize: FFAppState().pageSize,
          filterCategoriesIdListString: FFAppState().selectedFilterIds,
        );

        if ((_model.apiResultNews?.succeeded ?? true)) {
          _model.newsListPageStateArray = getJsonField(
            (_model.apiResultNews?.jsonBody ?? ''),
            r'''$.data''',
            true,
          )!
              .toList()
              .cast<dynamic>();
          safeSetState(() {});
        }
      }

      if (FFAppState().isAppOpened != true) {
        FFAppState().isAppOpened = true;
        safeSetState(() {});
        _model.apiResultjr3 = await RBNewsAPIGroup.advertisementCall.call(
          dateInput: functions.getTodayDate(),
          authToken: FFAppState().authTokenAPI,
        );

        if ((_model.apiResultjr3?.succeeded ?? true)) {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: AdvertisementPopupWidget(
                    advertisementImageUrl: getJsonField(
                      (_model.apiResultjr3?.jsonBody ?? ''),
                      r'''$.data[0].imageUrl''',
                    ).toString(),
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        }
      }
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 710.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(-8.0, 0.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 710.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(8.0, 0.0),
          ),
        ],
      ),
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Builder(
                builder: (context) {
                  final newsPageLocalArray =
                      (!(widget!.newsListPageArray != null &&
                                      (widget!.newsListPageArray)!.isNotEmpty)
                                  ? _model.newsListPageStateArray
                                  : widget!.newsListPageArray)
                              ?.toList() ??
                          [];
                  _model.debugGeneratorVariables[
                          'newsPageLocalArray${newsPageLocalArray.length > 100 ? ' (first 100)' : ''}'] =
                      debugSerializeParam(
                    newsPageLocalArray.take(100),
                    ParamType.JSON,
                    isList: true,
                    link:
                        'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsPagesListViewPage',
                    name: 'dynamic',
                    nullable: false,
                  );
                  debugLogWidgetClass(_model);

                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: PageView.builder(
                      controller: _model.pageViewController ??= PageController(
                          initialPage: max(
                              0,
                              min(
                                  valueOrDefault<int>(
                                    widget!.currentNewsPageInitalIDX,
                                    0,
                                  ),
                                  newsPageLocalArray.length - 1)))
                        ..addListener(() {
                          debugLogWidgetClass(_model);
                        }),
                      onPageChanged: (_) async {
                        _model.isNewsLiked = newsPageLocalArray
                            .elementAtOrNull(_model.pageViewCurrentIndex)!;
                        _model.isNewsSaved = newsPageLocalArray
                            .elementAtOrNull(_model.pageViewCurrentIndex)!;
                        _model.currentNewsId = getJsonField(
                          newsPageLocalArray
                              .elementAtOrNull(_model.pageViewCurrentIndex),
                          r'''$.newsId''',
                        );
                        _model.commentDotFlag = getJsonField(
                          newsPageLocalArray
                              .elementAtOrNull(_model.pageViewCurrentIndex),
                          r'''$.commentsCount''',
                        );
                        safeSetState(() {});
                        FFAppState().isNewsPageSwiped = true;
                        safeSetState(() {});
                        await Future.wait([
                          Future(() async {
                            if (_model.isNewsLiked) {
                              _model.imageAssets =
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/sadgfr0vguzr/like.svg';
                              safeSetState(() {});
                            } else {
                              _model.imageAssets =
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/hjcfxhkwoq98/dislike.svg';
                              safeSetState(() {});
                            }
                          }),
                          Future(() async {
                            if (_model.isNewsSaved) {
                              _model.imageAssetsForSave =
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/gsdlfidnxyxx/saved.svg';
                              safeSetState(() {});
                            } else {
                              _model.imageAssetsForSave =
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/e379fd6k6hgx/save.svg';
                              safeSetState(() {});
                            }
                          }),
                        ]);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: newsPageLocalArray.length,
                      itemBuilder: (context, newsPageLocalArrayIndex) {
                        final newsPageLocalArrayItem =
                            newsPageLocalArray[newsPageLocalArrayIndex];
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.62,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        getJsonField(
                                          newsPageLocalArrayItem,
                                          r'''$.newsImage''',
                                        ).toString(),
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.623,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.623,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    if ((newsPageLocalArrayIndex ==
                                            widget!.currentNewsPageInitalIDX) ||
                                        (FFAppState().isNewsPageSwiped ==
                                            false))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.08),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 18.0),
                                          child: Container(
                                            height: 99.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.transparent,
                                                  Color(0x7A000000),
                                                  Color(0x7A000000)
                                                ],
                                                stops: [0.0, 1.0, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 30.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/leftSwipeNews.svg',
                                                        width: 32.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'imageOnPageLoadAnimation1']!),
                                                    Text(
                                                      'વધુ સમાચાર જોવા માટે ડાબે અને જમણે સ્વાઇપ કરો',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'BalooBhaiGujarati',
                                                            color: Colors.white,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/rightSwipeNews.svg',
                                                        width: 32.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'imageOnPageLoadAnimation2']!),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, 1.01),
                                      child: Container(
                                        width: double.infinity,
                                        height: 18.0,
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
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(0.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    width: 1.0,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF1F3FE),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          7.0, 3.0, 0.0, 3.0),
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
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(7.0, 3.0,
                                                                10.0, 3.0),
                                                    child: Text(
                                                      getJsonField(
                                                        newsPageLocalArrayItem,
                                                        r'''$.newsCategoryName''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'BalooBhaiGujarati',
                                                            color: Color(
                                                                0xFF5374FF),
                                                            letterSpacing: 0.0,
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 12.0, 0.0),
                                      child: Text(
                                        getJsonField(
                                          newsPageLocalArrayItem,
                                          r'''$.newsTitle''',
                                        ).toString(),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'BalooBhaiGujarati',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 12.0, 0.0),
                                      child: custom_widgets.ReadMoreWidget(
                                        width: double.infinity,
                                        textContent: getJsonField(
                                          newsPageLocalArrayItem,
                                          r'''$.newsDescription''',
                                        ).toString(),
                                        colorClickableText:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 72.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: 'વધુ જુઓ ',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsets.all(0.0),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'BalooBhaiGujarati',
                                                                color: Color(
                                                                    0xFF5374FF),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/right_blue_arrow.png',
                                                    width: 16.0,
                                                    height: 18.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 48.0,
                                              height: 48.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (FFAppState()
                                                        .isUserLoggedIn) {
                                                      _model.apiResultLike =
                                                          await RBNewsAPIGroup
                                                              .likeUnLikeNewsCall
                                                              .call(
                                                        newsId: getJsonField(
                                                          newsPageLocalArrayItem,
                                                          r'''$.newsId''',
                                                        ).toString(),
                                                        userId: FFAppState()
                                                            .userIdAPI
                                                            .toString(),
                                                        authToken: FFAppState()
                                                            .authTokenAPI,
                                                      );

                                                      if ((_model.apiResultLike
                                                              ?.succeeded ??
                                                          true)) {
                                                        if (_model
                                                                .isNewsLiked ==
                                                            true) {
                                                          _model.isNewsLiked =
                                                              false;
                                                          _model.imageAssets =
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/hjcfxhkwoq98/dislike.svg';
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.isNewsLiked =
                                                              true;
                                                          _model.imageAssets =
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/sadgfr0vguzr/like.svg';
                                                          safeSetState(() {});
                                                        }
                                                      }
                                                    } else {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  LoginPopupWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.network(
                                                      _model.imageAssets,
                                                      width: 24.0,
                                                      height: 24.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 48.0,
                                              height: 48.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    CommentsListPageWidget(
                                                                  newsId:
                                                                      getJsonField(
                                                                    newsPageLocalArrayItem,
                                                                    r'''$.newsId''',
                                                                  ).toString(),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/messages.svg',
                                                          width: 24.0,
                                                          height: 24.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (_model.commentDotFlag !=
                                                      0)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 10.0,
                                                          height: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFD35050),
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Share.share(
                                                    functions
                                                        .combineWithNewLine(
                                                            getJsonField(
                                                              newsPageLocalArrayItem,
                                                              r'''$.newsTitle''',
                                                            ).toString(),
                                                            getJsonField(
                                                              newsPageLocalArrayItem,
                                                              r'''$.shareLink''',
                                                            ).toString()),
                                                    sharePositionOrigin:
                                                        getWidgetBoundingBox(
                                                            context),
                                                  );
                                                },
                                                child: Container(
                                                  width: 48.0,
                                                  height: 48.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/share_arrow.svg',
                                                        width: 24.0,
                                                        height: 24.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 48.0,
                                              height: 48.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (FFAppState()
                                                        .isUserLoggedIn) {
                                                      _model.apiResultSaved =
                                                          await RBNewsAPIGroup
                                                              .saveUnsaveNewsCall
                                                              .call(
                                                        newsId: getJsonField(
                                                          newsPageLocalArrayItem,
                                                          r'''$.newsId''',
                                                        ).toString(),
                                                        userId: FFAppState()
                                                            .userIdAPI
                                                            .toString(),
                                                        authToken: FFAppState()
                                                            .authTokenAPI,
                                                      );

                                                      if ((_model.apiResultSaved
                                                              ?.succeeded ??
                                                          true)) {
                                                        if (_model
                                                                .isNewsSaved ==
                                                            true) {
                                                          _model.isNewsSaved =
                                                              false;
                                                          _model.imageAssetsForSave =
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/e379fd6k6hgx/save.svg';
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.isNewsSaved =
                                                              true;
                                                          _model.imageAssetsForSave =
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/gsdlfidnxyxx/saved.svg';
                                                          safeSetState(() {});
                                                        }
                                                      }
                                                    } else {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  LoginPopupWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.network(
                                                      _model.imageAssetsForSave,
                                                      width: 24.0,
                                                      height: 24.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ],
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
            ),
          ],
        ),
      ),
    );
  }
}
