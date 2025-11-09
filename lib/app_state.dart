import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _BankCode = await secureStorage.getString('ff_BankCode') ?? _BankCode;
    });
    await _safeInitAsync(() async {
      _SystemSecretKey = await secureStorage.getString('ff_SystemSecretKey') ??
          _SystemSecretKey;
    });
    await _safeInitAsync(() async {
      _tokenlist = (await secureStorage.getStringList('ff_tokenlist'))
              ?.map((x) {
                try {
                  return TokenStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _tokenlist;
    });
    await _safeInitAsync(() async {
      _loginPIN = await secureStorage.getString('ff_loginPIN') ?? _loginPIN;
    });
    await _safeInitAsync(() async {
      _bUseBiometric =
          await secureStorage.getBool('ff_bUseBiometric') ?? _bUseBiometric;
    });
    await _safeInitAsync(() async {
      _isLoggedIn = await secureStorage.getBool('ff_isLoggedIn') ?? _isLoggedIn;
    });
    await _safeInitAsync(() async {
      _LastActivityTimestamp =
          await secureStorage.read(key: 'ff_LastActivityTimestamp') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_LastActivityTimestamp'))!)
              : _LastActivityTimestamp;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _BankCode = 'UNIONBANK';
  String get BankCode => _BankCode;
  set BankCode(String value) {
    _BankCode = value;
    secureStorage.setString('ff_BankCode', value);
  }

  void deleteBankCode() {
    secureStorage.delete(key: 'ff_BankCode');
  }

  String _SystemSecretKey = '04f3ab49ae794fb68098d03da00e1207';
  String get SystemSecretKey => _SystemSecretKey;
  set SystemSecretKey(String value) {
    _SystemSecretKey = value;
    secureStorage.setString('ff_SystemSecretKey', value);
  }

  void deleteSystemSecretKey() {
    secureStorage.delete(key: 'ff_SystemSecretKey');
  }

  List<TokenStruct> _tokenlist = [];
  List<TokenStruct> get tokenlist => _tokenlist;
  set tokenlist(List<TokenStruct> value) {
    _tokenlist = value;
    secureStorage.setStringList(
        'ff_tokenlist', value.map((x) => x.serialize()).toList());
  }

  void deleteTokenlist() {
    secureStorage.delete(key: 'ff_tokenlist');
  }

  void addToTokenlist(TokenStruct value) {
    tokenlist.add(value);
    secureStorage.setStringList(
        'ff_tokenlist', _tokenlist.map((x) => x.serialize()).toList());
  }

  void removeFromTokenlist(TokenStruct value) {
    tokenlist.remove(value);
    secureStorage.setStringList(
        'ff_tokenlist', _tokenlist.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTokenlist(int index) {
    tokenlist.removeAt(index);
    secureStorage.setStringList(
        'ff_tokenlist', _tokenlist.map((x) => x.serialize()).toList());
  }

  void updateTokenlistAtIndex(
    int index,
    TokenStruct Function(TokenStruct) updateFn,
  ) {
    tokenlist[index] = updateFn(_tokenlist[index]);
    secureStorage.setStringList(
        'ff_tokenlist', _tokenlist.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTokenlist(int index, TokenStruct value) {
    tokenlist.insert(index, value);
    secureStorage.setStringList(
        'ff_tokenlist', _tokenlist.map((x) => x.serialize()).toList());
  }

  String _loginPIN = '1234';
  String get loginPIN => _loginPIN;
  set loginPIN(String value) {
    _loginPIN = value;
    secureStorage.setString('ff_loginPIN', value);
  }

  void deleteLoginPIN() {
    secureStorage.delete(key: 'ff_loginPIN');
  }

  bool _bUseBiometric = true;
  bool get bUseBiometric => _bUseBiometric;
  set bUseBiometric(bool value) {
    _bUseBiometric = value;
    secureStorage.setBool('ff_bUseBiometric', value);
  }

  void deleteBUseBiometric() {
    secureStorage.delete(key: 'ff_bUseBiometric');
  }

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    secureStorage.setBool('ff_isLoggedIn', value);
  }

  void deleteIsLoggedIn() {
    secureStorage.delete(key: 'ff_isLoggedIn');
  }

  DateTime? _LastActivityTimestamp =
      DateTime.fromMillisecondsSinceEpoch(1762643400000);
  DateTime? get LastActivityTimestamp => _LastActivityTimestamp;
  set LastActivityTimestamp(DateTime? value) {
    _LastActivityTimestamp = value;
    value != null
        ? secureStorage.setInt(
            'ff_LastActivityTimestamp', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_LastActivityTimestamp');
  }

  void deleteLastActivityTimestamp() {
    secureStorage.delete(key: 'ff_LastActivityTimestamp');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
