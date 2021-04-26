import 'package:dashboard/helpers/reusable.dart';
import 'package:dashboard/widgets/celles/table_cell.dart';
import 'package:dashboard/widgets/charts/sales_chart.dart';
import 'package:dashboard/widgets/custom_text.dart';
import 'package:dashboard/widgets/financial_cards/dashboard_card.dart';
import 'package:dashboard/widgets/page_header.dart';
import 'package:dashboard/widgets/top_buyer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  title: "Sales",
                  value: "\$2000",
                  percent: 30,
                  better: true,
                ),
                flex: 1,
              ),
              Expanded(
                child: DashboardCard(
                  icon: Icons.stacked_bar_chart,
                  iconColor: Colors.orangeAccent,
                  title: "SUBSCRIPTIONS",
                  value: "200",
                  percent: 20,
                  better: false,
                ),
                flex: 1,
              ),
              Expanded(
                child: DashboardCard(
                  icon: Icons.pie_chart,
                  iconColor: Colors.blueAccent,
                  title: "Traffic",
                  value: "2000",
                  percent: 80,
                  better: true,
                ),
                flex: 1,
              ),
              Expanded(
                child: DashboardCard(
                  icon: Icons.height,
                  iconColor: Colors.red,
                  title: "ORGANIC TRAFFIC",
                  value: "300",
                  percent: 25,
                  better: true,
                ),
                flex: 1,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:4.w,top: 4.h,right: 4.w),
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
                          TopBuyerWidget(),
                          TopBuyerWidget(),
                          TopBuyerWidget(),
                          TopBuyerWidget(),
                          TopBuyerWidget(),
                          TopBuyerWidget(),
                          TopBuyerWidget(),
                          TopBuyerWidget(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(4.w),
                child: Card(
                  elevation: 6.h,
                  child: Column(
                    children: [
                      CustomTableCell(index: "#",first: "First Column", second: "Second Column",third: "Third Column",),
                      CustomTableCell(index: "1",first: "Cell 1", second: "Cell 2",third: "Cell 3",),
                      CustomTableCell(index: "2",first: "Cell 4", second: "Cell 5",third: "Cell 6",),
                      CustomTableCell(index: "3",first: "Cell 7", second: "Cell 8",third: "Cell 9",),
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
                      CustomTableCell(index: "#",first: "First Column", second: "Second Column",third: "Third Column",),
                      CustomTableCell(index: "1",first: "Cell 1", second: "Cell 2",third: "Cell 3",),
                      CustomTableCell(index: "2",first: "Cell 4", second: "Cell 5",third: "Cell 6",),
                      CustomTableCell(index: "3",first: "Cell 7", second: "Cell 8",third: "Cell 9",),
                    ],
                  ),
                ),
              ),
            )
          ],)
        ],
      ),
    );
  }
}
