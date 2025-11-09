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

import 'package:otp/otp.dart';
import 'package:base32/base32.dart';
import 'dart:convert';

Future<dynamic> generateOtp(
  String pSeed1,
  String pSeed2,
  String systemSecret,
) async {
  //final String systemSecret = "04f3ab49-ae79-4fb6-8098-d03da00e1207";

  final String secretKeyBase32 =
      base32.encodeString(pSeed1 + systemSecret + pSeed2);

  final String tokenString = OTP.generateTOTPCodeString(
      secretKeyBase32, DateTime.now().toUtc().millisecondsSinceEpoch,
      algorithm: Algorithm.SHA1, isGoogle: true);

  final String tRemain = OTP.remainingSeconds().toString();

  Map<String, String> jsonData = {
    "otp": tokenString,
    "timeRemaining": tRemain,
  };

  return jsonData;
}
