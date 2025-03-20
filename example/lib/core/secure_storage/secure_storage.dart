import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '/core/secure_storage/secure_storage_interface.dart';

class SecureStorage implements SecureStorageInterface {
  final FlutterSecureStorage _flutterSecureStorage;

  static const _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  static const _iosOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
  );

  static final SecureStorage _instance = SecureStorage._internal();

  SecureStorage._internal()
      : _flutterSecureStorage = const FlutterSecureStorage(
    aOptions: _androidOptions,
    iOptions: _iosOptions,
  );

  factory SecureStorage() => _instance;

  @override
  Future<String?> read(String key) async {
    try {
      return await _flutterSecureStorage.read(key: key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> write(String key, String value) async {
    try {
      await _flutterSecureStorage.write(key: key, value: value);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _flutterSecureStorage.delete(key: key);
    } catch (e) {
      rethrow;
    }
  }
}