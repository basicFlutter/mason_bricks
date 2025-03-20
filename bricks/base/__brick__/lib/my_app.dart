import 'core/language/language_state.dart';
import 'library.dart';
import '/../core/theme/app_theme.dart';
import '/../core/theme/bloc/theme_bloc.dart';
import '/../core/theme/bloc/theme_state.dart';
import '/../core/language/language_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = locator<AppNavigator>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => LanguageBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          final isDark = themeState is ThemeChanged ? themeState.isDark : false;
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, languageState) {
              return SafeArea(
                child: ScreenUtilInit(
                  designSize: const Size(390, (844 + 33.5)),
                  minTextAdapt: true,
                  splitScreenMode: false,
                  useInheritedMediaQuery: true,
                  builder: (context, child) {
                    return MaterialApp(
                      supportedLocales: languageState.supportedLocales,
                      localizationsDelegates: AppLocalizations.localizationsDelegates,
                      locale: languageState.currentLocale,
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
          );
        },
      ),
    );
  }
}