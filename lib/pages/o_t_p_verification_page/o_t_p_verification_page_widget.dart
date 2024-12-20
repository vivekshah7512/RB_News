import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_t_p_verification_page_model.dart';
export 'o_t_p_verification_page_model.dart';

class OTPVerificationPageWidget extends StatefulWidget {
  const OTPVerificationPageWidget({
    super.key,
    String? emailAddress,
    bool? timerSeconds,
    int? resendTextState,
  })  : this.emailAddress = emailAddress ?? 'email',
        this.timerSeconds = timerSeconds ?? true,
        this.resendTextState = resendTextState ?? 0;

  final String emailAddress;
  final bool timerSeconds;
  final int resendTextState;

  @override
  State<OTPVerificationPageWidget> createState() =>
      _OTPVerificationPageWidgetState();
}

class _OTPVerificationPageWidgetState extends State<OTPVerificationPageWidget>
    with RouteAware {
  late OTPVerificationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OTPVerificationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      FFAppState().TimerSeconds = 1;
      FFAppState().IsStartedTIMER = false;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: Color(0xFFF8F8F8),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 35.0, 20.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF8F8F8),
              ),
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.99, -1.0),
                        child: FlutterFlowIconButton(
                          borderColor: Color(0xFFE6E6E6),
                          borderRadius: 12.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.chevron_left_rounded,
                            color: Color(0xFF808080),
                            size: 24.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/actionbar_logo.png',
                            width: 137.0,
                            height: 24.0,
                            fit: BoxFit.contain,
                            alignment: Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.0,
                        child: Align(
                          alignment: AlignmentDirectional(-0.99, -1.0),
                          child: FlutterFlowIconButton(
                            borderColor: Color(0xFFE6E6E6),
                            borderRadius: 12.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: Colors.white,
                            icon: Icon(
                              Icons.chevron_left_rounded,
                              color: Color(0xFF808080),
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.99, -0.76),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                      child: Text(
                        'OTP ચકાસણી',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFF1A1A1A),
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -0.66),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Text(
                        'અમે તમારા નોંધાયેલ ઇમેઇલ સરનામે ${widget!.emailAddress} પર એક ચકાસણી કોડ મોકલ્યો છે.',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFF808080),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: PinCodeTextField(
                        autoDisposeControllers: false,
                        appContext: context,
                        length: 4,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        enableActiveFill: true,
                        autoFocus: false,
                        enablePinAutofill: true,
                        errorTextSpace: 16.0,
                        showCursor: true,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          fieldHeight: 44.0,
                          fieldWidth: 44.0,
                          borderWidth: 1.0,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                          shape: PinCodeFieldShape.box,
                          activeColor: FlutterFlowTheme.of(context).primaryText,
                          inactiveColor: Color(0xFFE6E6E6),
                          selectedColor: FlutterFlowTheme.of(context).primary,
                          activeFillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          inactiveFillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          selectedFillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        controller: _model.pinCodeController,
                        onChanged: (_) {},
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: _model.pinCodeControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  if (FFAppState().resendTimerVisible == 0)
                    FlutterFlowTimer(
                      initialTime: _model.timerInitialTimeMs,
                      getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                        value,
                        hours: false,
                        milliSecond: false,
                      ),
                      controller: _model.timerController,
                      updateStateInterval: Duration(milliseconds: 1000),
                      onChanged: (value, displayTime, shouldUpdate) {
                        _model.timerMilliseconds = value;
                        _model.timerValue = displayTime;
                        if (shouldUpdate) safeSetState(() {});
                      },
                      onEnded: () async {
                        FFAppState().resendTimerVisible = 1;
                        safeSetState(() {});
                      },
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF808080),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                  if (FFAppState().resendTimerVisible == 1)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().resendTimerVisible = 0;
                        safeSetState(() {});
                        _model.timerController.timer
                            .setPresetTime(mSec: 60000, add: false);
                        _model.timerController.onResetTimer();

                        _model.timerController.onStartTimer();
                      },
                      child: Text(
                        'કોડ ફરીથી મોકલો',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFB3B3B3),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 25.0, 0.0, 25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (functions.isValidPincode(
                                _model.pinCodeController!.text)) {
                              _model.apiResultup6CopyCopy =
                                  await RBNewsAPIGroup.oTPVarificationCall.call(
                                email: widget!.emailAddress,
                                otp: _model.pinCodeController!.text,
                                latitude: FFAppState().latitude,
                                longitude: FFAppState().longitude,
                              );

                              if ((_model.apiResultup6CopyCopy?.succeeded ??
                                  true)) {
                                await Future.delayed(
                                    const Duration(milliseconds: 3000));
                                FFAppState().authToken = getJsonField(
                                  (_model.apiResultup6CopyCopy?.jsonBody ?? ''),
                                  r'''$.data.jwtTokenString''',
                                ).toString();
                                FFAppState().isUserLoggedIn = true;
                                FFAppState().userEmail = getJsonField(
                                  (_model.apiResultup6CopyCopy?.jsonBody ?? ''),
                                  r'''$.data.userEmail''',
                                ).toString();
                                FFAppState().userIdAPI = getJsonField(
                                  (_model.apiResultup6CopyCopy?.jsonBody ?? ''),
                                  r'''$.data.userId''',
                                );
                                FFAppState().authTokenAPI = getJsonField(
                                  (_model.apiResultup6CopyCopy?.jsonBody ?? ''),
                                  r'''$.data.jwtTokenString''',
                                ).toString();
                                FFAppState().userContactNumber = getJsonField(
                                  (_model.apiResultup6CopyCopy?.jsonBody ?? ''),
                                  r'''$.data.userContactNumber''',
                                ).toString();
                                FFAppState().userName = getJsonField(
                                  (_model.apiResultup6CopyCopy?.jsonBody ?? ''),
                                  r'''$.data.userFullName''',
                                ).toString();
                                safeSetState(() {});

                                context.pushNamed(
                                  'HomePage',
                                  queryParameters: {
                                    'hintFlag': serializeParam(
                                      1,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      getJsonField(
                                        (_model.apiResultup6CopyCopy
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.message''',
                                      ).toString(),
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please enter valid OTP',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 2500),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                          text: 'સાઇન ઇન',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 45.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF5374FF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
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
