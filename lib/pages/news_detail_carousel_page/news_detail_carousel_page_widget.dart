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
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'news_detail_carousel_page_model.dart';
export 'news_detail_carousel_page_model.dart';

class NewsDetailCarouselPageWidget extends StatefulWidget {
  const NewsDetailCarouselPageWidget({
    super.key,
    this.newsListPageArray,
    bool? isFromList,
    int? currentNewsPageInitalIDX,
    String? searchText,
    String? newsType,
  })  : this.isFromList = isFromList ?? false,
        this.currentNewsPageInitalIDX = currentNewsPageInitalIDX ?? 0,
        this.searchText = searchText ?? '  ',
        this.newsType = newsType ?? 'all';

  final List<dynamic>? newsListPageArray;
  final bool isFromList;
  final int currentNewsPageInitalIDX;
  final String searchText;
  final String newsType;

  @override
  State<NewsDetailCarouselPageWidget> createState() =>
      _NewsDetailCarouselPageWidgetState();
}

class _NewsDetailCarouselPageWidgetState
    extends State<NewsDetailCarouselPageWidget>
    with TickerProviderStateMixin, RouteAware {
  late NewsDetailCarouselPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsDetailCarouselPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().authTokenAPI == '') {
        await actions.getDeviceInfo();
        await actions.getCurrentLatLng();
        _model.fcmToken = await actions.getFirebaseToken();
        FFAppState().deviceToken = _model.fcmToken!;
        safeSetState(() {});
        _model.apiResultGuestUser = await RBNewsAPIGroup.guestUserCall.call(
          deviceId: FFAppState().deviceId,
          deviceType: FFAppState().deviceType,
          deviceInfo: FFAppState().deviceInfo,
          latitude: FFAppState().latitude,
          longitude: FFAppState().longitude,
          deviceToken: FFAppState().deviceToken,
        );

        if ((_model.apiResultGuestUser?.succeeded ?? true)) {
          FFAppState().authTokenAPI = getJsonField(
            (_model.apiResultGuestUser?.jsonBody ?? ''),
            r'''$.data.jwtTokenString''',
          ).toString().toString();
          FFAppState().userIdAPI = getJsonField(
            (_model.apiResultGuestUser?.jsonBody ?? ''),
            r'''$.data.userId''',
          );
          safeSetState(() {});
        }
      }
      if (widget!.isFromList) {
        _model.isNewsLiked = getJsonField(
          widget!.newsListPageArray!
              .elementAtOrNull(widget!.currentNewsPageInitalIDX),
          r'''$.isNewsLiked''',
        );
        _model.isNewsSaved = getJsonField(
          widget!.newsListPageArray!
              .elementAtOrNull(widget!.currentNewsPageInitalIDX),
          r'''$.isNewsSaved''',
        );
        _model.commentDotFlag = getJsonField(
          widget!.newsListPageArray
              ?.elementAtOrNull(widget!.currentNewsPageInitalIDX),
          r'''$.commentsCount''',
        );
        _model.newsListPageStateArray =
            widget!.newsListPageArray!.toList().cast<dynamic>();
        safeSetState(() {});
        await Future.wait([
          Future(() async {
            if (_model.isNewsLiked == true) {
              _model.isNewsLiked = false;
              _model.imageAssets =
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/hjcfxhkwoq98/dislike.svg';
              safeSetState(() {});
            } else {
              _model.isNewsLiked = true;
              _model.imageAssets =
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/sadgfr0vguzr/like.svg';
              safeSetState(() {});
            }
          }),
          Future(() async {
            if (_model.isNewsSaved == true) {
              _model.isNewsSaved = false;
              _model.imageAssetsForSave =
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/e379fd6k6hgx/save.svg';
              safeSetState(() {});
            } else {
              _model.isNewsSaved = true;
              _model.imageAssetsForSave =
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-b-news-k9jlh3/assets/gsdlfidnxyxx/saved.svg';
              safeSetState(() {});
            }
          }),
        ]);
      } else {
        FFAppState().currentNewsPage = 1;
        FFAppState().totalNewsPage = 1;
        FFAppState().totalNewsDataSize = 0;
        safeSetState(() {});
        _model.apiResultNews = await RBNewsAPIGroup.newsListCall.call(
          authToken: FFAppState().authTokenAPI,
          userId: FFAppState().userIdAPI.toString(),
          searchText: widget!.searchText,
          pageNumber: FFAppState().currentNewsPage,
          newsType: widget!.newsType,
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
        _model.apiResultAdvertise = await RBNewsAPIGroup.advertisementCall.call(
          dateInput: functions.getTodayDate(),
          authToken: FFAppState().authTokenAPI,
        );

        _model.isAdvertismentEmpty = getJsonField(
          (_model.apiResultAdvertise?.jsonBody ?? ''),
          r'''$.isSuccessfull''',
        );
        safeSetState(() {});
        if ((_model.apiResultAdvertise?.succeeded ?? true)) {
          _model.advertismentData = getJsonField(
            (_model.apiResultAdvertise?.jsonBody ?? ''),
            r'''$.data''',
          );
          safeSetState(() {});
          if (_model.isAdvertismentEmpty == true) {
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
                        (_model.apiResultAdvertise?.jsonBody ?? ''),
                        r'''$.data[0].imageUrl''',
                      ).toString(),
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          }
        }
        FFAppState().isAppOpened = true;
        safeSetState(() {});
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
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Builder(
            builder: (context) {
              final newsLocalArray = (!(widget!.newsListPageArray != null &&
                              (widget!.newsListPageArray)!.isNotEmpty)
                          ? _model.newsListPageStateArray
                          : widget!.newsListPageArray)
                      ?.toList() ??
                  [];
              _model.debugGeneratorVariables[
                      'newsLocalArray${newsLocalArray.length > 100 ? ' (first 100)' : ''}'] =
                  debugSerializeParam(
                newsLocalArray.take(100),
                ParamType.JSON,
                isList: true,
                link:
                    'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=NewsDetailCarouselPage',
                name: 'dynamic',
                nullable: false,
              );
              debugLogWidgetClass(_model);

              return Container(
                width: double.infinity,
                height: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: newsLocalArray.length,
                  itemBuilder: (context, newsLocalArrayIndex, _) {
                    final newsLocalArrayItem =
                        newsLocalArray[newsLocalArrayIndex];
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SingleChildScrollView(
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          getJsonField(
                                            newsLocalArrayItem,
                                            r'''$.newsImage''',
                                          ).toString(),
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
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
                                      if (_model.isPageSwiped == false)
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
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                              color:
                                                                  Colors.white,
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
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(7.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Text(
                                                      '•',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
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
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  7.0,
                                                                  3.0,
                                                                  10.0,
                                                                  3.0),
                                                      child: Text(
                                                        getJsonField(
                                                          newsLocalArrayItem,
                                                          r'''$.newsCategoryName''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'BalooBhaiGujarati',
                                                                  color: Color(
                                                                      0xFF5374FF),
                                                                  letterSpacing:
                                                                      0.0,
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
                                            newsLocalArrayItem,
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
                                            10.0, 12.0, 10.0, 0.0),
                                        child: custom_widgets.ReadMoreWidget(
                                          width: double.infinity,
                                          textContent: getJsonField(
                                            newsLocalArrayItem,
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
                                                    MainAxisAlignment
                                                        .spaceAround,
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
                                                                  fontSize:
                                                                      16.0,
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
                                                            BorderRadius
                                                                .circular(8.0),
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
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
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
                                                        newsLocalArrayItem,
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
                                                      if (_model.isNewsLiked ==
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
                                                      isScrollControlled: true,
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
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (_model.commentDotFlag! >
                                                      0) {
                                                    showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
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
                                                                newsLocalArrayItem,
                                                                r'''$.newsId''',
                                                              ).toString(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'No comments found',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2500),
                                                        backgroundColor:
                                                            Color(0xFF748187),
                                                      ),
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  width: 48.0,
                                                  height: 48.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            12.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/messages.svg',
                                                            width: 24.0,
                                                            height: 24.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      if (_model
                                                              .commentDotFlag! >
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
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                              ),
                                              Builder(
                                                builder: (context) => InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await Share.share(
                                                      functions
                                                          .combineWithNewLine(
                                                              getJsonField(
                                                                newsLocalArrayItem,
                                                                r'''$.newsTitle''',
                                                              ).toString(),
                                                              getJsonField(
                                                                newsLocalArrayItem,
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
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
                                                        newsLocalArrayItem,
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
                                                      if (_model.isNewsSaved ==
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
                                                      isScrollControlled: true,
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
                                                      child: SvgPicture.network(
                                                        _model
                                                            .imageAssetsForSave,
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
                          ),
                        ],
                      ),
                    );
                  },
                  carouselController: _model.carouselController ??=
                      CarouselSliderController(),
                  options: CarouselOptions(
                    initialPage: max(
                        0,
                        min(
                            valueOrDefault<int>(
                              widget!.currentNewsPageInitalIDX,
                              0,
                            ),
                            newsLocalArray.length - 1)),
                    viewportFraction: 1.0,
                    disableCenter: true,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.5,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                    autoPlay: false,
                    onPageChanged: (index, _) async {
                      _model.carouselCurrentIndex = index;
                      _model.isNewsLiked = getJsonField(
                        newsLocalArray
                            .elementAtOrNull(_model.carouselCurrentIndex),
                        r'''$.isNewsLiked''',
                      );
                      _model.isNewsSaved = getJsonField(
                        newsLocalArray
                            .elementAtOrNull(_model.carouselCurrentIndex),
                        r'''$.isNewsSaved''',
                      );
                      _model.commentDotFlag = getJsonField(
                        newsLocalArray
                            .elementAtOrNull(_model.carouselCurrentIndex),
                        r'''$.commentsCount''',
                      );
                      _model.isPageSwiped = true;
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
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
