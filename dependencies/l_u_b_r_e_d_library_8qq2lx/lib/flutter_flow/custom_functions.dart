import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';

String cryptoXorDecrypt(
  String encryptedBase64,
  String secretKey,
) {
  List<int> encryptedBytes = base64Decode(encryptedBase64);
  List<int> keyBytes = utf8.encode(secretKey);

  // XOR again with the same key to get original bytes
  List<int> decryptedBytes = List.generate(
    encryptedBytes.length,
    (i) => encryptedBytes[i] ^ keyBytes[i % keyBytes.length],
  );

  return utf8.decode(decryptedBytes);
}

String cryptoXorEncrypt(
  String message,
  String secretKey,
) {
  List<int> messageBytes = utf8.encode(message);
  List<int> keyBytes = utf8.encode(secretKey);

  // XOR each byte of the message with the key
  List<int> encryptedBytes = List.generate(
    messageBytes.length,
    (i) => messageBytes[i] ^ keyBytes[i % keyBytes.length],
  );

  // Encode the result as Base64
  String encryptedBase64 = base64Encode(encryptedBytes);

  return encryptedBase64;
}

List<String> strSplitText(
  String text,
  String delimiter,
) {
// If the delimiter is empty, return the text as a single element
  if (delimiter.isEmpty) {
    return [text];
  }

  // Use Dart's built-in split() method
  List<String> parts = text.split(delimiter);

  // Trim whitespace from each part (optional but usually helpful)
  return parts.map((part) => part.trim()).toList();
}

int dtTimestampDifference(
  DateTime startTime,
  DateTime endTime,
) {
  Duration difference = endTime.difference(startTime);
  int minutes = difference.inMinutes;

  return minutes;
}
