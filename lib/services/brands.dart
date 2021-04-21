import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/helpers/costants.dart';
import 'package:dashboard/models/brands.dart';

class BrandsServices {
  String collection = "brands";

  Future<List<BrandModel>> getAll() async =>
      firebaseFiretore.collection(collection).get().then((result) {
        List<BrandModel> brands = [];
        for (DocumentSnapshot brand in result.docs) {
          brands.add(BrandModel.fromSnapshot(brand));
        }
        return brands;
      });
}
