import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'improve_consumewise_a_i_widget.dart' show ImproveConsumewiseAIWidget;
import 'package:flutter/material.dart';

class ImproveConsumewiseAIModel
    extends FlutterFlowModel<ImproveConsumewiseAIWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (imageScanAPI)] action in scanButton widget.
  ApiCallResponse? imageScanAPIVal;
  // State field(s) for prodname widget.
  FocusNode? prodnameFocusNode1;
  TextEditingController? prodnameTextController1;
  String? Function(BuildContext, String?)? prodnameTextController1Validator;
  // State field(s) for prodname widget.
  FocusNode? prodnameFocusNode2;
  TextEditingController? prodnameTextController2;
  String? Function(BuildContext, String?)? prodnameTextController2Validator;
  // State field(s) for ingredients widget.
  FocusNode? ingredientsFocusNode1;
  TextEditingController? ingredientsTextController1;
  String? Function(BuildContext, String?)? ingredientsTextController1Validator;
  // State field(s) for ingredients widget.
  FocusNode? ingredientsFocusNode2;
  TextEditingController? ingredientsTextController2;
  String? Function(BuildContext, String?)? ingredientsTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    prodnameFocusNode1?.dispose();
    prodnameTextController1?.dispose();

    prodnameFocusNode2?.dispose();
    prodnameTextController2?.dispose();

    ingredientsFocusNode1?.dispose();
    ingredientsTextController1?.dispose();

    ingredientsFocusNode2?.dispose();
    ingredientsTextController2?.dispose();
  }
}
