import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app/app/router.gr.dart' as custom;
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: custom.Routes.startupViewRoute,
      onGenerateRoute: custom.Router().onGenerateRoute,
    );
  }
}
