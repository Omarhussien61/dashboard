import 'package:dashboard/helpers/reusable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DashboardCard extends StatelessWidget {
  IconData icon;
  Color iconColor;
  String title;
  String subTitle;
  String value;
  double percent;
  bool better;


  DashboardCard(
      {this.icon,
      this.iconColor,
      this.title,
      this.subTitle,
      this.value,
      this.percent,
      this.better});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.only(top: 26.h,right: 4.w,left: 4.w),
          elevation: 6.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.w,right: 2.w,top: 4.h),
                      child: Text(title,style: TextStyle(fontSize: 14.sp,color: Colors.grey),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2.w,right: 2.w,top: 4.h),
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top:8.h,right: 2.w,left: 2.w),
                    //   child: LinearPercentIndicator(
                    //     backgroundColor: Colors.grey.withOpacity(0.2),
                    //     progressColor: better ? Colors.lightBlue:Colors.black38,
                    //     lineHeight: 12.h,
                    //     percent: percent/100,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.w,right: 2.w,bottom: 4.h),
                child: Text(subTitle,style: TextStyle(fontSize: 12.sp,color: better ? Colors.lightBlue:Colors.grey)),
              )
            ],
          ),
        ),
        Card(margin:EdgeInsets.only(left: 8.w,right: 8.w),elevation: 6.h,child: Container(width: 16.w,height:16.w,child: Icon(icon,color: Colors.white,)),color: iconColor,),
      ],
    );
  }
}
