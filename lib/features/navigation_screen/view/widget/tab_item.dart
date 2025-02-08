import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const TabItem({Key? key, required this.iconData, required this.title}) : super(key: key);
  final IconData iconData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Tab(icon: Icon(iconData),);
    // return Tab(icon: Icon(iconData),text: title,);
  }
}
