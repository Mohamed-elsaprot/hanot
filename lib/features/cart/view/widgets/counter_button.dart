import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/cart/manager/counter_cubit/counter_cubit.dart';
import 'package:hanot/features/cart/manager/counter_cubit/counter_state.dart';
import 'package:hanot/features/cart/models/CartProductModel.dart';


class CustomCounterButton extends StatelessWidget {
  const CustomCounterButton({Key? key, required this.product,}) : super(key: key);
  final CartProductModel product;

  @override
  Widget build(BuildContext context) {
    var counterCubit = BlocProvider.of<CounterCubit>(context);
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context,state){
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              TextButton(
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.grey.shade300),
                  onPressed: () async {
                    if(state is! CounterLoading){
                      await counterCubit.updateProduct(op: '+', rowId: product.rowId!, product: product, context: context,);
                      cartCubit.cartTotal = counterCubit.newCartTotal;
                    }
                  },
                  child: Text('+', style: TextStyle(fontSize: 22.sp, color: Colors.black38),)),
              BlocBuilder<CounterCubit, CounterState>( builder: (context, st) {
                if (st is CounterLoading) {
                  return loadingIndicator(rad: 8);
                } else {
                  return Text(
                    product.qty!.toString(),
                    style: TextStyle(fontSize: 16.sp, color: Colors.black87),
                  );
                }
              }),
              TextButton(
                style:
                ElevatedButton.styleFrom(foregroundColor: Colors.grey.shade300),
                onPressed: () async {
                  if(state is! CounterLoading){
                    await counterCubit.updateProduct(op: '-', rowId: product.rowId!, product: product, context: context,);
                    cartCubit.cartTotal = counterCubit.newCartTotal;
                  }
                },
                child: Text('-', style: TextStyle(fontSize: 30.sp, color: Colors.black38),),
              ),
            ],
          ),
        );
      },
    );
  }
}
