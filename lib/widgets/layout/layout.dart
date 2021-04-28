import 'package:dashboard/helpers/reusable.dart';
import 'package:dashboard/pages/home/desktop.dart';
import 'package:dashboard/pages/home/desktop_provider.dart';
import 'package:dashboard/widgets/side_menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navbar/navigation_bar.dart';

class LayoutTemplate extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      drawer: Container(
        color: Colors.white,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text("abc@gmail.com"),
              accountName: Text("Santos Enoque"),
            ),
            ListTile(
              title: Text("Lessons"),
              leading: Icon(Icons.book),
            )
          ],
        ),
      ),
      body: Row(
        children: [
          SideMenu(),
          Expanded(
            child: Column(
              children: [
                NavigationBar(),
                Expanded(
                  child: HomePageDesktop(),
                  flex: 1,
                  // child: Navigator(
                  //   key: locator<NavigationService>().navigatorKey,
                  //   onGenerateRoute: generateRoute,
                  //   initialRoute: HomeRoute,
                  // ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
