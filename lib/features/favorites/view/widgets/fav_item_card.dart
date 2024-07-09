import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/general_widgets/removed_price.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun.dart';
import '../../../../core/design/widgets.dart';
import '../../../../core/models/category_model/Product.dart';
import '../../../../general_widgets/add_to_cart_sheet/add_to_cart_sheet.dart';
import '../../../auth_screen/view/phone/phone_auth_screen.dart';
import '../../../../general_widgets/fav_icon.dart';

class FavItemCard extends StatelessWidget {
  const FavItemCard({Key? key, required this.product}) : super(key: key);
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
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: cachedImage(product.image ?? '', rad: 10, height: 100, width: 120),),
                  SizedBox(width: 10.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 200.w, child: Styles.text(product.name ?? '', size: 13, overflow: TextOverflow.ellipsis)),
                      SizedBox(height: 8.h,),
                      SizedBox(width: 200.w, child: Styles.subTitle(product.image ?? '', size: 11, overflow: TextOverflow.ellipsis)),
                      SizedBox(height: 8.h,),
                      Styles.subTitle('متبقي 12 قطعة', color: Colors.red),
                      SizedBox(height: 15.h,),
                      Row(
                        children: [
                          Styles.text('${product.salePrice ?? product.salePrice ?? 0}${Texts.currency}', color: Styles.primary),
                          SizedBox(width: 10.w,),
                          if (product.salePrice != null && product.salePrice != product.costPrice)RemovedPrice(removedPrice: product.costPrice??0),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          PositionedDirectional(end: 25,top: 25,child: FavIcon())
        ],
      ),
    );
  }
}
