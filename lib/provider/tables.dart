import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/models/orders.dart';
import 'package:dashboard/models/user.dart';
import 'package:dashboard/services/orders.dart';
import 'package:dashboard/services/user.dart';
import 'package:flutter/material.dart';
import 'package:responsive_table/DatatableHeader.dart';

class TablesProvider with ChangeNotifier {
  // ANCHOR table headers
  List<DatatableHeader> usersTableHeader = [
    DatatableHeader(
        text: "ID",
        value: "id",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Name",
        value: "name",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Email",
        value: "email",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
  ];

  List<DatatableHeader> ordersTableHeader = [
    DatatableHeader(
        text: "ID",
        value: "id",
        show: false,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "User Id",
        value: "userId",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Description",
        value: "description",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Created At",
        value: "createdAt",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Total",
        value: "total",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
  ];

  List<DatatableHeader> productsTableHeader = [
    DatatableHeader(
        text: "ID",
        value: "id",
        show: false,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "orderID",
        value: "orderID",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Description",
        value: "Description",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Provider Name",
        value: "ServiceProviderName",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Status",
        value: "Status",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Sizes",
        value: "sizes",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Shipping Address",
        value: "shippingAddress",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "order Provider",
        value: "orderServiceProvider",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "User Name",
        value: "UserName",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "User Phone",
        value: "UserPhone",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
  ];

  List<int> perPages = [5, 10, 15, 100];
  int total = 100;
  int currentPerPage;
  int currentPage = 1;
  bool isSearch = false;
  List<Map<String, dynamic>> usersTableSource = List<Map<String, dynamic>>();
  List<Map<String, dynamic>> ordersTableSource = List<Map<String, dynamic>>();
  List<Map<String, dynamic>> productsTableSource = List<Map<String, dynamic>>();
  List<Map<String, dynamic>> categoriesTableSource =
      List<Map<String, dynamic>>();
  List<Map<String, dynamic>> brandsTableSource = List<Map<String, dynamic>>();

  List<Map<String, dynamic>> selecteds = List<Map<String, dynamic>>();
  String selectableKey = "id";

  String sortColumn;
  bool sortAscending = true;
  bool isLoading = true;
  bool showSelect = true;

  UserServices _userServices = UserServices();
  List<UserModel> _users = <UserModel>[];
  List<UserModel> get users => _users;
  OrdersModel productModel = OrdersModel(
      completeOrderCode: 1,
      locationLatitude: 1.2,
      locationLongitude: 1.3,
      order: [],
      orderDate: Timestamp(22, 22),
      orderDescription: 'f',
      orderDetailedStatus: 's',
      orderID: 's',
      orderRegion: 's',
      orderServiceProvider: 's',
      orderServiceProviderName: 's',
      orderStatus: 'f',
      orderTimeline: [],
      orderType: 's',
      orderUserID: 's',
      orderPrice: '100',
      orderUserName: 'e',
      orderUserPhone: 'ff',
      selectedDateTime: Timestamp(22, 22),
      shippingAddress: 'ddd');
  ProductsServices _productsServices = ProductsServices();
  List<OrdersModel> _products = <OrdersModel>[];
  List<OrdersModel> get products => _products;

  Future _loadFromFirebase() async {
    _users = await _userServices.getAllUsers();
    _products = await _productsServices.getAllProducts();
  }

  List<Map<String, dynamic>> _getUsersData() {
    isLoading = true;
    notifyListeners();
    List<Map<String, dynamic>> temps = List<Map<String, dynamic>>();
    var i = _users.length;
    print(i);
    for (UserModel userData in _users) {
      temps.add({
        "id": userData.id,
        "email": userData.email,
        "name": userData.name,
      });
      i++;
    }
    isLoading = false;
    notifyListeners();
    return temps;
  }

  List<Map<String, dynamic>> _getProductsData() {
    List<Map<String, dynamic>> temps = List<Map<String, dynamic>>();
    for (OrdersModel product in _products) {
      temps.add({
        "orderID": product.orderID,
        "Description": product.orderDescription,
        "ServiceProviderName": product.orderServiceProviderName,
        "Status": product.orderStatus,
        "orderServiceProvider": product.orderServiceProvider,
        "shippingAddress": product.shippingAddress,
        "orderRegion": product.orderRegion,
        "UserName": product.orderUserName,
        "UserPhone": product.orderUserPhone,
        "UserID": "\$${product.orderUserID}",
      });
    }
    return temps;
  }

  Createproduct() async {
    try {
      notifyListeners();

      _productsServices.createProduct(product: productModel);
    } catch (e) {
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  _initData() async {
    isLoading = true;
    notifyListeners();
    await _loadFromFirebase();
    usersTableSource.addAll(_getUsersData());
    productsTableSource.addAll(_getProductsData());
    isLoading = false;
    notifyListeners();
  }

  onSort(dynamic value) {
    sortColumn = value;
    sortAscending = !sortAscending;
    if (sortAscending) {
      usersTableSource
          .sort((a, b) => b["$sortColumn"].compareTo(a["$sortColumn"]));
    } else {
      usersTableSource
          .sort((a, b) => a["$sortColumn"].compareTo(b["$sortColumn"]));
    }
    notifyListeners();
  }

  onSelected(bool value, Map<String, dynamic> item) {
    print("$value  $item ");
    if (value) {
      selecteds.add(item);
    } else {
      selecteds.removeAt(selecteds.indexOf(item));
    }
    notifyListeners();
  }

  onSelectAll(bool value) {
    if (value) {
      selecteds = usersTableSource.map((entry) => entry).toList().cast();
    } else {
      selecteds.clear();
    }
    notifyListeners();
  }

  onChanged(int value) {
    currentPerPage = value;
    notifyListeners();
  }

  previous() {
    currentPage = currentPage >= 2 ? currentPage - 1 : 1;
    notifyListeners();
  }

  next() {
    currentPage++;
    notifyListeners();
  }

  TablesProvider.init() {
    _initData();
  }
}
