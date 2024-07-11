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
import '../../../auth_screen/view/phone/auth_screen.dart';
import '../../../../general_widgets/fav_icon.dart';

class FavItemCard extends StatelessWidget {
  final String? salePrice,
      image,
      productName,
      discountPrice,
      availableQuantity,
      costPrice;
  final Product product;
  const FavItemCard(
      {Key? key,
      this.salePrice,
      this.image,
      this.productName,
      this.discountPrice,
      this.availableQuantity,
      this.costPrice,
      required this.product})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return GestureDetector(
      onTap: () async {
        if (!authCubit.isAuth) {
          bottomSheet(
            context,
            const AuthScreen(),
          );
        } else {
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
                    child: cachedImage(image ?? '',
                        rad: 10, height: 100, width: 120),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 200.w,
                          child: Styles.text(productName ?? '',
                              size: 13, overflow: TextOverflow.ellipsis)),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                          width: 200.w,
                          child: Styles.subTitle('منتوجات مستوردة',
                              size: 11, overflow: TextOverflow.ellipsis)),
                      SizedBox(
                        height: 8.h,
                      ),
                      Styles.subTitle('متبقي $availableQuantity قطعة',
                          color: Colors.red),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          Styles.text('$salePrice ${Texts.currency}',
                              color: Styles.primary),
                          SizedBox(
                            width: 10.w,
                          ),
                          if (salePrice != null && salePrice != costPrice)
                            RemovedPrice(removedPrice: num.parse(costPrice!)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const PositionedDirectional(end: 25, top: 25, child: FavIcon())
        ],
      ),
    );
  }
}
