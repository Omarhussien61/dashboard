import 'package:dashboard/pages/home/home_page.dart';
import 'package:dashboard/provider/app_provider.dart';
import 'package:dashboard/rounting/route_names.dart';
import 'package:dashboard/rounting/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AppProvider.init()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: generateRoute,
      initialRoute: PageControllerRoute,
    );
  }
}

class AppPagesController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}
