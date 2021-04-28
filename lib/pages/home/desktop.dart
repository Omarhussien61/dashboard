import 'package:dashboard/models/UserDataProfile.dart';
import 'package:dashboard/pages/home/desktop_provider.dart';
import 'package:dashboard/rounting/route_names.dart';
import 'package:dashboard/services/navigation_service.dart';
import 'package:dashboard/widgets/celles/table_cell.dart';
import 'package:dashboard/widgets/charts/sales_chart.dart';
import 'package:dashboard/widgets/custom_text.dart';
import 'package:dashboard/widgets/financial_cards/dashboard_card.dart';
import 'package:dashboard/widgets/page_header.dart';
import 'package:dashboard/widgets/top_buyer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class HomePageDesktop extends StatefulWidget {
  @override
  _HomePageDesktopState createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = Provider.of<DesktopProvider>(context, listen: false);
    provider.getOrders();
    // provider.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PageHeader(
              text: "DASHBOARD",
            ),
            // CardsList(),
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    icon: Icons.attach_money,
                    iconColor: Colors.lightBlue,
                    title: "Total income",
                    value: "\$ ${Provider.of<DesktopProvider>(context).price}",
                    subTitle:
                        "Total Earning is \$ ${Provider.of<DesktopProvider>(context).price}",
                    better: true,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: DashboardCard(
                    icon: Icons.attach_money,
                    iconColor: Colors.red,
                    title: "Total Lose",
                    value:
                        "\$ ${Provider.of<DesktopProvider>(context).loss_price}",
                    subTitle:
                        "Total Loss is \$ ${Provider.of<DesktopProvider>(context).loss_price}",
                    better: true,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: DashboardCard(
                    icon: Icons.stacked_bar_chart,
                    iconColor: Colors.orangeAccent,
                    title: "SUBSCRIPTIONS",
                    value: Provider.of<DesktopProvider>(context)
                        .users
                        .length
                        .toString(),
                    subTitle:
                        "Total Users are \$ ${Provider.of<DesktopProvider>(context).users.length.toString()}",
                    better: false,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: DashboardCard(
                    icon: Icons.pie_chart,
                    iconColor: Colors.blueAccent,
                    title: "Traffic",
                    value: Provider.of<DesktopProvider>(context)
                        .orders
                        .length
                        .toString(),
                    subTitle:
                        "Total Orders are \$ ${Provider.of<DesktopProvider>(context).orders.length.toString()}",
                    better: true,
                  ),
                  flex: 1,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.w, top: 4.h, right: 4.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(height: 0.6.sh, child: SalesChart()),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(4.w),
                      height: 0.6.sh,
                      child: Card(
                        elevation: 6.h,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                text: 'Top Buyers',
                                size: 16.sp,
                              ),
                            ),
                            buildListUsers(context)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(4.w),
                    child: Card(
                      elevation: 6.h,
                      child: Column(
                        children: [
                          CustomTableCell(
                            index: "#",
                            first: "First Column",
                            second: "Second Column",
                            third: "Third Column",
                          ),
                          CustomTableCell(
                            index: "1",
                            first: "Cell 1",
                            second: "Cell 2",
                            third: "Cell 3",
                          ),
                          CustomTableCell(
                            index: "2",
                            first: "Cell 4",
                            second: "Cell 5",
                            third: "Cell 6",
                          ),
                          CustomTableCell(
                            index: "3",
                            first: "Cell 7",
                            second: "Cell 8",
                            third: "Cell 9",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(4.w),
                    child: Card(
                      elevation: 6.h,
                      child: Column(
                        children: [
                          CustomTableCell(
                            index: "#",
                            first: "First Column",
                            second: "Second Column",
                            third: "Third Column",
                          ),
                          CustomTableCell(
                            index: "1",
                            first: "Cell 1",
                            second: "Cell 2",
                            third: "Cell 3",
                          ),
                          CustomTableCell(
                            index: "2",
                            first: "Cell 4",
                            second: "Cell 5",
                            third: "Cell 6",
                          ),
                          CustomTableCell(
                            index: "3",
                            first: "Cell 7",
                            second: "Cell 8",
                            third: "Cell 9",
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildListUsers(BuildContext context) {
    if (mounted && Provider.of<DesktopProvider>(context).users != null)
      return AspectRatio(
        aspectRatio: 4 / 2,
        child: ListView.builder(
            itemCount: Provider.of<DesktopProvider>(context).users.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (_, index) => buildUerItem(context, index)),
      );
    else
      return Container();
  }

  GestureDetector buildUerItem(BuildContext context, int index) {
    return GestureDetector(
            onTap: (){
              UserDataProfile currentUser = Provider.of<DesktopProvider>(context,listen: false).users[index];
              locator<NavigationService>().globalNavigateToWithArgs(UserOrders,context,arguments: currentUser);
            },
            child: TopBuyerWidget(
                Provider.of<DesktopProvider>(context).users[index].name,
                Provider.of<DesktopProvider>(context)
                    .users[index]
                    .ordersNum
                    .toString(),
                Provider.of<DesktopProvider>(context)
                    .users[index]
                    .totalOrdersPrice),
          );
  }
}
