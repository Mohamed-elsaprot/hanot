import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/widgets_fun.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/favorites/manager/fav_state.dart';

import '../core/design/fun.dart';
import '../core/models/category_model/Product.dart';
import '../features/auth_screen/view/phone/auth_screen.dart';
import '../features/favorites/manager/fav_cubit.dart';

class FavIcon extends StatelessWidget {
  const FavIcon({Key? key ,required this.product, this.fromFavScreen=false, this.iconSize}) : super(key: key);
  final Product product;
  final bool fromFavScreen;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    var favCubit = BlocProvider.of<FavCubit>(context);
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<FavCubit,FavState>(builder: (context,state){
      if(state is ChangeFavValLoading && favCubit.changedId== product.id){
        return loadingIndicator(rad: 14);
      }else{
        return GestureDetector(
            onTap: (){
              if(authCubit.isAuth){
                favCubit.setFavNewVal(productId: product.id!.toInt(), favVal: product.inFavorites!,fromFavScreen: fromFavScreen);
                product.inFavorites = !product.inFavorites!;
              }else{
                bottomSheet(context, const AuthScreen(),);
              }
            },
            child: Icon(product.inFavorites!? Icons.favorite : Icons.favorite_border,size: iconSize,)
        );
      }
    }, listener: (context,state){});
  }
}
