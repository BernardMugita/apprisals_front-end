import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageAccess {
  final storage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<void> writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value, aOptions: _getAndroidOptions());
  }

  Future<String?> readSecureData(String key) async {
    return storage.read(key: key, aOptions: _getAndroidOptions());
  }

  Future<void> deleteSecureData(String key) async {
    await storage.delete(key: key, aOptions: _getAndroidOptions());
  }
}
