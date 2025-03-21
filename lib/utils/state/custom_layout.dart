import 'package:flutter/material.dart';
import 'package:portfolio/utils/state/custom_state.dart';

class CustomLayout extends CustomState {
  final Widget mobile, tablet, web;

  const CustomLayout({ super.key, required this.mobile, required this.tablet, required this.web });

  @override
  Widget execute(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth >= 1200) { return web; }
      else if(constraints.maxWidth >= 650 && constraints.maxWidth < 1100) { return tablet; }
      else { return mobile; }
    });
  }
}