import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/list_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_page_model.dart';
export 'list_page_model.dart';

class ListPageWidget extends StatefulWidget {
  const ListPageWidget({super.key});

  static String routeName = 'ListPage';
  static String routePath = '/listPage';

  @override
  State<ListPageWidget> createState() => _ListPageWidgetState();
}

class _ListPageWidgetState extends State<ListPageWidget> {
  late ListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFFB493),
        appBar: AppBar(
          backgroundColor: Color(0xD94F2917),
          automaticallyImplyLeading: false,
          title: Text(
            'My To-Do List',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.restore,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                _model.todoListResponse = null;
                safeSetState(() {});
              },
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    if (_model.todoListResponse != null) {
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 0.95,
                        height: MediaQuery.sizeOf(context).height * 0.85,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFB493),
                        ),
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Builder(
                          builder: (context) {
                            final list =
                                _model.todoListResponse?.todos?.toList() ?? [];

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: list.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 15.0),
                              itemBuilder: (context, listIndex) {
                                final listItem = list[listIndex];
                                return ListItemWidget(
                                  key: Key(
                                      'Keywyf_${listIndex}_of_${list.length}'),
                                  todoData: listItem.todo,
                                  checkBox: listItem.completed,
                                  deleteTodo: () async {
                                    _model.deleteTodoAPI =
                                        await TodoListBaseURLGroup
                                            .deleteTodoCall
                                            .call(
                                      id: listItem.id,
                                    );

                                    if ((_model.deleteTodoAPI?.succeeded ??
                                        true)) {
                                      if (DeletedResponseStruct.maybeFromMap(
                                                  (_model.deleteTodoAPI
                                                          ?.jsonBody ??
                                                      ''))
                                              ?.isDeleted ==
                                          true) {
                                        _model.updateTodoListResponseStruct(
                                          (e) => e
                                            ..updateTodos(
                                              (e) => e.removeAt(listIndex),
                                            ),
                                        );
                                        safeSetState(() {});
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Unable to delete. Something went wrong..',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 3000),
                                            backgroundColor: Color(0xD94F2917),
                                          ),
                                        );
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Something went wrong. Unable to complete the request',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xD94F2917),
                                        ),
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  updateCheckBox: () async {
                                    _model.updateCheckBoxAPI =
                                        await TodoListBaseURLGroup
                                            .updateToDOListCall
                                            .call(
                                      id: listItem.id,
                                      completed: listItem.completed == false
                                          ? true
                                          : false,
                                    );

                                    if ((_model.updateCheckBoxAPI?.succeeded ??
                                        true)) {
                                      _model.updateTodoListResponseStruct(
                                        (e) => e
                                          ..updateTodos(
                                            (e) => e[listIndex]
                                              ..completed = TodosStruct
                                                      .maybeFromMap((_model
                                                              .updateCheckBoxAPI
                                                              ?.jsonBody ??
                                                          ''))
                                                  ?.completed,
                                          ),
                                      );
                                      safeSetState(() {});
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Successfully removed....',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xD94F2917),
                                        ),
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                );
                              },
                            );
                          },
                        ),
                      );
                    } else {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 150.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).info,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            icon: FaIcon(
                                              FontAwesomeIcons.minus,
                                              color: Color(0xD94F2917),
                                            ),
                                            onPressed: () async {
                                              if (_model.count > 0) {
                                                _model.count =
                                                    _model.count + -1;
                                                safeSetState(() {});
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Count cannot go below zero...',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 2000),
                                                    backgroundColor:
                                                        Color(0xD94F2917),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              _model.count.toString(),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            icon: Icon(
                                              Icons.add,
                                              color: Color(0xD94F2917),
                                              size: 28.0,
                                            ),
                                            onPressed: () async {
                                              _model.count = _model.count + 1;
                                              safeSetState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.count != 0) {
                                    _model.fullTodoListResponse =
                                        await TodoListBaseURLGroup
                                            .getFullToDOListCall
                                            .call(
                                      limit: _model.count,
                                    );

                                    if ((_model
                                            .fullTodoListResponse?.succeeded ??
                                        true)) {
                                      _model.todoListResponse =
                                          TodolistStruct.maybeFromMap((_model
                                                  .fullTodoListResponse
                                                  ?.jsonBody ??
                                              ''));
                                      safeSetState(() {});
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Something went wrong. Unable to complete the request...',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xD94F2917),
                                        ),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Item count must be greater than zero.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 2000),
                                        backgroundColor: Color(0xD94F2917),
                                      ),
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                text: 'Generate Random TODOs',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xD94F2917),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ].divide(SizedBox(height: 15.0)),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ].addToStart(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
