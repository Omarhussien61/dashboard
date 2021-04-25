import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class PageHeader extends StatelessWidget {
  final String text;

  const PageHeader({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return      Row(
      children: [
        SizedBox(width: 30,),
        Padding(
          padding: EdgeInsets.only(top: 24.h,bottom: 8.h),
          child: CustomText(text: text, size: 40, weight: FontWeight.bold, color: Colors.grey,),
        ),
      ],
    );
  }
}
