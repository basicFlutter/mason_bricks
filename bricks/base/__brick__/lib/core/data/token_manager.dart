import '../secure_storage/secure_storage.dart';

class TokenManager {
  static final _storage = SecureStorage();
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  static Future<void> setTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(_accessTokenKey, accessToken);
    await _storage.write(_refreshTokenKey, refreshToken);
  }

  static Future<String?> getAccessToken() async {
    return await _storage.read(_accessTokenKey);
  }

  static Future<String?> getRefreshToken() async {
    return await _storage.read(_refreshTokenKey);
  }

  static Future<void> clearTokens() async {
    await _storage.delete(_accessTokenKey);
    await _storage.delete(_refreshTokenKey);
  }
}