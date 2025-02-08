import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/design/router.dart';
import '../features/cart/manager/cart_cubit/cart_cubit.dart';
import '../features/cart/manager/cart_cubit/cart_state.dart';
import '../features/navigation_screen/manager/navigation_screen_manager.dart';

class CartAppbarIcon extends StatelessWidget {
  const CartAppbarIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var navCubit = BlocProvider.of<NavigationScreenCubit>(context);
    return GestureDetector(
      onTap: (){
        navCubit.setIndex(2);
        navCubit.checkFun(context);
        for(int i =0; AppRouter.router.canPop(); )AppRouter.router.pop(context);
      },
      child: BlocBuilder<CartCubit, CartState>(builder: (context,state)=>cartCubit.cartLen>0?badges.Badge(
          badgeContent: Text(cartCubit.cartLen.toString(), style: const TextStyle(color: Colors.white ,fontSize: 14,),),
          position: badges.BadgePosition.custom(end: 14, bottom: 7,),
          badgeStyle: badges.BadgeStyle(
            padding: EdgeInsets.all(4.4.sp),
            badgeColor: Colors.red,
          ),
          child: const Icon(Icons.shopping_cart_outlined)):const Icon(Icons.shopping_cart_outlined)),
    );
  }
}
