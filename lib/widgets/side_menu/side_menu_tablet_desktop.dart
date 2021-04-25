import 'package:dashboard/helpers/enumerators.dart';
import 'package:dashboard/locator.dart';
import 'package:dashboard/provider/app_provider.dart';
import 'package:dashboard/rounting/route_names.dart';
import 'package:dashboard/services/navigation_service.dart';
import 'package:dashboard/widgets/navbar/navbar_logo.dart';
import 'package:dashboard/widgets/side_menu/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenuTabletDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of<AppProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.green,
          gradient: LinearGradient(
            colors: [Colors.green, Colors.green.shade600],
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[200], offset: Offset(3, 5), blurRadius: 17)
          ]),
      width: 250,
      child: Container(
        child: Column(
          children: [
            NavBarLogo(),
            SideMenuItemDesktop(
              icon: Icons.dashboard,
              text: 'Dashboard',
              active: appProvider.currentPage == DisplayedPage.HOME,
              onTap: () {
                appProvider.changeCurrentPage(DisplayedPage.HOME);
                locator<NavigationService>().navigateTo(HomeRoute);
              },
            ),
            SideMenuItemDesktop(
              icon: Icons.person,
              text: 'Profile',
              active: appProvider.currentPage == DisplayedPage.USERS,
              onTap: () {
                appProvider.changeCurrentPage(DisplayedPage.USERS);

                locator<NavigationService>().navigateTo(UsersRoute);
              },
            ),
            SideMenuItemDesktop(
              icon: Icons.table_rows_outlined,
              text: 'Tables',
              active: appProvider.currentPage == DisplayedPage.ORDERS,
              onTap: () {
                appProvider.changeCurrentPage(DisplayedPage.ORDERS);
                locator<NavigationService>().navigateTo(OrdersRoute);
              },
            ),
            SideMenuItemDesktop(
              icon: Icons.map,
              text: 'Maps',
              active: appProvider.currentPage == DisplayedPage.PRODUCTS,
              onTap: () {
                appProvider.changeCurrentPage(DisplayedPage.PRODUCTS);
                locator<NavigationService>().navigateTo(ProductsRoute);
              },
            ),
            SideMenuItemDesktop(
              icon: Icons.category,
              text: 'Categories',
              active: appProvider.currentPage == DisplayedPage.CATEGORIES,
              onTap: () {
                appProvider.changeCurrentPage(DisplayedPage.PRODUCTS);
                locator<NavigationService>().navigateTo(ProductsRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
