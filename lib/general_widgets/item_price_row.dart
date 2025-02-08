import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/design/app_styles.dart';
import '../core/local_storage/secure_storage.dart';
import '../core/models/category_model/Product.dart';
import '../features/favorites/manager/fav_cubit.dart';
import '../features/favorites/manager/fav_state.dart';
import 'fav_icon.dart';

class ItemPriceRow extends StatelessWidget {
  const ItemPriceRow({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    // bool checkPrice= product.hasCampaign??false;
    bool checkPrice= product.discountPrice!=null&&product.discountPrice!=0;
    return SizedBox(
      height: 20.h,
      child: Row(
        children: [
          Styles.text('${checkPrice? product.discountPrice : product.salePrice} ${SecureStorage.currency}',size: 13),
          const Spacer(),
          BlocBuilder<FavCubit,FavState>(builder: (context,state){
            return FavIcon(product: product,);
          }),
          // if(checkPrice)RemovedPrice(removedPrice: product.salePrice??0),
        ],
      ),
    );
  }
}
