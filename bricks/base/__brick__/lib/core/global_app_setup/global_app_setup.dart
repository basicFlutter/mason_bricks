import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/network/api_provider.dart';
import '../firebase/notification_controller.dart';
import '../logger/app_logger.dart';
import '../service_locator.dart';

class GlobalAppSetup  with AppLogger {
  GlobalAppSetup ({
    required Widget child
}){
    if(kReleaseMode){
      ErrorWidget.builder = (_)=> Container(width: 100, height: 200, color: Colors.red, child: const Center(child: Text("custom error builder"),),);
    }
      WidgetsFlutterBinding.ensureInitialized();

      init(child);

  }


  void init(Widget child) async{
    serviceLocator();
    WidgetsFlutterBinding.ensureInitialized();

    ///for firebase
    // final firebaseConfig = FirebaseConfig();
    // // گرفتن توکن Firebase
    // final token = await firebaseConfig.fetchToken();
    // logger.i('Firebase Token: $token');
    //
    // // حذف توکن
    // final result = await firebaseConfig.deleteFirebaseToken();
    // logger.i('Token Deleted: $result');

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

}
