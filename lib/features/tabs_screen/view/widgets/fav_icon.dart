import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../favorites/manager/fav_cubit.dart';
import '../../model/category_model/Product.dart';


class FavIcon extends StatelessWidget {
  const FavIcon({Key? key , required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    var favCubit = BlocProvider.of<FavCubit>(context);
    int favListIndex = favCubit.favList.indexWhere((element) => element.id==product.id);
    return GestureDetector(
      onTap: (){
        favCubit.changeFavList(product: product,index: favListIndex);
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          favListIndex!=-1?CupertinoIcons.heart_fill:CupertinoIcons.heart,
          color: Colors.black,
        ),
      ),
    );
  }
}
