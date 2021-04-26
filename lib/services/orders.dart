import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/helpers/costants.dart';
import 'package:dashboard/models/orders.dart';

class ProductsServices {
  String collection = "orders";

  Future<List<OrdersModel>> getAllProducts() async =>
      firebaseFiretore.collection(collection).get().then((result) {
        List<OrdersModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(OrdersModel.fromSnapshot(product));
        }
        return products;
      });

  void createProduct({OrdersModel product}) {
    firebaseFiretore
        .collection(collection)
        .doc(product.orderID)
        .set(product.toJson());
  }
}
