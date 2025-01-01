import '/backend/api_requests/api_calls.dart';
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
import 'property_detail_new_model.dart';
export 'property_detail_new_model.dart';

class PropertyDetailNewWidget extends StatefulWidget {
  const PropertyDetailNewWidget({
    super.key,
    int? propertyId,
    required this.propertyAllImages,
  }) : this.propertyId = propertyId ?? 1;

  final int propertyId;
  final List<String>? propertyAllImages;

  @override
  State<PropertyDetailNewWidget> createState() =>
      _PropertyDetailNewWidgetState();
}

class _PropertyDetailNewWidgetState extends State<PropertyDetailNewWidget>
    with RouteAware {
  late PropertyDetailNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PropertyDetailNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tapImage = widget!.propertyAllImages?.firstOrNull;
      safeSetState(() {});
      _model.selectedImageId = 0;
      safeSetState(() {});
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

    return FutureBuilder<ApiCallResponse>(
      future: RBNewsAPIGroup.propertyDetailCall.call(
        authToken: FFAppState().authTokenAPI,
        propertyId: widget!.propertyId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingFour(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final propertyDetailNewPropertyDetailResponse = snapshot.data!;
        _model.debugBackendQueries[
                'RBNewsAPIGroup.propertyDetailCall_statusCode_Scaffold_27xlqt75'] =
            debugSerializeParam(
          propertyDetailNewPropertyDetailResponse.statusCode,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailNew',
          name: 'int',
          nullable: false,
        );
        _model.debugBackendQueries[
                'RBNewsAPIGroup.propertyDetailCall_responseBody_Scaffold_27xlqt75'] =
            debugSerializeParam(
          propertyDetailNewPropertyDetailResponse.bodyText,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailNew',
          name: 'String',
          nullable: false,
        );
        debugLogWidgetClass(_model);

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 451.0,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                _model.tapImage!,
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  'assets/images/error_image.png',
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
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
                          if (widget!.propertyAllImages!.length > 0)
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 42.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xE6FFFFFF),
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
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Builder(
                                      builder: (context) {
                                        final propertyImages = getJsonField(
                                          propertyDetailNewPropertyDetailResponse
                                              .jsonBody,
                                          r'''$.data.propertyImagesURL''',
                                        ).toList();
                                        _model.debugGeneratorVariables[
                                                'propertyImages${propertyImages.length > 100 ? ' (first 100)' : ''}'] =
                                            debugSerializeParam(
                                          propertyImages.take(100),
                                          ParamType.JSON,
                                          link:
                                              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=uiBuilder&page=PropertyDetailNew',
                                          name: 'dynamic',
                                          nullable: false,
                                        );
                                        debugLogWidgetClass(_model);

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: propertyImages.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(width: 10.0),
                                          itemBuilder:
                                              (context, propertyImagesIndex) {
                                            final propertyImagesItem =
                                                propertyImages[
                                                    propertyImagesIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.tapImage = widget!
                                                    .propertyAllImages
                                                    ?.elementAtOrNull(
                                                        propertyImagesIndex);
                                                safeSetState(() {});
                                                _model.selectedImageId =
                                                    propertyImagesIndex;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: Color(0xFF5374FF),
                                                    width: _model
                                                                .selectedImageId ==
                                                            propertyImagesIndex
                                                        ? 4.0
                                                        : 0.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      valueOrDefault<double>(
                                                    _model.selectedImageId ==
                                                            propertyImagesIndex
                                                        ? 4.0
                                                        : 0.0,
                                                    0.0,
                                                  )),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      (widget!
                                                          .propertyAllImages!
                                                          .elementAtOrNull(
                                                              propertyImagesIndex))!,
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
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
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF1F3FE),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 3.0, 0.0, 3.0),
                                          child: Text(
                                            '•',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF5374FF),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 3.0, 10.0, 3.0),
                                            child: Text(
                                              getJsonField(
                                                propertyDetailNewPropertyDetailResponse
                                                    .jsonBody,
                                                r'''$.data.propertyType''',
                                              ).toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF5374FF),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  getJsonField(
                                    propertyDetailNewPropertyDetailResponse
                                        .jsonBody,
                                    r'''$.data.propertyName''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF1A1A1A),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 6.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/location.png',
                                        width: 20.0,
                                        height: 20.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      getJsonField(
                                        propertyDetailNewPropertyDetailResponse
                                            .jsonBody,
                                        r'''$.data.propertyLocation''',
                                      ).toString(),
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF808080),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 6.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  child: custom_widgets.ReadMoreWidget(
                                    width: double.infinity,
                                    textContent: getJsonField(
                                      propertyDetailNewPropertyDetailResponse
                                          .jsonBody,
                                      r'''$.data.propertyDescription''',
                                    ).toString(),
                                    trimCollapsedText: 'ઓછું વાંચો',
                                    trimExpandedText: 'વધુ વાંચો',
                                    colorClickableText:
                                        FlutterFlowTheme.of(context).primary,
                                    isHtml: true,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '₹',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF1A1A1A),
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      functions.formatAmount(getJsonField(
                                        propertyDetailNewPropertyDetailResponse
                                            .jsonBody,
                                        r'''$.data.propertyPrice''',
                                      )),
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 3.0)),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'કિંમત',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF808080),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/share_property.png',
                                          width: 40.0,
                                          height: 40.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/call.png',
                                          width: 40.0,
                                          height: 40.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
