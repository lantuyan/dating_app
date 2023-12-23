import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app_flavor.dart';
import 'bootstrap.dart';
import 'di/example/service_locator.dart';
import 'firebase_options.dart';
// 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ServiceLocatorInitializer.initWithFlavor(AppFlavor.staging);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // BindingBase.debugZoneErrorsAreFatal = true;
 BindingBase.debugZoneErrorsAreFatal = false;
  bootstrap();
}
