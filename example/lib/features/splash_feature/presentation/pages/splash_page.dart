import '../../../../library.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Center(
        child: Text(localizations.hello),
      ),
    );
  }
}
