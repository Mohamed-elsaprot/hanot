import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/cart/manager/counter_cubit/counter_cubit.dart';
import 'package:hanot/features/cart/manager/counter_cubit/counter_state.dart';
import 'package:hanot/features/cart/models/CartProductModel.dart';
import 'package:hanot/features/cart/view/widgets/product_count_container.dart';

class CustomCounterButton extends StatelessWidget {
  const CustomCounterButton({Key? key, required this.product, required this.indexInCartList,}) : super(key: key);
  final CartProductModel product;
  final int indexInCartList;
  @override
  Widget build(BuildContext context) {
    var counterCubit = BlocProvider.of<CounterCubit>(context);
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context,state){
        return Row(
          children: [
            GestureDetector(
              onTap: ()async{
                if(product.qty==1){
                  cartCubit.removeFromCart(index: indexInCartList, context: context);
                }else{
                  if(state is! CounterLoading){
                    await counterCubit.updateProduct(op: '-', rowId: product.rowId!, product: product, context: context,);
                    cartCubit.cartTotal = counterCubit.newCartTotal;
                  }
                }
              },
              child: Container(
                height: 35.w,width: 35.w,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: product.qty==1?Colors.red.withOpacity(.07): Colors.grey.shade200
                ),
                child:product.qty==1?const Icon(CupertinoIcons.delete,color: Colors.red,) :Text('-', style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w900, color: Colors.black,),),
              ),
            ),
            ProductCountContainer(cartProductModel: product),
            GestureDetector(
              onTap: ()async{
                if(state is! CounterLoading){
                  await counterCubit.updateProduct(op: '+', rowId: product.rowId!, product: product, context: context,);
                  cartCubit.cartTotal = counterCubit.newCartTotal;
                }
              },
              child: Container(
                height: 35.w,width: 35.w,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.shade200
                ),
                child:Text('+', style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w500, color: Colors.black,),),
              ),
            )
          ],
        );
      },
    );
  }
}