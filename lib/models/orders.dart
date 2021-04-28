import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersModel {
  static const ID = "orderID";
  static const ORDERDATA = "orderDate";
  static const SelectedDateTime = "selectedDateTime";
  static const OrderType = "orderType";

  static const OrderStatus = "orderStatus";
  static const ShippingAddress = "shippingAddress";
  static const OrderServiceProvider = "orderServiceProvider";

  static const OrderServiceProviderName = "orderServiceProviderName";

  static const OrderUserName = "orderUserName";
  static const OrderUserPhone = "orderUserPhone";
  static const Order = "order";

  static const LocationLongitude = "locationLongitude";
  static const LocationLatitude = "locationLatitude";
  static const OrderDescription = "orderDescription";

  static const OrderRegion = "orderRegion";
  static const OrderUserID = "orderUserID";
  static const OrderPrice = "orderPrice";
  static const OrderDetailedStatus = "orderDetailedStatus";
  static const OrderTimeline = "orderTimeline";
  static const CompleteOrderCode = "completeOrderCode";

  String orderID;
  Timestamp orderDate;
  Timestamp selectedDateTime;
  String orderType;

  String orderStatus;
  String shippingAddress;
  String orderServiceProvider;

  String orderServiceProviderName;
  String orderUserName;
  String orderUserPhone;
  List<dynamic> order;

  double locationLongitude;
  double locationLatitude;

  String orderDescription;
  String orderRegion;
  String orderUserID;
  String orderPrice;
  String orderDetailedStatus;
  List<dynamic> orderTimeline;
  int completeOrderCode;

  OrdersModel(
      {this.orderID,
      this.orderDate,
      this.selectedDateTime,
      this.orderType,
      this.orderStatus,
      this.shippingAddress,
      this.orderServiceProvider,
      this.orderServiceProviderName,
      this.orderUserName,
      this.orderUserPhone,
      this.order,
      this.locationLongitude,
      this.locationLatitude,
      this.orderDescription,
      this.orderRegion,
      this.orderUserID,
      this.orderPrice,
      this.orderDetailedStatus,
      this.orderTimeline,
      this.completeOrderCode});

  OrdersModel.fromSnapshot(DocumentSnapshot snapshot) {
    orderID = snapshot.data()[ID];
    orderUserName = snapshot.data()[OrderUserName];
    orderUserPhone = snapshot.data()[OrderUserPhone];
    orderStatus = snapshot.data()[OrderStatus] ?? " ";
    orderServiceProvider = snapshot.data()[OrderServiceProvider];
    orderType = snapshot.data()[OrderType];
    shippingAddress = snapshot.data()[ShippingAddress];
    orderRegion = snapshot.data()[OrderRegion];
    order = snapshot.data()[Order];
    orderDate = snapshot.data()[ORDERDATA];
    selectedDateTime = snapshot.data()[SelectedDateTime];
    orderServiceProviderName = snapshot.data()[OrderServiceProviderName];
    locationLongitude = snapshot.data()[LocationLongitude];
    locationLatitude = snapshot.data()[LocationLatitude];
    orderRegion = snapshot.data()[OrderRegion];
    orderUserID = snapshot.data()[OrderUserID];
    orderPrice = snapshot.data()[OrderPrice];
    orderDetailedStatus = snapshot.data()[OrderDetailedStatus];
    orderTimeline = snapshot.data()[OrderTimeline];
    completeOrderCode = snapshot.data()[CompleteOrderCode];
    orderDescription = snapshot.data()[OrderDescription];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ID] = orderID;
    data[OrderUserName] = OrderUserName;
    data[OrderUserPhone] = OrderUserPhone;
    data[OrderStatus] = OrderStatus;
    data[OrderServiceProvider] = OrderServiceProvider;
    data[OrderType] = OrderType;
    data[ShippingAddress] = shippingAddress;
    data[OrderRegion] = orderRegion;
    data[Order] = order;
    data[ORDERDATA] = orderDate;
    data[SelectedDateTime] = selectedDateTime;
    data[OrderServiceProviderName] = orderServiceProviderName;
    data[LocationLatitude] = locationLatitude;
    data[LocationLongitude] = LocationLongitude;

    data[OrderUserID] = orderUserID;
    data[OrderPrice] = orderPrice;
    data[OrderDetailedStatus] = orderDetailedStatus;
    data[OrderTimeline] = orderTimeline;
    data[CompleteOrderCode] = completeOrderCode;
    data[OrderDescription] = orderDescription;

    return data;
  }
}
