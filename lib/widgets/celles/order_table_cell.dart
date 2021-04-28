import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_text.dart';

class OrderTableCell extends StatelessWidget {
  String id;
  String orderUserName;
  String orderDescription;
  String orderStatus;
  String orderType;
  String orderDate;
  String completeOrderCode;

  OrderTableCell(this.id, this.orderUserName, this.orderDescription,
      this.orderStatus, this.orderType, this.orderDate, this.completeOrderCode);

  @override
  Widget build(BuildContext context) {
    getStatus();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(4.w),
              child: CustomText(text: id),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: CustomText(text: orderUserName),
              ),
              flex: 1,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: CustomText(text: orderDescription),
              ),
              flex: 1,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: CustomText(text: orderStatus),
              ),
              flex: 1,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: CustomText(text: orderType),
              ),
              flex: 1,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: CustomText(text: orderDate),
              ),
              flex: 1,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: CustomText(text: getStatus()),
              ),
              flex: 1,
            ),
          ],
        ),
        Container(
          width: double.infinity,
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        )
      ],
    );
  }

  String getStatus() {
    switch (completeOrderCode) {
      case "0":
        return "New";
        break;
      case "1":
        return "Pending";
        break;
      case "2":
        return "Approved";
        break;
      case "3":
        return "Finished";
        break;
      default:
        return "Status";
    }
  }
}
