import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/cart/manager/counter_cubit/counter_state.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../data/cart_repo/cart_repo_impl.dart';
import '../../models/CartProductModel.dart';
import '../cart_cubit/cart_state.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit(this.cartRepoImpl):super(CounterInitial());
  final CartRepoImpl cartRepoImpl;
  num newCartTotal = 0;


  updateProduct({required String op,required String rowId,required CartProductModel product,required BuildContext context})async{
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var textsMap = BlocProvider.of<LangCubit>(context).texts;
      emit(CounterLoading());
      num? cacheQun = product.qty;
      if(op=='+'){product.qty = product.qty! + 1;}else{ product.qty = product.qty! - 1; }
    var res = await cartRepoImpl.updateProduct(rowId: rowId, qun: product.qty!, id: product.productId.toString());
      res.fold((failure){
        errorDialog(context: context, message: failure.errorMessage);
        product.qty = cacheQun;
        emit(CounterFailure(errorMessage: failure.errorMessage));
      }, (map){
        if(map['data']!=null){
          product.qty = map['data']['qty'];
          product.total = map['data']['price'] * product.qty;
          newCartTotal = num.tryParse(map['cart']['total'])??0;
        }else{
          errorDialog(context: context, message: textsMap['mobile_Quantity_is_currently_unavailable.']);
          product.qty = cacheQun;
        }
        cartCubit.emit(CartInitial());
        emit(CounterSuccess());
      });

  }
}