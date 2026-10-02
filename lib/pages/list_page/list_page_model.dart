import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/list_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'list_page_widget.dart' show ListPageWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListPageModel extends FlutterFlowModel<ListPageWidget> {
  ///  Local state fields for this page.

  TodolistStruct? todoListResponse;
  void updateTodoListResponseStruct(Function(TodolistStruct) updateFn) {
    updateFn(todoListResponse ??= TodolistStruct());
  }

  int count = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (DeleteTodo)] action in ListItem widget.
  ApiCallResponse? deleteTodoAPI;
  // Stores action output result for [Backend Call - API (UpdateToDOList)] action in ListItem widget.
  ApiCallResponse? updateCheckBoxAPI;
  // Stores action output result for [Backend Call - API (GetFullToDOList)] action in Button widget.
  ApiCallResponse? fullTodoListResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
