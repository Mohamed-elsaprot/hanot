import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_state.dart';
import 'package:hanot/features/cart/view/widgets/cart_empty_body.dart';
import 'package:hanot/features/cart/view/widgets/cart_item.dart';
import 'package:hanot/features/cart/view/widgets/cart_screen_shimmer.dart';
import 'package:hanot/features/cart/view/widgets/complete_order_container.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit,CartState>(builder: (context,state){
      if(state is CartLoading){
        return const CartScreeShimmer();
      }else{
        return cartCubit.cartProductsList.isNotEmpty? Scaffold(
          appBar: AppBar(title: Styles.text(Texts.cart,size: 22).tr(),),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h,),
                Row(
                  children: [
                    Styles.text(Texts.itemsCount).tr(),
                    Styles.text(' ${cartCubit.cartProductsList.length}'),
                  ],
                ),
                ...List.generate(cartCubit.cartProductsList.length, (index) => CartItem(index: index,)),
              ],
            ),
          ),
          bottomNavigationBar: const CompleteOrderContainer(),
        ): const CartEmptyBody();
      }
    });
  }
}