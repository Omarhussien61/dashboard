import 'package:dashboard/main.dart';
import 'package:dashboard/models/UserDataProfile.dart';
import 'package:dashboard/pages/login/login.dart';
import 'package:dashboard/pages/orders/products_page.dart';
import 'package:dashboard/pages/registration/registration.dart';
import 'package:dashboard/pages/usersorders/users_orders.dart';
import 'package:dashboard/rounting/route_names.dart';
import 'package:dashboard/widgets/layout/layout.dart';
import 'package:flutter/material.dart';

import '../pages/home/home_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomePage());
    case LoginRoute:
      return _getPageRoute(loginPage());
    case ProductsRoute:
      return _getPageRoute(ProductsPage());
    case PhoneRoute:
      return _getPageRoute(RegistrationPage());
    case LayoutRoute:
      return _getPageRoute(LayoutTemplate());
    case PageControllerRoute:
      return _getPageRoute(AppPagesController());
    case UserOrders:
      final UserDataProfile args = settings.arguments as UserDataProfile;
      return _getPageRoute(UsersOrders(args));
    default:
      return _getPageRoute(HomePage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
