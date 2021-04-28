import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }
  Future<dynamic> navigateToWithArgs(String routeName,{Object arguments}) {
    return navigatorKey.currentState.pushNamed(routeName,arguments: arguments);
  }

  Future<dynamic> globalNavigateTo(String routeName, BuildContext context) {
    return Navigator.of(context).pushNamed(routeName);
  }

  Future<dynamic> globalNavigateToWithArgs(String routeName, BuildContext context,{Object arguments}) {
    return Navigator.of(context).pushNamed(routeName,arguments: arguments);
  }


  void goBack() {
    return navigatorKey.currentState.pop();
  }


}