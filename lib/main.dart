import 'package:dashboard/helpers/costants.dart';
import 'package:dashboard/pages/home/desktop_provider.dart';
import 'package:dashboard/pages/login/phoneLogin.dart';
import 'package:dashboard/pages/usersorders/users_orders_provider.dart';
import 'package:dashboard/provider/app_provider.dart';
import 'package:dashboard/provider/auth.dart';
import 'package:dashboard/provider/tables.dart';
import 'package:dashboard/rounting/route_names.dart';
import 'package:dashboard/rounting/router.dart';
import 'package:dashboard/widgets/layout/layout.dart';
import 'package:dashboard/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helpers/reusable.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AppProvider.init()),
    ChangeNotifierProvider.value(value: AuthProvider.initialize()),
    ChangeNotifierProvider.value(value: TablesProvider.init()),
    ChangeNotifierProvider.value(value: DesktopProvider()),
    ChangeNotifierProvider.value(value: UsersOrdersProvider()),
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
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    initScreenDims(context);
    return FutureBuilder(
      // Initialize FlutterFire:
      future: initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Something went wrong")],
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print(authProvider.status.toString());
          switch (authProvider.status) {
            case Status.Uninitialized:
              return Loading();
            case Status.Unauthenticated:
            case Status.Authenticating:
              return PhonePage();
            case Status.Authenticated:
              return LayoutTemplate();
            default:
              return PhonePage();
          }
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
        );
      },
    );
  }
}
