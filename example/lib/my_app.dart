import 'library.dart';
import '/../core/theme/app_theme.dart';
import '/../core/theme/bloc/theme_bloc.dart';
import '/../core/theme/bloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = locator<AppNavigator>();
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final isDark = state is ThemeChanged ? state.isDark : false;
          return SafeArea(
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
                  darkTheme: AppTheme.darkTheme,
                  themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
                  navigatorKey: navigator.navigatorKey,
                  onGenerateRoute: navigator.onGenerateRoute,
                  initialRoute: navigator.initialRoute,
                );
              },
            ),
          );
        },
      ),
    );
  }
}