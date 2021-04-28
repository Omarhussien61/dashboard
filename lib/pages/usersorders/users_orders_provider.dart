import 'package:dashboard/models/orders.dart';
import 'package:dashboard/services/orders.dart';
import 'package:flutter/foundation.dart';

class UsersOrdersProvider with ChangeNotifier {
  bool _isFetching = false;

  bool get isFetching => _isFetching;

  void _toggleFetching() {
    _isFetching = !_isFetching;
    notifyListeners();
  }

  List<OrdersModel> orders = [];

  void setOrdersList(List<OrdersModel> value) {
    orders = value;
    notifyListeners();
  }

  Future getOrders(String uid) async {
    _toggleFetching();
    orders.clear();
    List<OrdersModel> requestOrdersList = await ProductsServices().getAllProducts();
    List<OrdersModel> tempList = [];
    requestOrdersList.forEach((element) {
      print("User Id :"+uid + element.orderUserID);
      if(uid == element.orderUserID)
        tempList.add(element);
    });
    setOrdersList(tempList);
    _toggleFetching();
  }
}
