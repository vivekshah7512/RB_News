import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'o_t_p_verification_page_model.dart';
export 'o_t_p_verification_page_model.dart';

class OTPVerificationPageWidget extends StatefulWidget {
  const OTPVerificationPageWidget({
    super.key,
    String? emailAddress,
  }) : this.emailAddress = emailAddress ?? 'email';

  final String emailAddress;

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
      FFAppState().IsStartedTIMER = false;
      while (FFAppState().TimerSeconds > 0) {
        _model.updatedTimer = await actions.startDecrementingTimer(
          FFAppState().TimerSeconds,
        );
        FFAppState().TimerSeconds = _model.updatedTimer!;
        FFAppState().update(() {});
        await Future.delayed(const Duration(milliseconds: 1000));
      }

      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      FFAppState().IsStartedTIMER = false;
      FFAppState().TimerSeconds = 60;
    }();

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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
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
                        onPressed: () async {
                          context.safePop();
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
                            fontFamily: 'BalooBhaiGujarati',
                            color: Color(0xFF1A1A1A),
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
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
                      'અમે તમારા નોંધાયેલ ઇમેઇલ સરનામે ${functions.maskEmail(widget!.emailAddress)} પર એક ચકાસણી કોડ મોકલ્યો છે.',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'BalooBhaiGujarati',
                            color: Color(0xFF808080),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
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
                                fontFamily: 'BalooBhaiGujarati',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      enableActiveFill: true,
                      autoFocus: false,
                      enablePinAutofill: true,
                      errorTextSpace: 16.0,
                      showCursor: false,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        fieldHeight: 48.0,
                        fieldWidth: 72.0,
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
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (FFAppState().TimerSeconds != 0)
                          CircularPercentIndicator(
                            percent: functions.convertProgressBarValue(
                                FFAppState().TimerSeconds),
                            radius: 17.5,
                            lineWidth: 3.0,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor: FlutterFlowTheme.of(context).primary,
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent4,
                            center: Text(
                              '${FFAppState().TimerSeconds.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'BalooBhaiGujarati',
                                    fontSize: 12.0,
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
                            if (FFAppState().TimerSeconds == 0) {
                              _model.apiResultcd7 =
                                  await RBNewsAPIGroup.resendOTPCall.call(
                                email: widget!.emailAddress,
                              );

                              if ((_model.apiResultcd7?.succeeded ?? true)) {
                                FFAppState().resendTimerVisible = 0;
                                FFAppState().TimerSeconds = 60;
                                safeSetState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      getJsonField(
                                        (_model.apiResultcd7?.jsonBody ?? ''),
                                        r'''$.message''',
                                      ).toString(),
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0xFF748187),
                                  ),
                                );
                                FFAppState().IsStartedTIMER = false;
                                while (FFAppState().TimerSeconds > 0) {
                                  _model.updatedTimerResend =
                                      await actions.startDecrementingTimer(
                                    FFAppState().TimerSeconds,
                                  );
                                  FFAppState().TimerSeconds =
                                      _model.updatedTimerResend!;
                                  FFAppState().update(() {});
                                  await Future.delayed(
                                      const Duration(milliseconds: 1000));
                                }

                                safeSetState(() {});
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      getJsonField(
                                        (_model.apiResultcd7?.jsonBody ?? ''),
                                        r'''$.message''',
                                      ).toString(),
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0xFF748187),
                                  ),
                                );
                              }
                            }

                            safeSetState(() {});
                          },
                          child: Text(
                            'કોડ ફરીથી મોકલો',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'BalooBhaiGujarati',
                                  color: FFAppState().TimerSeconds == 0
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : Color(0xFF808080),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 25.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (functions
                          .isValidPincode(_model.pinCodeController!.text)) {
                        _model.apiResultup6OTP =
                            await RBNewsAPIGroup.oTPVarificationCall.call(
                          email: widget!.emailAddress,
                          otp: _model.pinCodeController!.text,
                          latitude: FFAppState().latitude,
                          longitude: FFAppState().longitude,
                        );

                        _model.otpIsSuccess = getJsonField(
                          (_model.apiResultup6OTP?.jsonBody ?? ''),
                          r'''$.isSuccessfull''',
                        );
                        safeSetState(() {});
                        if (_model.otpIsSuccess == true) {
                          await Future.delayed(
                              const Duration(milliseconds: 300));
                          FFAppState().authToken = getJsonField(
                            (_model.apiResultup6OTP?.jsonBody ?? ''),
                            r'''$.data.jwtTokenString''',
                          ).toString();
                          FFAppState().isUserLoggedIn = true;
                          FFAppState().userEmail = getJsonField(
                            (_model.apiResultup6OTP?.jsonBody ?? ''),
                            r'''$.data.userEmail''',
                          ).toString();
                          FFAppState().userIdAPI = getJsonField(
                            (_model.apiResultup6OTP?.jsonBody ?? ''),
                            r'''$.data.userId''',
                          );
                          FFAppState().authTokenAPI = getJsonField(
                            (_model.apiResultup6OTP?.jsonBody ?? ''),
                            r'''$.data.jwtTokenString''',
                          ).toString();
                          FFAppState().userContactNumber = getJsonField(
                            (_model.apiResultup6OTP?.jsonBody ?? ''),
                            r'''$.data.userContactNumber''',
                          ).toString();
                          FFAppState().userName = getJsonField(
                            (_model.apiResultup6OTP?.jsonBody ?? ''),
                            r'''$.data.userFullName''',
                          ).toString();
                          safeSetState(() {});

                          context.goNamed(
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
                                  (_model.apiResultup6OTP?.jsonBody ?? ''),
                                  r'''$.message''',
                                ).toString(),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 14.0,
                                ),
                              ),
                              duration: Duration(milliseconds: 2500),
                              backgroundColor: Color(0xFF748187),
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
                                    .secondaryBackground,
                                fontSize: 14.0,
                              ),
                            ),
                            duration: Duration(milliseconds: 2500),
                            backgroundColor: Color(0xFF748187),
                          ),
                        );
                      }

                      safeSetState(() {});
                    },
                    text: 'સાઇન ઇન',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF5374FF),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'BalooBhaiGujarati',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: false,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
