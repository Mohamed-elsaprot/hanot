import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/cart/manager/cart_state.dart';

import '../../tabs_screen/model/category_model/Product.dart';

class CartCubit extends Cubit<CartState>{
  CartCubit():super(CartInitial());
  List<Product> cartList =[];

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
  addToCart(Product product){
    int index = cartList.indexWhere((element) => element.id==product.id);
    if(index==-1){
      cartList.add(product);
    }else{
      cartList[index].count++;
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