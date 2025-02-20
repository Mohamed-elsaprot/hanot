import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_state.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun.dart';
import '../../../../core/design/images.dart';
import '../../../../core/local_storage/secure_storage.dart';
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
    var textsMap = BlocProvider.of<LangCubit>(context).texts;
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
                child: SizedBox(
                  height: 18.h,
                  child: AnimatedCrossFade(
                    crossFadeState: state is CartSuccess? CrossFadeState.showFirst:CrossFadeState.showSecond,
                    secondChild: const SizedBox(),
                    firstChild: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Images.shoppingBag,width: 15.w,color: Colors.white,),
                          SizedBox(width: 8.w,),
                          Styles.text(textsMap['mobile_Add_To_Cart'],color: Colors.white,size: 15),
                          if(state is CartSuccess)SizedBox(
                            width: 70.w,
                            child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child:  Styles.text(
                                    '(${cartCubit.skuDetails!.hasDiscountPrice!?
                                     (cartCubit.skuDetails.discountPrice!*singleProductCubit.count):
                                    (cartCubit.skuDetails.salePrice!*singleProductCubit.count)} ${SecureStorage.currency})',
                                    color: Colors.white,size: 15)
                            ),
                          ),
                        ],
                      ),
                    ), duration: const Duration(milliseconds: 100),
                  ),
                )
            );
        });
  }
}
