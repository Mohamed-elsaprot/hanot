import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_state.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/local_storage/secure_storage.dart';
import '../../managers/single_products_details_cubit/single_products_details_cubit.dart';

class SheetTitleRow extends StatelessWidget {
  const SheetTitleRow({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
    return BlocBuilder<CartCubit,CartState>(builder: (context,state){
      bool checkPrice = singleProductCubit.singleProductModel.hasDiscountPrice??false;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 220.w, child: Styles.text(singleProductCubit.singleProductModel.name??'No Name',size: 18,maxLines: 2)),
              const Spacer(),
              SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    checkPrice?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FittedBox(child: Styles.text('${singleProductCubit.singleProductModel.discountPrice}${SecureStorage.currency}',color: Styles.primary,)),
                        SizedBox(width: 8.w,),
                        FittedBox(child: Styles.subTitle('${singleProductCubit.singleProductModel.salePrice}${SecureStorage.currency}',textDecoration: TextDecoration.lineThrough,size: 16)),
                      ],
                    ):
                    FittedBox(child: Styles.text('${singleProductCubit.singleProductModel.salePrice} ${SecureStorage.currency}',)),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
