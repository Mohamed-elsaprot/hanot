import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_state.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun.dart';
import '../../../../core/design/images.dart';
import '../../../../features/cart/manager/cart_cubit/cart_cubit.dart';
import '../../managers/single_products_details_cubit/single_products_details_cubit.dart';
import '../../models/single_product_model/SingleProductModel.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key, required this.product}) : super(key: key);
  final SingleProductModel product;
  @override
  Widget build(BuildContext context) {
    var singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit,CartState>(
        builder: (context,state){
            return ElevatedButton(
                onPressed: (){
                  if(state is CartSuccess){
                    if(singleProductCubit.productOptionsList.isNotEmpty) {
                      cartCubit.getSkuDetails(
                          isAddToCartButton: true,
                          count: singleProductCubit.count,
                          selectedOptionsList: singleProductCubit.productOptionsList,
                          product: singleProductCubit.singleProductModel,
                          body: {"options": singleProductCubit.productOptionsList, "product_id": product.id!.toInt()},
                          context: context
                      );
                    }else{
                      loadingDialog(context);
                      cartCubit.addToCart(body: {"product_id": product.id, "qty": singleProductCubit.count,}, context: context);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    padding: EdgeInsets.symmetric(vertical: 10.h)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Images.shoppingBag,width: 15.w,color: Colors.white,),
                    SizedBox(width: 8.w,),
                    Styles.text(Texts.addToCart.tr(),color: Colors.white,size: 12),
                    SizedBox(
                      width: 70.w,
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child:  Styles.text('(${ state is CartSuccess? (cartCubit.skuDetails.salePrice!*singleProductCubit.count):''} ${Texts.currency})',color: Colors.white,size: 12)
                      ),
                    ),
                  ],
                )
            );
        });
  }
}
