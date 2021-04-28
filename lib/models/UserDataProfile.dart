class UserDataProfile {
  String name;
  String phone;
  String email;
  String profilePhoto;
  String totalOrdersPrice;
  int ordersNum;
  String region;
  String userType;
  String uid;

  UserDataProfile.fromMap(Map<String, dynamic> data) {
    uid = data["uid"];
    name = data["name"];
    phone = data["phone"];
    email = data["email"];
    ordersNum = data["ordersNum"];
    profilePhoto = data["profilePhoto"];
    totalOrdersPrice = data["totalOrdersPrice"];
    region = data["region"];
    userType = data["userType"];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phone': phone,
      'email': email,
      'ordersNum': ordersNum,
      'profilePhoto': profilePhoto,
      'totalOrdersPrice': profilePhoto,
      'region': region,
      'userType': userType,
    };
  }
}