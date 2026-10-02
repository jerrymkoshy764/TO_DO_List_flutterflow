import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_item_model.dart';
export 'list_item_model.dart';

class ListItemWidget extends StatefulWidget {
  const ListItemWidget({
    super.key,
    required this.todoData,
    required this.checkBox,
    required this.deleteTodo,
    required this.updateCheckBox,
  });

  final String? todoData;
  final bool? checkBox;
  final Future Function()? deleteTodo;
  final Future Function()? updateCheckBox;

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  late ListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: 100.0,
      decoration: BoxDecoration(
        color: widget!.checkBox == true ? Color(0xFFCAC1C1) : Color(0xFFDA774E),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                      unselectedWidgetColor:
                          FlutterFlowTheme.of(context).alternate,
                    ),
                    child: Checkbox(
                      value: _model.checkboxValue ??=
                          widget!.checkBox == true ? true : false,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.checkboxValue = newValue!);
                        if (newValue!) {
                          await widget.updateCheckBox?.call();
                        } else {
                          await widget.updateCheckBox?.call();
                        }
                      },
                      side: (FlutterFlowTheme.of(context).alternate != null)
                          ? BorderSide(
                              width: 2,
                              color: FlutterFlowTheme.of(context).alternate!,
                            )
                          : null,
                      activeColor: Color(0xD94F2917),
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.65,
                      decoration: BoxDecoration(),
                      child: Text(
                        valueOrDefault<String>(
                          widget!.todoData,
                          'data',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: widget!.checkBox == true
                                  ? Colors.black
                                  : FlutterFlowTheme.of(context).info,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await widget.deleteTodo?.call();
                    },
                    child: Icon(
                      Icons.delete_outline,
                      color: FlutterFlowTheme.of(context).info,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
