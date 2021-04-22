import 'package:dashboard/pages/home/desktop.dart';
import 'package:dashboard/pages/home/tablet.dart';
import 'package:dashboard/pages/login/desktop.dart';

import 'package:dashboard/widgets/size_constraint.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class loginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPageDesktop();
  }
}
