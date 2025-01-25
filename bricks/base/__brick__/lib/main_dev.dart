import 'package:logger/logger.dart';
import 'package:tmanagix/app_config.dart';
import 'package:tmanagix/error_handler/global_error_handler.dart';

import 'my_app.dart';

Logger logger = Logger();

void main() async {
  AppConfig.appFlavor = Flavor.development;
  GlobalErrorHandler(child: MyApp());
}


