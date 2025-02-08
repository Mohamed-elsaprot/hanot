import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/home/models/HomeModelWithProducts/HomeModelWithProducts.dart';
import 'package:hanot/general_widgets/item_card.dart';

class HomeProductsList extends StatelessWidget {
  const HomeProductsList({Key? key, required this.homeModelWithProducts,}) : super(key: key);
  final HomeModelWithProducts homeModelWithProducts;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
            child: Styles.text(homeModelWithProducts.title??''),
          ),
          SizedBox(height: 10.h,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: List.generate(homeModelWithProducts.productsList!.length, (index) => Container(
                  width: 170.w,
                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                  child: ItemCard(product: homeModelWithProducts.productsList![index],),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}