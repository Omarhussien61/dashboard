import 'package:dashboard/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CustomTableCell extends StatelessWidget {
  String index;
  String first;
  String second;
  String third;


  CustomTableCell({this.index, this.first, this.second, this.third});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(4.w),
              child: CustomText(text: index),
            ),
            Expanded(child: Padding(
              padding: EdgeInsets.all(4.w),
              child: CustomText(text:first),
            ),flex: 1,),
            Expanded(child: Padding(
              padding: EdgeInsets.all(4.w),
              child: CustomText(text:second),
            ),flex: 1,),
            Expanded(child: Padding(
              padding: EdgeInsets.all(4.w),
              child: CustomText(text:third),
            ),flex: 1,),
          ],
        ),
        Container(width: double.infinity,color: Colors.grey.withOpacity(0.2),height: 1,)
      ],
    );
  }
}
