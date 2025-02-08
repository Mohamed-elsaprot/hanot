import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

abstract class NavigationItem {
  static CustomNavigationBarItem item({required IconData icon,required String title}){
    return CustomNavigationBarItem(
      icon: Center(
        child: Icon(icon,size: 24,color: Colors.white38,),
      ),
      selectedIcon: Center(
        child: Icon(icon,size: 24,color: Colors.white,),
      ),
    );
  }
}