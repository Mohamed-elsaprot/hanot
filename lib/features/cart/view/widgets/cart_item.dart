import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/cart/data/cart_repo_impl.dart';
import 'package:hanot/features/cart/manager/counter_cubit/counter_cubit.dart';
import 'package:hanot/features/cart/manager/counter_cubit/counter_state.dart';
import 'package:hanot/features/cart/view/widgets/delete_product_container.dart';
import 'package:hanot/features/cart/view/widgets/name_and_price_container.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/widgets.dart';
import '../../manager/cart_cubit/cart_cubit.dart';
import 'counter_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var product = cartCubit.cartProductsList[index];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: Colors.black12,
          )),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 80.w, child: cachedImage(product.image ?? '', height: 100)),
                    SizedBox(width: 10.w,),
                    NameAndPriceContainer(product: product)
                  ],
                ),
                const Divider(color: Colors.black87,),
                BlocProvider(
                  create: (context) => CounterCubit(CartRepoImpl()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCounterButton(product: product),
                      BlocBuilder<CounterCubit,CounterState>(builder: (context,state)=> Styles.text('${product.total} PLN'))
                    ],
                  ),
                ),
              ],
            ),
          ),
          DeleteProductContainer(index: index)
        ],
      ),
    );
  }
}
