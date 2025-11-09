import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'show_otp_widget.dart' show ShowOtpWidget;
import 'package:flutter/material.dart';

class ShowOtpModel extends FlutterFlowModel<ShowOtpWidget> {
  ///  Local state fields for this page.

  String? otp;

  String? timeremaining;

  double? iStep = 0.0;

  String? lastotp;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - isLoginActive] action in showOtp widget.
  bool? rtnIsActive;
  InstantTimer? refreshToken;
  // Stores action output result for [Custom Action - generateOtp] action in showOtp widget.
  dynamic generatedToken;
  InstantTimer? progressBar;
  var rtnme = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    refreshToken?.cancel();
    progressBar?.cancel();
  }
}
