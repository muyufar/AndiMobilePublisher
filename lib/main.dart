import 'package:andipublisher/infrastructure/theme/theme_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'presentation/profile/controllers/profile.controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterDownloader.initialize();
  await GetStorage.init();

  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));

}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeData(),
      initialRoute: initialRoute,
      getPages: Nav.routes,
      
    );
  }
}
