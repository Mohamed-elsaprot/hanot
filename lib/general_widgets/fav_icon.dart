import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/app_styles.dart';

import '../core/models/category_model/Product.dart';
import '../features/favorites/manager/fav_cubit.dart';

class FavIcon extends StatelessWidget {
  const FavIcon({Key? key ,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var favCubit = BlocProvider.of<FavCubit>(context);
    // int favListIndex = favCubit.favList.indexWhere((element) => element.id==product.id);
    return GestureDetector(
      onTap: (){
        // favCubit.changeFavList(product: product,index: favListIndex);
      },
      child: const Icon(CupertinoIcons.heart,color: Styles.primary,)
      // Icon(
      //   favListIndex!=-1?CupertinoIcons.heart_fill:CupertinoIcons.heart,
      //   color:favListIndex!=-1? Colors.red:Colors.black45,
      // ),
    );
  }
}
