import '/flutter_flow/flutter_flow_util.dart';
import 'profile_step4_widget.dart' show ProfileStep4Widget;
import 'package:flutter/material.dart';

class ProfileStep4Model extends FlutterFlowModel<ProfileStep4Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for vegan widget.
  bool? veganValue;
  // State field(s) for veg widget.
  bool? vegValue;
  // State field(s) for nonveg widget.
  bool? nonvegValue;
  // State field(s) for keto widget.
  bool? ketoValue;
  // State field(s) for paleo widget.
  bool? paleoValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
