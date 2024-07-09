import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/managers/hint_cubit/hint_cubit.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/managers/hint_cubit/hint_state.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/models/single_product_model/SingleProductModel.dart';
import 'package:hanot/general_widgets/rating_stars.dart';
import 'package:hanot/general_widgets/removed_price.dart';

import '../../../../core/design/app_styles.dart';
import '../../managers/single_products_details_cubit/single_products_details_cubit.dart';

class SheetTitleRow extends StatelessWidget {
  const SheetTitleRow({Key? key, required this.product}) : super(key: key);
  final SingleProductModel product;
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var singleProductCubit = BlocProvider.of<SingleProductCubit>(context);

    bool checkPrice = singleProductCubit.singleProductModel.hasDiscountPrice??false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 300.w, child: Styles.text(product.name??'No Name',size: 15,)),
            const Spacer(),
            RatingStars(singleProductModel:singleProductCubit.singleProductModel ,textSize: 15,iconSize: 25,)
          ],
        ),
        SizedBox(height: 8.h,),
        // Styles.subTitle(product.image.toString()),
        SizedBox(height: 10.h,),
        BlocBuilder<HintCubit,HintState>(builder: (context,state){
          if(state is HintInitial){
            return Styles.subTitle('${cartCubit.skuDetails.quantity} ${Texts.leftoverPieces.tr()}',color: Colors.red.shade300,size: 12);
          }else{
            return shimmerWidget(height: 14, width: 100,rad: 20);
          }
        }),

        SizedBox(height: 10.h,),
        Row(
          children: [
            (checkPrice)? Styles.text('${product.discountPrice} ${Texts.currency}',color: Styles.primary):
            Styles.text('${product.salePrice} ${Texts.currency}',color: Styles.primary),
            if(checkPrice)SizedBox(width: 5.w,),
            if(checkPrice)RemovedPrice(removedPrice: product.salePrice!),
            SizedBox(width: 15.w,),
            Container(
              color:Colors.grey.shade200,
              padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
              child: Styles.subTitle(Texts.pricesIncludeTax.tr(),size: 11),
            )
          ],
        )
      ],
    );
  }
}
