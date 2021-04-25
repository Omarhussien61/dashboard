import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const PICTURE = "picture";
  static const PRICE = "price";
  static const DESCRIPTION = "description";
  static const CATEGORY = "category";
  static const FEATURED = "featured";
  static const QUANTITY = "quantity";
  static const BRAND = "brand";
  static const SALE = "sale";
  static const SIZES = "sizes";
  static const COLORS = "colors";

  String _id;
  String _name;
  String _picture;
  String _description;
  String _category;
  String _brand;
  int _quantity;
  int _price;
  bool _sale;
  bool _featured;
  List _colors;
  List _sizes;

  ProductModel(
      this._id,
      this._name,
      this._picture,
      this._description,
      this._category,
      this._brand,
      this._quantity,
      this._price,
      this._sale,
      this._featured,
      this._colors,
      this._sizes);

  String get id => _id;

  String get name => _name;

  String get picture => _picture;

  String get brand => _brand;

  String get category => _category;

  String get description => _description;

  int get quantity => _quantity;

  int get price => _price;

  bool get featured => _featured;

  bool get sale => _sale;

  List get colors => _colors;

  List get sizes => _sizes;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _brand = snapshot.data()[BRAND];
    _sale = snapshot.data()[SALE];
    _description = snapshot.data()[DESCRIPTION] ?? " ";
    _featured = snapshot.data()[FEATURED];
    _price = snapshot.data()[PRICE].floor();
    _category = snapshot.data()[CATEGORY];
    _colors = snapshot.data()[COLORS];
    _sizes = snapshot.data()[SIZES];
    _name = snapshot.data()[NAME];
    _picture = snapshot.data()[PICTURE];
    _quantity = snapshot.data()[QUANTITY];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ID] = _id;
    data[BRAND] = _brand;
    data[SALE] = _sale;
    data[DESCRIPTION] = _description;
    data[FEATURED] = _featured;
    data[PRICE] = _price;
    data[CATEGORY] = _category;
    data[COLORS] = _colors;
    data[SIZES] = _sizes;
    data[NAME] = _name;
    data[PICTURE] = _picture;
    data[QUANTITY] = _picture;
    return data;
  }
}
