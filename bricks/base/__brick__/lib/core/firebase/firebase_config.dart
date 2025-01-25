import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main_prod.dart';
import '../constants/constants.dart';

class FirebaseConfig {
  FirebaseConfig();
  late SharedPreferences sp;


  Future<String?> fetchToken() async{


    logger.w("Fetch ّFirebase Token");

    String? token;
    sp = await SharedPreferences.getInstance();
    try{
      await Firebase.initializeApp();

      // Subscribe to topic
      await FirebaseMessaging.instance.subscribeToTopic('news');

      token =  sp.getString("firebaseToken");
      logger.f(token);
      if( token== null || token == "") {
        await FirebaseMessaging.instance.deleteToken().then((value) async {
          token = await FirebaseMessaging.instance.getToken();
          logger.e(token);
          if (token != null) {
            await sp.setString('firebaseToken', token!);
          }

        });
      }

      Constants.firebaseToken = token ??"";

      listenOnNotifications();
      listenOnNotificationsOpenedApp();

      return token;

    }catch (e){

      logger.w(e);

    }
    return token;
    // Isolate.exit(resultPort, token);
  }

  Future<bool> deleteFirebaseToken()async{
    String? token ;

    final sp = await SharedPreferences.getInstance();
    await sp.remove('token');
    if(sp.getString("firebaseToken") != null && sp.getString("firebaseToken") != ""){
      await FirebaseMessaging.instance.deleteToken().then((value) async{
        token = await FirebaseMessaging.instance.getToken();
        logger.i(token);
        if (token != null) {
          await sp.setString('firebaseToken', token!);
        }
        Constants.firebaseToken = token ??"";
      });
    }
    logger.e("firebase token is removed");
    return true;
  }


  void listenOnNotificationsOpenedApp() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async{
      _backgroundNotification(message);
    });
  }

  void listenOnNotifications() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async{
      _backgroundNotification(message);
    });

  }

  static Future<bool> _backgroundNotification(RemoteMessage newChat)async {


    return AwesomeNotifications().createNotification(
      content: NotificationContent(

        // badge: state.notificationCounter!,
        actionType: ActionType.KeepOnTop,
        wakeUpScreen: true,
        id: 123,
        criticalAlert: true,
        channelKey: 'basic_channel',
        title: newChat.notification?.title??"" ,
        body: newChat.notification?.body??"",
        fullScreenIntent: true,
        payload: {"name": "FlutterCampus"},

      ),


    );

  }


}