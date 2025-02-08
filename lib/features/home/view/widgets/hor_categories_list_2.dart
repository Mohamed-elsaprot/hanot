import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/router.dart';
import '../../../categories/model/SmallCategoryModel.dart';
import '../../../categories/model/category_details/Children.dart';

class HorCategoriesList2 extends StatelessWidget {
  const HorCategoriesList2({Key? key, this.categoriesList, this.childrenList}) : super(key: key);
  final List<SmallCategoryModel>? categoriesList;
  final List<Children>? childrenList;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 35.h,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: List.generate(childrenList!=null?childrenList!.length:categoriesList!.length, (index) =>childrenList!=null? GestureDetector(
          onTap: () => AppRouter.router.push(AppRouter.subCategoryScreen,extra: childrenList![index]),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w,),
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Styles.text(childrenList![index].name??'No name',size: 13,color: Colors.white),
          ),
        ):GestureDetector(
          onTap: () {
            AppRouter.router.push(AppRouter.catTemp2,extra: categoriesList![index]);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w,),
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Styles.text(categoriesList![index].name??'No name',size: 13,color: Colors.white),
          ),
        ),
        ),
      ),
    );
  }
}
