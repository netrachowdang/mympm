import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizWidget extends StatefulWidget {
  QuizWidget({Key key}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Quiz',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Poppins',
            color: Color(0xFFFBFCFE),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: FlutterFlowWebView(
        url: 'https://mylearning.work',
        bypass: false,
        verticalScroll: false,
        horizontalScroll: false,
      ),
    );
  }
}
