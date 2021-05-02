import 'package:dashboard/helpers/enumerators.dart';
import 'package:dashboard/locator.dart';
import 'package:dashboard/provider/app_provider.dart';
import 'package:dashboard/provider/auth.dart';
import 'package:dashboard/rounting/route_names.dart';
import 'package:dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenuMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of<AppProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey[200], offset: Offset(3, 5), blurRadius: 17)
      ]),
      width: 60,
      child: Container(
        child: Column(
          children: [
            IconButton(
              icon: Icon(Icons.dashboard),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.table_rows_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.category),
              onPressed: () {
                appProvider.changeCurrentPage(DisplayedPage.PRODUCTS);
                locator<NavigationService>().navigateTo(ProductsRoute);
              },
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                authProvider.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
