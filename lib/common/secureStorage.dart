import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<Map<String, String>> readAll() async {
    final all = await _storage.readAll();
    return Map<String, String>.from(all);
  }

  Future<String?> readItem(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> addItem(String key, dynamic value) async {
    await _storage.write(key: key, value: "${value}");
  }

  Future<void> deleteItem(String key) async {
    await _storage.delete(key: key);
  }
}
