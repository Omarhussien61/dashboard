import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/helpers/costants.dart';
import 'package:dashboard/models/UserDataProfile.dart';
import 'package:dashboard/models/orders.dart';

class ProductsServices {
  String ordersCollection = "orders";
  String usersCollection = "users";

  Future<List<OrdersModel>> getAllProducts() async =>
      firebaseFiretore.collection(ordersCollection).get().then((result) {
        List<OrdersModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(OrdersModel.fromSnapshot(product));
        }
        return products;
      });

  Future<List<UserDataProfile>> getAllUsers() async =>
      firebaseFiretore.collection(usersCollection).get().then((result) {
        List<UserDataProfile> users = [];
        for (DocumentSnapshot user in result.docs) {
          users.add(UserDataProfile.fromMap(user.data()));
        }
        return users;
      });

  void createProduct({OrdersModel product}) {
    firebaseFiretore
        .collection(ordersCollection)
        .doc(product.orderID)
        .set(product.toJson());
  }
}
