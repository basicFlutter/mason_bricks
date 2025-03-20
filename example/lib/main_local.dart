import 'package:logger/logger.dart';
import 'core/global_app_setup/app_config.dart';
import 'core/global_app_setup/global_app_setup.dart';
import 'my_app.dart';

Logger logger = Logger();

void main() async {
  AppConfig.appFlavor = Flavor.local;
  GlobalAppSetup (child: MyApp());
}

