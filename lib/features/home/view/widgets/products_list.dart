import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/home/models/HomeModelWithProducts/HomeModelWithProducts.dart';
import 'package:hanot/general_widgets/item_card.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key, required this.homeModelWithProducts}) : super(key: key);
  final HomeModelWithProducts homeModelWithProducts;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 6.w,),
            child: Styles.text(homeModelWithProducts.title??''),
          ),
          SizedBox(height: 10.h,),
          SizedBox(
            height: 290.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: homeModelWithProducts.productsList!.length,
              itemBuilder: (context,index){
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 180.w,
                  child: ItemCard(product: homeModelWithProducts.productsList![index]),
                );
              },),
          ),
        ],
      ),
    );
  }
}
