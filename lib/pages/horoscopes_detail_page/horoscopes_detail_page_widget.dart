import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'horoscopes_detail_page_model.dart';
export 'horoscopes_detail_page_model.dart';

class HoroscopesDetailPageWidget extends StatefulWidget {
  const HoroscopesDetailPageWidget({super.key});

  @override
  State<HoroscopesDetailPageWidget> createState() =>
      _HoroscopesDetailPageWidgetState();
}

class _HoroscopesDetailPageWidgetState
    extends State<HoroscopesDetailPageWidget> {
  late HoroscopesDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HoroscopesDetailPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: const SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
