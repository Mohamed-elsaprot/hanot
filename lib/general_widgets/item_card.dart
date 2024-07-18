import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/favorites/manager/fav_cubit.dart';
import 'package:hanot/features/favorites/manager/fav_state.dart';
import 'package:hanot/general_widgets/item_price_row.dart';
import 'package:hanot/general_widgets/rating_stars.dart';

import '../core/design/app_styles.dart';
import '../core/design/widgets.dart';
import '../core/models/category_model/Product.dart';
import '../features/auth_screen/view/phone/auth_screen.dart';
import 'fav_icon.dart';
import 'add_to_cart_sheet/add_to_cart_sheet.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key,required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return GestureDetector(
      onTap: () async {
        if(!authCubit.isAuth) {
          bottomSheet(context, const AuthScreen(),);
        }else {
          bottomSheet(context, AddToCartSheet(product: product), rad: 0);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200)
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r),topRight: Radius.circular(8.r)),
                    child: cachedImage(product.image??'',height: 150.h,)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 20.h,width: 100.w,child: Styles.subTitle(product.name??'No name', size: 13,overflow: TextOverflow.ellipsis),),
                          RatingStars(product: product,),
                        ],
                      ),
                      SizedBox(height: 2.h,),
                      ItemPriceRow(product: product),
                     ],
                  ),
                ),
                SizedBox(height: 10.h,)
              ],
            ),
            BlocBuilder<FavCubit,FavState>(builder: (context,state){
              return PositionedDirectional(top: 15, end: 15, child: FavIcon(product: product,));
            }),
          ],
        ),
      ),
    );
  }
}
