import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/favorites/manager/fav_state.dart';

import '../../tabs_screen/model/category_model/Product.dart';

class FavCubit extends Cubit<FavState>{
  FavCubit():super(FavInitial());
  List<Product> favList=[];

  changeFavList({required int index,required Product product}){
    if(index==-1){
      favList.add(product);
    }else{
      favList.removeAt(index);
    }
    emit(FavInitial());
  }

}