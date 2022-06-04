import 'package:flutter/widgets.dart';
import 'package:mycvfull_app/constants/controllers.dart';
import 'package:mycvfull_app/routing/router.dart';
import 'package:mycvfull_app/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: SobrePageRoute,
      onGenerateRoute: generateRoute,
    );
