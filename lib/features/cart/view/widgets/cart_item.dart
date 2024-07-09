import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/cart/view/widgets/cart_item_details.dart';
import 'package:hanot/features/cart/view/widgets/selected_check_button.dart';
import '../../../../core/design/widgets.dart';
import '../../manager/cart_cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var product = cartCubit.cartProductsList[index];
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          // SelectedCheckButton(cartIndex: index),
          // SizedBox(width: 10.w,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: cachedImage(product.image ?? '', rad: 10, height: 100, width: 120),
          ),
          SizedBox(width: 10.w,),
          CartItemDetailsContainer(indexInCartList: index,cartProductModel: product),
        ],
      ),
    );
  }
}
