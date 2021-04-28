import 'package:dashboard/models/UserDataProfile.dart';
import 'package:dashboard/models/orders.dart';
import 'package:dashboard/pages/usersorders/users_orders_provider.dart';
import 'package:dashboard/widgets/celles/order_table_cell.dart';
import 'package:dashboard/widgets/page_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UsersOrders extends StatefulWidget {
  UserDataProfile args;

  UsersOrders(this.args);

  @override
  _UsersOrdersState createState() => _UsersOrdersState();
}

class _UsersOrdersState extends State<UsersOrders> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = Provider.of<UsersOrdersProvider>(context, listen: false);
    provider.getOrders(widget.args.uid);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PageHeader(
            text: widget.args.name,
          ),
          Container(
            height: 0.9.sh,
            child: Card(
              elevation: 6.h,
              child: Column(children: [
                OrderTableCell("#", "User", "Description", "Status", "Type", "Date", "Complete Status"),
                buildListUsers(context)
              ],),
            ),
          )
        ],
      ),
    );
  }

  Widget buildListUsers(BuildContext context) {
    if (mounted && Provider.of<UsersOrdersProvider>(context).orders != null)
      return ListView.builder(
          itemCount: Provider.of<UsersOrdersProvider>(context).orders.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (_, index) => buildUerItem(context, index));
    else
      return Container();
  }

  Widget buildUerItem(BuildContext context, int index) {
    OrdersModel order = Provider.of<UsersOrdersProvider>(context).orders[index];
    DateTime dateTime = order.orderDate.toDate();
    return OrderTableCell(order.orderID, order.orderUserName, order.orderDescription, order.orderStatus, order.orderType, "${dateTime.year}-${dateTime.month}-${dateTime.day}", order.completeOrderCode.toString());
  }
}
