import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/cart/data/cart_repo_impl.dart';
import 'package:hanot/features/cart/manager/cart_state.dart';
import 'package:hanot/features/cart/models/CartProductModel.dart';

import '../../../general_widgets/add_to_cart_sheet/models/single_product_model/SingleProductModel.dart';
import '../../../general_widgets/add_to_cart_sheet/models/single_sku_details/SingleSkuDetails.dart';
import '../../tabs_screen/model/category_model/Product.dart';

class CartCubit extends Cubit<CartState>{
  CartCubit(this.cartRepoImpl):super(CartInitial());
  final CartRepoImpl cartRepoImpl;
  late SingleSkuDetails skuDetails;
  List<Product> cartList =[];
  List<CartProductModel> cartProductsList=[];
  getSkuDetails({required List selectedOptionsList,required SingleProductModel product,required Map body,required BuildContext context})async{
    loadingDialog(context);
    var res = await cartRepoImpl.checkSkuDetails(body: body);
    res.fold((failure){
      Navigator.pop(context);
      errorDialog(context: context, message: failure.errorMessage);
    }, (model){
      skuDetails=model;
      Map optionsMap = {};
      for (int i=0; i<selectedOptionsList.length; i++) {
        optionsMap[product.options![i].id.toString()]=selectedOptionsList[i];
      }
      if(skuDetails.quantity! > 0){
        addToCart(body: {"product_id": product.id, "qty": 1, "sku_id": skuDetails.skuId, "options": optionsMap}, context: context);
      }else{
        errorDialog(context: context, message: 'هذا المنتج غير متوفر حاليا بهذه المواصفات');
      }
    });
  }

  addToCart({required Map body,required BuildContext context})async{
    var res = await cartRepoImpl.addToCart(body: body);
    res.fold((failure){
      Navigator.pop(context);
      errorDialog(context: context, message: failure.errorMessage);
      }, (map){
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  getCartProducts()async{
    emit(CartLoading());
    var res = await cartRepoImpl.getCartProducts();
    res.fold((failure){
      emit(CartFailure(errorMessage: failure.errorMessage));
    }, (list){
      cartProductsList = list;
      emit(CartSuccess());
    });
  }


  changeCount(Product product,String op){
    int index = cartList.indexWhere((element) => element.id==product.id);
    if(op=='+'){
      if(cartList[index].count<=cartList[index].quantity!)cartList[index].count = cartList[index].count!+1;
    }else{
      if(cartList[index].count!>1){
        cartList[index].count = cartList[index].count!-1;
      }else{
        cartList.removeAt(index);
      }
    }
    emit(CartInitial());
  }
  removeFromCart(Product product){
    int index = cartList.indexWhere((element) => element.id==product.id);
    cartList.removeAt(index);
    emit(CartInitial());
  }
  calcTotal(){
    double total=0;
    cartList.forEach((element) {
      if(element.salePrice!=null||element.salePrice!=0){
        total= total+(element.count!*element.salePrice!);
      }else{
        total= total+(element.count!*element.costPrice!);
      }
    });
    return total;
  }

}