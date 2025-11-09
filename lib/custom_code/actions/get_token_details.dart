// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//
import 'package:l_u_b_r_e_d_library_8qq2lx/flutter_flow/custom_functions.dart'
    as l_u_b_r_e_d_library_8qq2lx_functions;

Future<dynamic> getTokenDetails(String tokenDetails) async {
  // Add your function code here!
  String delimiter = "*";

  // Call the function
  List<String> result = l_u_b_r_e_d_library_8qq2lx_functions.strSplitText(
      tokenDetails, delimiter);

  // Return JSON-like map
  return {
    'clientno': result[0],
    'serialno': result[1],
    'authcode': result[2],
    'expirydate': result[3],
    'label1': result[4],
    'label2': result[5],
    'label3': result[6],
  };
}
