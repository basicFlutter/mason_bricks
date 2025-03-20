import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import '../logger/app_logger.dart';
import '../secure_storage/secure_storage.dart';

class FirebaseConfig with AppLogger {
  FirebaseConfig();

  final SecureStorage _secureStorage = SecureStorage(); // استفاده از SecureStorage

  Future<String?> fetchToken() async {
    logger.w("Fetching Firebase Token");

    String? token;

    try {
      // مقداردهی اولیه Firebase
      await Firebase.initializeApp();

      // اشتراک در موضوع
      await FirebaseMessaging.instance.subscribeToTopic('news');

      // خواندن توکن از SecureStorage
      token = await _secureStorage.read('firebaseToken');
      logger.f(token);

      if (token == null || token.isEmpty) {
        // حذف توکن قدیمی و گرفتن توکن جدید
        await FirebaseMessaging.instance.deleteToken();
        token = await FirebaseMessaging.instance.getToken();
        logger.e(token);

        if (token != null) {
          // ذخیره توکن جدید در SecureStorage
          await _secureStorage.write('firebaseToken', token);
        }
      }
      // گوش دادن به نوتیفیکیشن‌ها
      listenOnNotifications();
      listenOnNotificationsOpenedApp();

      return token;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<bool> deleteFirebaseToken() async {
    try {
      // حذف توکن از SecureStorage
      await _secureStorage.delete('firebaseToken');

      // حذف توکن از Firebase Messaging
      await FirebaseMessaging.instance.deleteToken();

      String? newToken = await FirebaseMessaging.instance.getToken();
      logger.i(newToken);

      if (newToken != null) {
        // ذخیره توکن جدید در SecureStorage
        await _secureStorage.write('firebaseToken', newToken);

      }

      logger.i("Firebase token has been removed.");
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  void listenOnNotificationsOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      _handleBackgroundNotification(message);
    });
  }

  void listenOnNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      _handleBackgroundNotification(message);
    });
  }

  static Future<bool> _handleBackgroundNotification(RemoteMessage message) async {
    return AwesomeNotifications().createNotification(
      content: NotificationContent(
        actionType: ActionType.KeepOnTop,
        wakeUpScreen: true,
        id: 123,
        criticalAlert: true,
        channelKey: 'basic_channel',
        title: message.notification?.title ?? "",
        body: message.notification?.body ?? "",
        fullScreenIntent: true,
        payload: {"name": "FlutterCampus"},
      ),
    );
  }
}
