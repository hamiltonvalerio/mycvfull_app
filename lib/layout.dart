import 'package:flutter/material.dart';
import 'package:mycvfull_app/helpers/responsiveness.dart';
import 'package:mycvfull_app/widgets/large_screen.dart';
import 'package:mycvfull_app/widgets/medium_screen.dart';
import 'package:mycvfull_app/widgets/side_menu.dart';
import 'package:mycvfull_app/widgets/small_screen.dart';
import 'package:mycvfull_app/widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(
        child: SideMenu(),
      ),
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
        mediumScreen: MediumScreen(),
      ),
    );
  }
}
