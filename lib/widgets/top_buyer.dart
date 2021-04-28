import 'package:flutter/material.dart';

import 'custom_text.dart';

class TopBuyerWidget extends StatelessWidget {
  String name;
  String orders;
  String ordersPrice;


  TopBuyerWidget(this.name, this.orders, this.ordersPrice);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('images/profile.jpg'),
      ),
      title: Text(name),
      subtitle: Text('${orders}, orders'),
      trailing: CustomText(
        text: '\$ ${ordersPrice}',
        color: Colors.green.shade800,
        weight: FontWeight.bold,
      ),
    );
  }
}
