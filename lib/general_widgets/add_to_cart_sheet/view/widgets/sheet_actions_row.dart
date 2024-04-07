import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/tabs_screen/view/widgets/fav_icon.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/managers/single_products_details_cubit/single_products_details_cubit.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';
import '../../../../features/favorites/manager/fav_cubit.dart';
import '../../../../features/favorites/manager/fav_state.dart';
import '../../../../features/tabs_screen/model/category_model/Product.dart';

class SheetActionsRow extends StatelessWidget {
  const SheetActionsRow({Key? key,required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black38)
              ),
              child: BlocBuilder<FavCubit,FavState>(builder: (context,state){
                return  FavIcon(product: product);
              }),
          ),
        ),
        SizedBox(width: 15.w,),
        Expanded(
          flex: 6,
          child: ElevatedButton(
              onPressed: (){
                if(singleProductCubit.productOptionsList.isNotEmpty) {
                  cartCubit.getSkuDetails(
                    isAddToCartButton: true,
                      selectedOptionsList: singleProductCubit.productOptionsList,
                      product: singleProductCubit.singleProductModel,
                      body: {"options": singleProductCubit.productOptionsList, "product_id": product.id!.toInt()},
                      context: context
                  );
                }else{
                  if(product.quantity!>0){
                    loadingDialog(context);
                    cartCubit.addToCart(body: {"product_id": product.id, "qty": 1,}, context: context);
                  }else{
                   errorDialog(context: context, message: 'هذا المنتج غير متوفر حاليا');
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                  padding: EdgeInsets.symmetric(vertical: 10.h)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.shoppingBag,width: 15.w,color: Colors.white,),
                  SizedBox(width: 8.w,),
                  Styles.text(Texts.addToCart,color: Colors.white,size: 12).tr()
                ],
              )
          ),
        )
      ],
    );
  }
}
