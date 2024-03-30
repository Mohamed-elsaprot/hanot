import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/router.dart';
import '../../../../core/design/widgets.dart';
import '../../../categories/model/SmallCategoryModel.dart';

class HorizontalCategoriesList extends StatelessWidget {
  const HorizontalCategoriesList({Key? key, required this.categoriesList}) : super(key: key);
  final List<SmallCategoryModel> categoriesList;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      height: 170.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              AppRouter.router.push(AppRouter.categoryProducts,extra: categoriesList[index]);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.  h),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: cachedImage(categoriesList[index].image??'',height: 120,width: 200)),
                ),
                Styles.subTitle(categoriesList[index].name??'No Name',size: 15)
              ],
            ),
          );
        },),
    );
  }
}
