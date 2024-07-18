import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/home/models/HomeModelWithProducts/HomeModelWithProducts.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/general_widgets/item_card.dart';

class HomeProductsList extends StatelessWidget {
  const HomeProductsList({Key? key, required this.homeModelWithProducts}) : super(key: key);
  final HomeModelWithProducts homeModelWithProducts;
  @override
  Widget build(BuildContext context) {
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Styles.text(homeModelWithProducts.title??''),
                Styles.text(textsMap['mobile_show_all'],size: 12,color: Styles.primary,fontWeight: FontWeight.w900)
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: List.generate(homeModelWithProducts.productsList!.length, (index) => Container(
                  width: 185.w,
                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                  child: ItemCard(product: homeModelWithProducts.productsList![index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}