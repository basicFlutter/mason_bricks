import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


import '../logger/app_logger.dart';

class AppNavigator with AppLogger {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get state => navigatorKey.currentState!;
  /// TODO : create splash page
  final initialRoute = SplashPage.route;

  Route? onGenerateRoute(RouteSettings settings) {
    return PageTransition(
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 200),
        child: screen
    );
  }


  Future<T?> to<T>(Widget destination)  {
    logger.d("Navigate to $destination");
    return  state.push(MaterialPageRoute(builder: (_)=>destination));
  }

  back<T>(dynamic result) {
    state.pop(result);
  }

  Future<T?> off<T>(Widget destination) {
    logger.d("Navigate to $destination");
    return state.pushReplacement(MaterialPageRoute(builder: (_)=>destination));
  }

}

class CustomRouteInformation extends RouteInformation {
  final String? myProperty;
  CustomRouteInformation({
    required this.myProperty,
    super.location,
    super.state,
  });
}
