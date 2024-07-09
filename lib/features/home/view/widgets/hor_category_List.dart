import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/router.dart';
import '../../../categories/model/SmallCategoryModel.dart';

class HorizontalCategoriesList extends StatelessWidget {
  const HorizontalCategoriesList({Key? key, required this.categoriesList}) : super(key: key);
  final List<SmallCategoryModel> categoriesList;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      height: 55.h,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: List.generate(categoriesList.length, (index) => GestureDetector(
          onTap: ()=>AppRouter.router.push(AppRouter.categoryProducts,extra: categoriesList[index]),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.shade100
            ),
            margin: EdgeInsets.symmetric(horizontal: 6.w,vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w,),
            alignment: Alignment.center,
            child: Styles.text(categoriesList[index].name??'No name',size: 13
            ),
          ),
        ),
        ),
      ),
    );
  }
}
