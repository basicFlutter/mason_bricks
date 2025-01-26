import 'package:logger/logger.dart';
import 'app_config.dart';
import 'error_handler/global_app_setup.dart';

import 'my_app.dart';

Logger logger = Logger();

void main() async {
  AppConfig.appFlavor = Flavor.production;
  GlobalAppSetup (child: MyApp());
}

