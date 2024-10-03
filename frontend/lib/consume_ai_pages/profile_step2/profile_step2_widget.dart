import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'profile_step2_model.dart';
export 'profile_step2_model.dart';

class ProfileStep2Widget extends StatefulWidget {
  const ProfileStep2Widget({
    super.key,
    required this.docRef,
  });

  final DocumentReference? docRef;

  @override
  State<ProfileStep2Widget> createState() => _ProfileStep2WidgetState();
}

class _ProfileStep2WidgetState extends State<ProfileStep2Widget> {
  late ProfileStep2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileStep2Model());
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
            'emq5ilrt' /* profile.... */,
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
                          '9qvkds3d' /* Do you have any chronic diseas... */,
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
                          value: _model.diabetesCheckboxValue ??= false,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.diabetesCheckboxValue = newValue!);
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
                          '28ciu3pi' /* Diabetes (Type 1, Type 2) */,
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
                          value: _model.heartCheckboxValue ??= false,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.heartCheckboxValue = newValue!);
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
                          '94ic29iu' /* Heart (Cardiovascular, Coronar... */,
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
                          value: _model.obeseCheckboxValue ??= false,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.obeseCheckboxValue = newValue!);
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
                          '6jd3dg7i' /* Obesity/Overweight */,
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
                          value: _model.digestCheckboxValue ??= false,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.digestCheckboxValue = newValue!);
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
                          'dhskg9l3' /* Digestive (Celiac, Lactose Int... */,
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
                          value: _model.noneCheckboxValue ??= false,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.noneCheckboxValue = newValue!);
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
                          'glndjmtc' /* None */,
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
                          'diabetes': _model.diabetesCheckboxValue,
                          'heart': _model.heartCheckboxValue,
                          'obesity': _model.obeseCheckboxValue,
                          'digest': _model.digestCheckboxValue,
                          'none': _model.noneCheckboxValue,
                        });

                        await widget.docRef!
                            .update(createUserProfilingRecordData(
                          chronicDiseases: createChronicDiseasesStruct(
                            diabetes: _model.diabetesCheckboxValue,
                            heart: _model.heartCheckboxValue,
                            obesity: _model.obeseCheckboxValue,
                            digestive: _model.digestCheckboxValue,
                            clearUnsetFields: false,
                          ),
                        ));

                        context.pushNamed(
                          'profileStep3',
                          queryParameters: {
                            'docRef': serializeParam(
                              widget.docRef,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'x1kxeqok' /* Next */,
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
