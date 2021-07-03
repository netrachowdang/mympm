import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductEditWidget extends StatefulWidget {
  ProductEditWidget({Key key}) : super(key: key);

  @override
  _ProductEditWidgetState createState() => _ProductEditWidgetState();
}

class _ProductEditWidgetState extends State<ProductEditWidget> {
  TextEditingController articleDescriptionController;
  TextEditingController articleTitleController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    articleDescriptionController = TextEditingController();
    articleTitleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        leading: Icon(
          Icons.arrow_back_sharp,
          color: Color(0xFFFBFCFE),
          size: 24,
        ),
        title: Text(
          'Add Update Article',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Color(0xFFFBFCFE),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Icon(
              Icons.delete,
              color: Color(0xFFFBFCFE),
              size: 24,
            ),
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 1),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: TextFormField(
                                  controller: articleTitleController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Article Title',
                                    labelStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lato',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lato',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                color: Color(0xFFFBFCFE),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(2),
                                  bottomRight: Radius.circular(2),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 1, 5, 10),
                                child: TextFormField(
                                  controller: articleDescriptionController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Article Description',
                                    labelStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 10,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final articleRecordData = createArticleRecordData(
                            articleTitle: articleTitleController.text,
                            excerpt: articleDescriptionController.text,
                            createdate: getCurrentTimestamp,
                            creator: currentUserDisplayName,
                            articleDescription:
                                articleDescriptionController.text,
                          );
                          await ArticleRecord.collection
                              .doc()
                              .set(articleRecordData);
                          Navigator.pop(context);
                        },
                        text: 'Add New',
                        options: FFButtonOptions(
                          width: 150,
                          height: 40,
                          color: Color(0xFF0BB727),
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Update',
                      options: FFButtonOptions(
                        width: 150,
                        height: 40,
                        color: Color(0xFF0BB727),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
