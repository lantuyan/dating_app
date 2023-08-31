import 'package:flutter/material.dart';

import 'app_flavor.dart';
import 'bootstrap.dart';
import 'di/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocatorInitializer.initWithFlavor(AppFlavor.staging);

  bootstrap();
}
