import 'library.dart';

class MyApp extends StatelessWidget {
  ThemeMode themeMode = ThemeMode.light;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = locator<AppNavigator>();
    return
      SafeArea(
        child: ScreenUtilInit(
          designSize: const Size(390, (844 + 33.5)),
          minTextAdapt: true,
          splitScreenMode: false,
          useInheritedMediaQuery: true,
          builder: (context, child) {
            return MaterialApp(
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              locale: const Locale("fa"),
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.lightTheme,
              themeMode: themeMode,
              navigatorKey: navigator.navigatorKey,
              onGenerateRoute: navigator.onGenerateRoute,
              initialRoute: navigator.initialRoute,
            );
          },
          // child: const LoginPage(),
        ),
      );
  }
}