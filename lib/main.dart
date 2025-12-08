import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartykids/routing/navigation_services.dart';
import 'package:smartykids/data/di/locator.dart';
import 'package:smartykids/utils/custom_screen_util.dart';

import 'data/storage/storage_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  
  Locator.registerDi();

  // --- Hive Setup : START --- //
  var appDir = await getApplicationDocumentsDirectory();
  debugPrint('appDir: ${appDir.path}');
  Hive.init(appDir.path);
  await Hive.openBox(box);
  //  --- Hive Setup : END --- //

  runApp(SmartyKidsApp());
}

class SmartyKidsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        ResponsiveSizing().init(context);
        // phoneHasNotch = MediaQuery.of(context).padding.top > 24.0;
        return child!;
      },
    );
  }
}
