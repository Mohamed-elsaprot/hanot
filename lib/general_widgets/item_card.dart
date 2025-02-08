import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/general_widgets/item_price_row.dart';

import '../core/design/app_styles.dart';
import '../core/design/widgets_fun.dart';
import '../core/models/category_model/Product.dart';
import 'add_to_cart_sheet/add_to_cart_sheet.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key,required this.product, this.navFromSheet=false}) : super(key: key);
  final Product product;
  final bool navFromSheet;
  @override
  Widget build(BuildContext context) {
    Map texts = BlocProvider.of<LangCubit>(context).texts;
    return GestureDetector(
      onTap: () async {
        navFromSheet?
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> AddToCartScreen(product: product)))
            :Navigator.push(context, MaterialPageRoute(builder: (_)=> AddToCartScreen(product: product)));
      },
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(tag: product.id!,child: Stack(
                  children: [
                    cachedImage(product.image??'',height: 155,),
                    if(product.quantity!<1)Container(
                      height: 155.h,width: double.infinity,alignment: Alignment.center,
                      color: Colors.black26,child: Styles.text(texts['not_valid'],color: Colors.white),
                    )
                  ],
                )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h,),
                      ItemPriceRow(product: product),
                      SizedBox(height: 2.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 35.h,width: 150.w,child: Styles.text(product.name??'No name', size: 13,),),
                          // RatingStars(product: product,),
                        ],
                      ),
                     ],
                  ),
                ),
              ],
            ),
    );
  }
}
