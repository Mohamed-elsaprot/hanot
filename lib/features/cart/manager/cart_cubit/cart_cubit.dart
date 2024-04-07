import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/cart/data/cart_repo_impl.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_state.dart';
import 'package:hanot/features/cart/models/CartProductModel.dart';

import '../../../../general_widgets/add_to_cart_sheet/models/single_product_model/SingleProductModel.dart';
import '../../../../general_widgets/add_to_cart_sheet/models/single_sku_details/SingleSkuDetails.dart';

class CartCubit extends Cubit<CartState>{
  CartCubit(this.cartRepoImpl):super(CartInitial());
  final CartRepoImpl cartRepoImpl;
  late SingleSkuDetails skuDetails;
  num cartTotal = 0 ;
  List<CartProductModel> cartProductsList=[];
  int cartLen = 0 ;
  num hintNum=0;
  getSkuDetails({required bool isAddToCartButton,required List selectedOptionsList,required SingleProductModel product,required Map body,required BuildContext context})async{
    if(isAddToCartButton)loadingDialog(context);
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
      hintNum = skuDetails.quantity!;
      if(skuDetails.quantity! > 0){
        if(isAddToCartButton){
          addToCart(body: {"product_id": product.id, "qty": 1, "sku_id": skuDetails.skuId, "options": optionsMap}, context: context);
        }
      }else{
        if(isAddToCartButton){
          Navigator.pop(context);
          errorDialog(context: context, message: 'هذا المنتج غير متوفر حاليا بهذه المواصفات');
        }
      }
    });
  }

  addToCart({required Map body,required BuildContext context})async{
    var res = await cartRepoImpl.addToCart(body: body);
    res.fold((failure){
      Navigator.pop(context);
      errorDialog(context: context, message: failure.errorMessage);
      }, (map)async{
      await getCartProducts();
      emit(CartSuccess());
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  getCartProducts()async{
    emit(CartLoading());
    var res = await cartRepoImpl.getCartProducts();
    res.fold((failure){
      emit(CartFailure(errorMessage: failure.errorMessage));
    }, (map){
      cartProductsList = map['list'];
      cartTotal= double.parse( map['cart']['total']);
      cartLen=cartProductsList.length;
      emit(CartSuccess());
    });
  }

  removeFromCart({required int index,required BuildContext context,})async{
    CartProductModel cartProductModel = cartProductsList[index];
    cartProductsList.removeAt(index);
    cartLen=cartProductsList.length;
    emit(CartSuccess());
    var res = await cartRepoImpl.deleteCartProducts(rowId: cartProductModel.rowId!);
    res.fold((failure){
      errorDialog(context: context, message: failure.errorMessage);
      cartProductsList.insert(index, cartProductModel);
      cartLen=cartProductsList.length;
    }, (map){
      cartTotal = double.parse( map['cart']['total']);
      emit(CartSuccess());
    });
  }


}