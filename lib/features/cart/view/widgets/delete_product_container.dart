import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../manager/cart_cubit/cart_cubit.dart';

class DeleteProductContainer extends StatelessWidget {
  const DeleteProductContainer({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.r)),
      ),
      padding: EdgeInsets.all(8.sp),
      child: InkWell(
        onTap:(){
          cartCubit.removeFromCart(index: index, context: context);
        },
        child: CircleAvatar(
          radius: 17,backgroundColor: Colors.red.shade400,
          child: const Icon(Icons.delete_outline,color: Colors.white,),
        ),
      ),
    );
  }
}
