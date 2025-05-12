import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../logger/app_logger.dart';
import '../../features/splash_feature/presentation/pages/splash_page.dart';

class AppNavigator with AppLogger {
  static final AppNavigator _instance = AppNavigator._internal();
  factory AppNavigator() => _instance;
  AppNavigator._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  NavigatorState get state => navigatorKey.currentState!;
  ScaffoldMessengerState get scaffoldState =>
      scaffoldMessengerKey.currentState!;

  /// TODO : create splash page
  final initialRoute = SplashPage.route;
  Widget screen = SplashPage();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.route:
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          child: SplashPage(),
        );
      default:
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          child: screen,
        );
    }
  }

  // Basic Navigation Methods
  Future<T?> to<T>(Widget destination, {String? name}) {
    logger.d("Navigate to $destination");
    return state.push(
      MaterialPageRoute(
        builder: (_) => destination,
        settings: RouteSettings(name: name),
      ),
    );
  }

  Future<T?> toNamed<T>(String routeName, {Object? arguments}) {
    logger.d("Navigate to named route: $routeName");
    return state.pushNamed(routeName, arguments: arguments);
  }

  Future<T?> off<T>(Widget destination, {String? name}) {
    logger.d("Navigate to $destination and remove previous");
    return state.pushReplacement(
      MaterialPageRoute(
        builder: (_) => destination,
        settings: RouteSettings(name: name),
      ),
    );
  }

  Future<T?> offNamed<T>(String routeName, {Object? arguments}) {
    logger.d("Navigate to named route: $routeName and remove previous");
    return state.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<T?> offAll<T>(Widget destination, {String? name}) {
    logger.d("Navigate to $destination and remove all previous");
    return state.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => destination,
        settings: RouteSettings(name: name),
      ),
          (route) => false,
    );
  }

  Future<T?> offAllNamed<T>(String routeName, {Object? arguments}) {
    logger.d("Navigate to named route: $routeName and remove all previous");
    return state.pushNamedAndRemoveUntil(
      routeName,
          (route) => false,
      arguments: arguments,
    );
  }

  void back<T>([T? result]) {
    logger.d("Navigate back");
    state.pop(result);
  }

  bool canPop() {
    return state.canPop();
  }

  // Web Navigation Methods
  void setUrl(String url) {
    logger.d("Set URL to: $url");
    // Implement web URL handling here
  }

  String? getCurrentUrl() {
    // Implement getting current URL here
    return null;
  }

  // Snackbar Methods
  void showSnackBar(String message, {Duration? duration}) {
    scaffoldState.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration ?? const Duration(seconds: 2),
      ),
    );
  }

  // Dialog Methods
  Future<T?> showDialog<T>({
    required Widget child,
    bool barrierDismissible = true,
  }) {
    return state.push<T>(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: barrierDismissible,
        pageBuilder: (context, animation, secondaryAnimation) => child,
      ),
    );
  }

  // Bottom Sheet Methods
  Future<T?> showBottomSheet<T>({
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return state.push<T>(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: isDismissible,
        pageBuilder: (context, animation, secondaryAnimation) => child,
      ),
    );
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
