import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/models/category_model/Product.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_state.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/add_to_cart_button.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/new_widgets/sheet_slider.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/product_details_container.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/sheet_counter.dart';
import 'package:hanot/general_widgets/custom_button.dart';
import 'package:hanot/general_widgets/related_products_list.dart';

import '../../managers/single_products_details_cubit/single_products_details_cubit.dart';
import 'options_colum.dart';

class SheetBody extends StatelessWidget {
  const SheetBody({Key? key, required this.product, this.fromFavScreen=false,}) : super(key: key);
  final Product product;
  final bool fromFavScreen;
  @override
  Widget build(BuildContext context) {
    var textsMap = BlocProvider.of<LangCubit>(context).texts;
    var singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      backgroundColor: Styles.secScaffoldColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Column(
              children: [
                SheetSlider(product: product,fromFavScreen: fromFavScreen,),
                Column(
                  children: [
                    ProductDetailsContainer(),
                    const OptionsColumn(),
                    const SizedBox(height: 5,),
                    BlocBuilder<CartCubit,CartState>(builder: (context,state){
                      return cartCubit.availableCount!<=0?Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 6.h),
                          child: CustomButton(fun: (){}, title: textsMap['not_valid'],rad: 50,backGroundColor: Colors.grey,)
                      ): Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SheetCounter(),
                            const Expanded(child: SizedBox(),),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: AddToCartButton(product: singleProductCubit.singleProductModel),
                            ),
                            const Expanded(child: SizedBox(),)
                          ],
                        ),
                      );
                    }),
                    if(singleProductCubit.singleProductModel.des!=null)Container(
                      color: Colors.white,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Styles.text(textsMap['mobile_des']),
                          const SizedBox(height: 8,),
                          Styles.subTitle(singleProductCubit.singleProductModel.des!,size: 12),
                        ],
                      ),
                    ),
                  ],
                ).animate().slideY(begin: 1,duration: const Duration(milliseconds: 400),curve: Curves.ease),
                if(singleProductCubit.singleProductModel.relatedProducts.isNotEmpty)
                  RelatedProductsList(relatedList: singleProductCubit.singleProductModel.relatedProducts)
              ],
            ),
          ),
          GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30.h),color: Colors.transparent,
              child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 28,),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: SheetActionsRow(product: singleProductCubit.singleProductModel),
    );
  }
}
