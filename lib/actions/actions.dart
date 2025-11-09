import '/flutter_flow/flutter_flow_util.dart';
import 'package:l_u_b_r_e_d_library_8qq2lx/flutter_flow/custom_functions.dart'
    as l_u_b_r_e_d_library_8qq2lx_functions;
import 'package:flutter/material.dart';

Future<bool?> isLoginActive(BuildContext context) async {
  if (FFAppState().isLoggedIn &&
      (l_u_b_r_e_d_library_8qq2lx_functions.dtTimestampDifference(
              FFAppState().LastActivityTimestamp!, getCurrentTimestamp) <
          5)) {
    FFAppState().LastActivityTimestamp = getCurrentTimestamp;
    FFAppState().update(() {});
    return true;
  } else {
    FFAppState().isLoggedIn = false;
    FFAppState().LastActivityTimestamp = getCurrentTimestamp;
    FFAppState().update(() {});
    return true;
  }
}
