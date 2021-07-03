import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconTextContainerWidget extends StatefulWidget {
  IconTextContainerWidget({Key key}) : super(key: key);

  @override
  _IconTextContainerWidgetState createState() =>
      _IconTextContainerWidgetState();
}

class _IconTextContainerWidgetState extends State<IconTextContainerWidget> {
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFF64B5F6),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.settings_outlined,
            color: Colors.black,
            size: 40,
          ),
          TextFormField(
            controller: textController,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Health',
              hintStyle: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
            ),
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
