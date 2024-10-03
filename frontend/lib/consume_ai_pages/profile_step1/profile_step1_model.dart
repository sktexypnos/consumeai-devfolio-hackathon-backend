import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_step1_widget.dart' show ProfileStep1Widget;
import 'package:flutter/material.dart';

class ProfileStep1Model extends FlutterFlowModel<ProfileStep1Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for yourAge widget.
  FocusNode? yourAgeFocusNode;
  TextEditingController? yourAgeTextController;
  String? Function(BuildContext, String?)? yourAgeTextControllerValidator;
  // State field(s) for Goal widget.
  FocusNode? goalFocusNode;
  TextEditingController? goalTextController;
  String? Function(BuildContext, String?)? goalTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserProfilingRecord? addDocumentOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    yourAgeFocusNode?.dispose();
    yourAgeTextController?.dispose();

    goalFocusNode?.dispose();
    goalTextController?.dispose();
  }
}
