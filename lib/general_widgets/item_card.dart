import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/favorites/manager/fav_cubit.dart';
import 'package:hanot/features/favorites/manager/fav_state.dart';
import 'package:hanot/general_widgets/item_price_row.dart';
import 'package:hanot/general_widgets/red_sale_container.dart';

import '../core/design/app_styles.dart';
import '../core/design/widgets.dart';
import '../features/tabs_screen/model/category_model/Product.dart';
import '../features/tabs_screen/view/widgets/fav_icon.dart';
import 'add_to_cart_sheet/add_to_cart_sheet.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key,required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bottomSheet(context, AddToCartSheet(product: product), rad: 0);
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(child: cachedImage(product.image??'',height: 170.h)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h,),
                    SizedBox(height: 20.h, child: Styles.subTitle(product.name??'No name', size: 13)),
                    SizedBox(height: 2.h,),
                    ItemPriceRow(product: product),
                    SizedBox(height: 2.h,),
                    if(product.discountPrice!=null&&product.discountPrice!=0)Styles.text('-${product.discountPrice}% discount',color: Colors.deepPurpleAccent.withOpacity(.5),size: 13,fontWeight: FontWeight.w400)
                  ],
                ),
              ),
            ],
          ),
          BlocBuilder<FavCubit,FavState>(builder: (context,state){
            return Positioned(top: 10, right: 10, child: FavIcon(product: product));
          }),
          if(product.discountPrice!=null&&product.discountPrice!=0)RedSaleContainer(product: product),
        ],
      ),
    );
  }
}
