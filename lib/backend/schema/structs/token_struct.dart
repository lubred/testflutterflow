// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TokenStruct extends BaseStruct {
  TokenStruct({
    String? tokenName,
    String? clientno,
    String? serialno,
    String? authcode,
  })  : _tokenName = tokenName,
        _clientno = clientno,
        _serialno = serialno,
        _authcode = authcode;

  // "tokenName" field.
  String? _tokenName;
  String get tokenName => _tokenName ?? '';
  set tokenName(String? val) => _tokenName = val;

  bool hasTokenName() => _tokenName != null;

  // "clientno" field.
  String? _clientno;
  String get clientno => _clientno ?? '';
  set clientno(String? val) => _clientno = val;

  bool hasClientno() => _clientno != null;

  // "serialno" field.
  String? _serialno;
  String get serialno => _serialno ?? '';
  set serialno(String? val) => _serialno = val;

  bool hasSerialno() => _serialno != null;

  // "authcode" field.
  String? _authcode;
  String get authcode => _authcode ?? '';
  set authcode(String? val) => _authcode = val;

  bool hasAuthcode() => _authcode != null;

  static TokenStruct fromMap(Map<String, dynamic> data) => TokenStruct(
        tokenName: data['tokenName'] as String?,
        clientno: data['clientno'] as String?,
        serialno: data['serialno'] as String?,
        authcode: data['authcode'] as String?,
      );

  static TokenStruct? maybeFromMap(dynamic data) =>
      data is Map ? TokenStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'tokenName': _tokenName,
        'clientno': _clientno,
        'serialno': _serialno,
        'authcode': _authcode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tokenName': serializeParam(
          _tokenName,
          ParamType.String,
        ),
        'clientno': serializeParam(
          _clientno,
          ParamType.String,
        ),
        'serialno': serializeParam(
          _serialno,
          ParamType.String,
        ),
        'authcode': serializeParam(
          _authcode,
          ParamType.String,
        ),
      }.withoutNulls;

  static TokenStruct fromSerializableMap(Map<String, dynamic> data) =>
      TokenStruct(
        tokenName: deserializeParam(
          data['tokenName'],
          ParamType.String,
          false,
        ),
        clientno: deserializeParam(
          data['clientno'],
          ParamType.String,
          false,
        ),
        serialno: deserializeParam(
          data['serialno'],
          ParamType.String,
          false,
        ),
        authcode: deserializeParam(
          data['authcode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TokenStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TokenStruct &&
        tokenName == other.tokenName &&
        clientno == other.clientno &&
        serialno == other.serialno &&
        authcode == other.authcode;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([tokenName, clientno, serialno, authcode]);
}

TokenStruct createTokenStruct({
  String? tokenName,
  String? clientno,
  String? serialno,
  String? authcode,
}) =>
    TokenStruct(
      tokenName: tokenName,
      clientno: clientno,
      serialno: serialno,
      authcode: authcode,
    );
