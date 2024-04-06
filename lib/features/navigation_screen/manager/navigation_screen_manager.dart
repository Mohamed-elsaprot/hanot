import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';

abstract class NavigationManager{
  static checkFun(int index,BuildContext context)async{
    if(index==2){
      var cartCubit = BlocProvider.of<CartCubit>(context);
      await cartCubit.getCartProducts();
    }
  }
}