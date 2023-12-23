import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app_flavor.dart';
import 'bootstrap.dart';
import 'di/service_locator.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initializeFirebase();
  ServiceLocatorInitializer.initWithFlavor(AppFlavor.staging);
  

  bootstrap();
}

_initializeFirebase() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
