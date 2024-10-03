import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'homepage_first_time_widget.dart' show HomepageFirstTimeWidget;
import 'package:flutter/material.dart';

class HomepageFirstTimeModel extends FlutterFlowModel<HomepageFirstTimeWidget> {
  ///  Local state fields for this page.

  bool loaderState = false;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (imageScanAPI)] action in Card widget.
  ApiCallResponse? imageScanResultCopy;
  var barCodeValueCopy = '';
  // Stores action output result for [Backend Call - API (barScanAPI)] action in Card widget.
  ApiCallResponse? barCodeScanResultCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
