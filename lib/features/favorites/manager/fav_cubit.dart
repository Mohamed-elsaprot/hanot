import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/favorites/manager/fav_state.dart';

import '../../../core/models/category_model/Product.dart';

class FavCubit extends Cubit<FavState>{
  FavCubit():super(FavInitial());
  List<Product> favList=[
    Product(name: 'product 1',costPrice: 100,discountPrice: 120,id: 1,salePrice: 150,quantity: 10,image: 'https://hips.hearstapps.com/hmg-prod/images/2020-03-10-use-a-drill-final-clean-00-01-57-10-still053-1584632505.jpg'),
    Product(name: 'product 2',costPrice: 34,discountPrice: 55,id: 0,salePrice: 122,quantity: 3,image: 'https://hips.hearstapps.com/hmg-prod/images/2020-03-10-use-a-drill-final-clean-00-01-57-10-still053-1584632505.jpg'),
    Product(name: 'product 3',costPrice: 65,discountPrice: 44,id: 9,salePrice: 1233,quantity: 5,image: 'https://hips.hearstapps.com/hmg-prod/images/2020-03-10-use-a-drill-final-clean-00-01-57-10-still053-1584632505.jpg'),
  ];

  changeFavList({required int index,required Product product}){
    if(index==-1){
      favList.add(product);
    }else{
      favList.removeAt(index);
    }
    emit(FavInitial());
  }

}