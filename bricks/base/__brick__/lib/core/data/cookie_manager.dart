import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../global_app_setup/app_config.dart';
import '../../main_dev.dart';
import 'dio_config.dart';
class CookieManager {
  static Future<bool> isUserLoggedIn() async {
    try {
      // اطمینان از مقداردهی cookieJar
      await DioConfig.initCookieJar();
      final cookieJar = DioConfig.cookieJar;

      // بررسی کوکی‌ها برای دامنه اصلی (نه endpoint مخصوص)
      final baseUri = Uri.parse(AppConfig.baseUrl);
      final loginUri = Uri.parse("${AppConfig.baseUrl}/api/v1/auth/login");

      logger.i("🔍 Checking cookies for base URI: $baseUri");
      logger.i("🔍 Checking cookies for login URI: $loginUri");

      // بررسی کوکی‌ها برای هر دو URI
      final baseCookies = await cookieJar.loadForRequest(baseUri);
      final loginCookies = await cookieJar.loadForRequest(loginUri);

      logger.w("📋 Base cookies count: ${baseCookies.length}");
      logger.w("📋 Login cookies count: ${loginCookies.length}");

      // ترکیب کوکی‌ها از هر دو مکان
      final allCookies = <Cookie>[...baseCookies, ...loginCookies];

      logger.w("📋 All cookies:");
      for (var cookie in allCookies) {
        logger.w(
          "🍪 ${cookie.name} = ${cookie.value} (domain: ${cookie.domain}, path: ${cookie.path})",
        );
      }

      // بررسی وجود access_token در بین کوکی‌ها (نام صحیح کوکی)
      final accessCookie = allCookies.firstWhere(
            (c) => c.name == 'access_token',
        orElse: () => Cookie('', ''),
      );

      final isLoggedIn = accessCookie.value.isNotEmpty;
      logger.i(
        "🔐 Access token found: ${accessCookie.value.isNotEmpty ? 'YES' : 'NO'}",
      );
      logger.i("🔐 User is logged in: $isLoggedIn");

      return isLoggedIn;
    } catch (e) {
      logger.e("❌ Error checking login status: $e");
      return false;
    }
  }

  /// پاک کردن تمام کوکی‌ها (برای logout)
  static Future<void> clearAllCookies() async {
    await DioConfig.initCookieJar();
    final cookieJar = DioConfig.cookieJar;
    await cookieJar.deleteAll();
    logger.i('✅ All cookies cleared successfully');
  }

  /// پاک کردن کوکی‌های مربوط به دامنه خاص
  static Future<void> clearCookiesForDomain() async {
    await DioConfig.initCookieJar();
    final cookieJar = DioConfig.cookieJar;
    final uri = Uri.parse(AppConfig.baseUrl);
    await cookieJar.delete(uri);
    logger.i('✅ Cookies cleared for domain: ${AppConfig.baseUrl}');
  }

  /// متد debug برای نمایش تمام کوکی‌های موجود
  static Future<void> debugAllCookies() async {
    try {
      await DioConfig.initCookieJar();
      final cookieJar = DioConfig.cookieJar;

      final baseUri = Uri.parse(AppConfig.baseUrl);
      final loginUri = Uri.parse("${AppConfig.baseUrl}/api/v1/auth/login");

      logger.i("🔍 === DEBUG: All Cookies ===");

      final baseCookies = await cookieJar.loadForRequest(baseUri);
      logger.i("📋 Base URI ($baseUri) cookies: ${baseCookies.length}");
      for (var cookie in baseCookies) {
        logger.i("  🍪 ${cookie.name} = ${cookie.value}");
      }

      final loginCookies = await cookieJar.loadForRequest(loginUri);
      logger.i("📋 Login URI ($loginUri) cookies: ${loginCookies.length}");
      for (var cookie in loginCookies) {
        logger.i("  🍪 ${cookie.name} = ${cookie.value}");
      }

      logger.i("🔍 === End Debug ===");
    } catch (e) {
      logger.e("❌ Error in debugAllCookies: $e");
    }
  }
}
