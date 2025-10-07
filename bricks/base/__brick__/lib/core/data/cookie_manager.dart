import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../global_app_setup/app_config.dart';
class CookieManager{
  static Future<bool> isUserLoggedIn() async {
    // مسیر کوکی‌ها
    final dir = await getApplicationDocumentsDirectory();
    final cookieDir = join(dir.path, '.cookies');
    final cookieJar = PersistCookieJar(storage: FileStorage(cookieDir));

    // خواندن کوکی‌ها برای دامنه‌ی API
    final uri = Uri.parse(AppConfig.baseUrl);
    final cookies = await cookieJar.loadForRequest(uri);

    // بررسی وجود accessToken در بین کوکی‌ها
    final accessCookie = cookies.firstWhere(
          (c) => c.name == 'accessToken',
      orElse: () => Cookie('', ''),
    );

    // اگر accessToken موجود و مقدارش خالی نباشه → کاربر لاگین کرده
    return accessCookie.value.isNotEmpty;
  }
}