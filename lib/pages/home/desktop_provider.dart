import 'package:dashboard/models/UserDataProfile.dart';
import 'package:dashboard/models/orders.dart';
import 'package:dashboard/services/orders.dart';
import 'package:flutter/foundation.dart';

class DesktopProvider with ChangeNotifier {
  bool _isFetching = false;
  double _price = 0.0;
  double _loss_price = 0.0;

  bool get isFetching => _isFetching;

  void _toggleFetching() {
    _isFetching = !_isFetching;
    notifyListeners();
  }

  List<OrdersModel> orders = [];
  List<UserDataProfile> users = [];

  double get price => _price;
  double get loss_price => _loss_price;

  void setOrdersList(List<OrdersModel> value) {
    orders = value;
    notifyListeners();
  }

  void setUsersList(List<UserDataProfile> value) {
    users = value;
    notifyListeners();
  }

  Future getUsers() async {
    users.clear();
    setUsersList(await ProductsServices().getAllUsers());
    print("Users "+users[0].totalOrdersPrice);
    notifyListeners();
  }

  Future getOrders() async {
    _toggleFetching();

    orders.clear();
    setOrdersList(await ProductsServices().getAllProducts());
    getUsers();
    double localPrice = 0.0;
    double localLoss = 0.0;
    orders.forEach((element) {
      if (element.completeOrderCode == 1)
        localPrice = localPrice + double.parse(element.orderPrice);
      else
        localLoss = localLoss + double.parse(element.orderPrice);
    });
    _price = localPrice;
    _loss_price = localLoss;
    _toggleFetching();
  }
}
