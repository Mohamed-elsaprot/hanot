import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cart/manager/cart_cubit/cart_cubit.dart';
import '../../../cart/manager/cart_cubit/cart_state.dart';

abstract class CartItemNav {
  static CustomNavigationBarItem cartTab(BuildContext context){
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return CustomNavigationBarItem(
      icon:  Center(
        child: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
          return Tab(
            // text: textsMap['mobile_cart'],
            icon: cartCubit.cartProductsList.isNotEmpty
                ? badges.Badge(
                badgeContent: Text(cartCubit.cartLen.toString(), style: const TextStyle(color: Colors.white, fontSize: 14),),
                position: badges.BadgePosition.custom(end: 14, bottom: 7,),
                badgeStyle: badges.BadgeStyle(
                  padding: EdgeInsets.all(4.4.sp),
                  badgeColor: Colors.red,
                ),
                child: const Icon(Icons.shopping_cart_outlined,size: 24,))
                : const Icon(Icons.shopping_cart_outlined,size: 24),
          );
        }),
      ),
    );
  }
}