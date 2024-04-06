import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';
import '../../../cart/manager/cart_cubit/cart_cubit.dart';
import '../../../cart/manager/cart_cubit/cart_state.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit,CartState>(builder: (context,state){
      return Tab(icon:
      cartCubit.cartProductsList.isNotEmpty? badges.Badge(
          badgeContent: Text(
            cartCubit.cartLen.toString(),
            style: const TextStyle(color: Colors.white,fontSize: 14),
          ),
          position: badges.BadgePosition.custom(end: 14, bottom: 7,),
          badgeStyle: badges.BadgeStyle(
            padding: EdgeInsets.all(4.4.sp),
            badgeColor: Colors.red,
          ),
          child: const Icon(Icons.shopping_cart)
      ):const Icon(Icons.shopping_cart),child: Styles.text(Texts.cart,size: 11.w).tr());
    });
  }
}
