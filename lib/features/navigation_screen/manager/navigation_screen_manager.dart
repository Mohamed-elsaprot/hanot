import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';

// abstract class NavigationManager{
//   static checkFun(int index,BuildContext context)async{
//     if(index==2){
//       var cartCubit = BlocProvider.of<CartCubit>(context);
//       await cartCubit.getCartProducts();
//       cartCubit.allSelected=false;
//     }
//   }
// }

class NavigationScreenCubit extends Cubit<NavigationScreenState> {
  NavigationScreenCubit():super(NavigationScreenState());
  int index = 0;

  setIndex(int x){
    index = x;
    emit(NavigationScreenState());
  }
  checkFun(BuildContext context)async{
    if(index==2){
      var cartCubit = BlocProvider.of<CartCubit>(context);
      await cartCubit.getCartProducts();
    }
    emit(NavigationScreenState());
  }
  resetNavScreen({required int x}){
    index=x;
    emit(NavigationScreenReset());
  }
}

class NavigationScreenState{}
class NavigationScreenReset extends NavigationScreenState{}