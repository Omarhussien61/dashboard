import 'package:dashboard/helpers/enumerators.dart';
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  DisplayedPage currentPage;
  double revenue = 0;

  AppProvider.init() {
    _getRevenue();
    changeCurrentPage(DisplayedPage.HOME);
  }

  changeCurrentPage(DisplayedPage newPage) {
    currentPage = newPage;
    notifyListeners();
  }

  void _getRevenue() async {}
}
