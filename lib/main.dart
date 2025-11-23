import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartykids/view/splash_screen/splash_screen.dart';
import 'core/di/locator.dart';
import 'routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  
  setupLocator();

  // --- Hive Setup --- //
  var appDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDir.path);
  await Hive.openBox('settings');
  // ------------------ //

  runApp(SmartyKidsApp());
}

class SmartyKidsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'SmartyKids',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ComicNeue',
      ),
    );
  }
}
