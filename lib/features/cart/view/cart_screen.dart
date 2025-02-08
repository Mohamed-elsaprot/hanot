import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/cart/data/check_cart_repo/check_cart_repo.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_state.dart';
import 'package:hanot/features/cart/manager/check_cart_cubit/check_cart_cubit.dart';
import 'package:hanot/features/cart/view/widgets/cart_empty_body.dart';
import 'package:hanot/features/cart/view/widgets/cart_item.dart';
import 'package:hanot/features/cart/view/widgets/cart_screen_shimmer.dart';
import 'package:hanot/features/cart/view/widgets/complete_order_container.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      if (state is CartLoading) {
        return const CartScreeShimmer();
      } else {
        return cartCubit.cartProductsList.isNotEmpty ? BlocProvider(
          create: (context) => CheckCartCubit(CheckCartRepo()),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView.separated(
                padding: EdgeInsets.only(top: 10.h),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => CartItem(index: index,),
                separatorBuilder: (context, index) =>
                    Container(color: Colors.white,
                        child: Divider(
                          indent: 10.w, endIndent: 10.w, height: 20.h,)),
                itemCount: cartCubit.cartProductsList.length
            ),
            bottomNavigationBar: const CompleteOrderContainer(),
          ),
        ) : const CartEmptyBody();
      }
    });
  }
}
