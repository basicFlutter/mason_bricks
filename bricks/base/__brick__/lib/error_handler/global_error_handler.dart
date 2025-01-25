import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/data/network/api_provider.dart';
import '../core/firebase/notification_controller.dart';
import '../core/logger/app_logger.dart';
import '../core/service_locator.dart';

class GlobalErrorHandler with AppLogger {
  GlobalErrorHandler({
    required Widget child
}){
    if(kReleaseMode){
      ErrorWidget.builder = (_)=> Container(width: 100, height: 200, color: Colors.red, child: const Center(child: Text("error builder ro dorost kon"),),);
    }
      WidgetsFlutterBinding.ensureInitialized();
      String url = 'http://localhost:8080';
      init(child);

  }


  void init(Widget child) async{
    serviceLocator();
    WidgetsFlutterBinding.ensureInitialized();
    await _notificationConfig();
    await Firebase.initializeApp();


    ApiProvider().initLogger();
    await ScreenUtil.ensureScreenSize();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    runApp(child);

  }

  void _handleFlutterError(FlutterErrorDetails details) {
    if(kReleaseMode){
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }else{
      logger.e("error  ***************** ${details.exception}");
    }
  }

  Future<void> _notificationConfig() async{
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().initialize(
        '',
        [
          NotificationChannel(
              enableLights: true,
              enableVibration: true,
              vibrationPattern: highVibrationPattern,
              // defaultRingtoneType: DefaultRingtoneType,
              playSound: true,
              importance: NotificationImportance.Max,
              channelShowBadge: true,
              defaultRingtoneType: DefaultRingtoneType.Notification,
              criticalAlerts: true,
              // channelGroupKey: 'basic_channel_group',
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: Colors.indigo,
              ledColor: Colors.white)
        ],
        debug: false);

    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (ReceivedAction receivedAction) {
        return NotificationController.onActionReceivedMethod(receivedAction);
      },
      onNotificationCreatedMethod: (ReceivedNotification receivedNotification) {
        return NotificationController.onNotificationCreatedMethod(
            receivedNotification);
      },
      onNotificationDisplayedMethod: (ReceivedNotification receivedAction) {
        return NotificationController.onNotificationDisplayedMethod(
            receivedAction);
      },
    );
  }
}

StreamSocket streamSocket =StreamSocket();


class StreamSocket{
  final _socketResponse= StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose(){
    _socketResponse.close();
  }
}