import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'profile_step3_model.dart';
export 'profile_step3_model.dart';

class ProfileStep3Widget extends StatefulWidget {
  const ProfileStep3Widget({
    super.key,
    required this.docRef,
  });

  final DocumentReference? docRef;

  @override
  State<ProfileStep3Widget> createState() => _ProfileStep3WidgetState();
}

class _ProfileStep3WidgetState extends State<ProfileStep3Widget> {
  late ProfileStep3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileStep3Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            '52yl14im' /* profile.... */,
          ),
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: 'Urbanist',
                letterSpacing: 0.0,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: Image.asset(
              'assets/images/login_bg@2x.png',
            ).image,
          ),
        ),
        child: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 60.0, 0.0, 20.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'hw1lbcub' /* Which allergens are you sensit... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor: const Color(0xFF839CB5),
                        ),
                        child: Checkbox(
                          value: _model.glutenValue ??= false,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.glutenValue = newValue!);
                          },
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFF839CB5),
                          ),
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'nkbz7spg' /* Gluten */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor: const Color(0xFF839CB5),
                        ),
                        child: Checkbox(
                          value: _model.dairyValue ??= false,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.dairyValue = newValue!);
                          },
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFF839CB5),
                          ),
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'r88bk3z5' /* Dairy (Milk Products) */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor: const Color(0xFF839CB5),
                        ),
                        child: Checkbox(
                          value: _model.treeValue ??= false,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.treeValue = newValue!);
                          },
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFF839CB5),
                          ),
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'tls0yhbc' /* Tree Nuts */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor: const Color(0xFF839CB5),
                        ),
                        child: Checkbox(
                          value: _model.eggValue ??= false,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.eggValue = newValue!);
                          },
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFF839CB5),
                          ),
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '7a2b1k4c' /* Egg Products */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor: const Color(0xFF839CB5),
                        ),
                        child: Checkbox(
                          value: _model.seafValue ??= false,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.seafValue = newValue!);
                          },
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFF839CB5),
                          ),
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '0g07r917' /* Sea Foods (including fish) */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor: const Color(0xFF839CB5),
                        ),
                        child: Checkbox(
                          value: _model.peanutsValue ??= false,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.peanutsValue = newValue!);
                          },
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFF839CB5),
                          ),
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '9r28qz7m' /* Peanuts */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        FFAppState().addToUserprofile(<String, dynamic>{
                          'gluten': _model.glutenValue,
                          'dairy': _model.dairyValue,
                          'treenuts': _model.treeValue,
                          'egg': _model.eggValue,
                          'seafood': _model.seafValue,
                          'peanuts': _model.peanutsValue,
                        });

                        await widget.docRef!
                            .update(createUserProfilingRecordData(
                          allergens: createAllergiesStruct(
                            gluten: _model.glutenValue,
                            dairy: _model.dairyValue,
                            treenuts: _model.treeValue,
                            eggs: _model.eggValue,
                            seafood: _model.seafValue,
                            peanuts: _model.peanutsValue,
                            clearUnsetFields: false,
                          ),
                        ));

                        context.pushNamed(
                          'profileStep4',
                          queryParameters: {
                            'docRef': serializeParam(
                              widget.docRef,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'h2h4z8he' /* Next */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
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
