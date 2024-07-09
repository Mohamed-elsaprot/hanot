import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/widgets.dart';
import '../core/models/category_model/CategoryModel.dart';
import 'item_card.dart';

class GeneralProductsListBody extends StatelessWidget {
  const GeneralProductsListBody({Key? key, required this.scrollController, required this.categoryModel, required this.last}) : super(key: key);
  final ScrollController scrollController;
  final CategoryProductsModel categoryModel;
  final bool last;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(int i=0; i<categoryModel.productsList!.length; i+=2)
          i == categoryModel.productsList!.length-1? Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 185.w, child: ItemCard(product:categoryModel.productsList![i],)),
                SizedBox(width: 185.w,),
              ],
            ),
          )
              :Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 185.w, child: ItemCard(product:categoryModel.productsList![i],)),
                SizedBox(width: 185.w, child: ItemCard(product:categoryModel.productsList![i+1],)),
              ],
            ),
          ),
        last || categoryModel.productsList!.length<=4? const SizedBox():loadingIndicator()
      ],
    );
  }
}
