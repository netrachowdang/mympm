import '../backend/backend.dart';
import '../dailymovement/dailymovement_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovementWidget extends StatefulWidget {
  MovementWidget({Key key}) : super(key: key);

  @override
  _MovementWidgetState createState() => _MovementWidgetState();
}

class _MovementWidgetState extends State<MovementWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Movement Register',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Poppins',
            color: Color(0xFFFBFCFE),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DailymovementWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.add_box,
                color: Colors.black,
                size: 24,
              ),
            ),
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: StreamBuilder<List<MovementRecord>>(
                stream: queryMovementRecord(
                  queryBuilder: (movementRecord) =>
                      movementRecord.orderBy('dateofvisit'),
                  limit: 30,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<MovementRecord> listViewMovementRecordList =
                      snapshot.data;
                  // Customize what your widget looks like with no query results.
                  if (snapshot.data.isEmpty) {
                    return Container(
                      height: 100,
                      child: Center(
                        child: Text('No results.'),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewMovementRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewMovementRecord =
                          listViewMovementRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(8, 1, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            listViewMovementRecord.startPlce,
                                            style: FlutterFlowTheme.subtitle1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF15212B),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 0, 2, 0),
                                            child: Text(
                                              'to',
                                              style: FlutterFlowTheme.subtitle1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF15212B),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 0, 2, 0),
                                            child: Text(
                                              listViewMovementRecord.stopPlace,
                                              style: FlutterFlowTheme.subtitle1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF15212B),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Total Km traveled: ',
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          Text(
                                            '116km',
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF151515),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'start km: ',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF0F0E0E),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            listViewMovementRecord.startKm
                                                .toString(),
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 0, 0, 0),
                                            child: Text(
                                              'stop km:',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF151515),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 0, 0, 0),
                                            child: Text(
                                              listViewMovementRecord.stopKm
                                                  .toString(),
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Date of Visit: ',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF0F0E0E),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            listViewMovementRecord.dateofvisit,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                      child: Icon(
                                        Icons.edit_location_outlined,
                                        color: Color(0xFF95A1AC),
                                        size: 24,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
