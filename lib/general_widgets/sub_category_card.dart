import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/router.dart';

import '../core/design/app_styles.dart';
import '../core/design/widgets.dart';
import '../features/categories/model/category_details/Children.dart';

class SubCategoryCard extends StatelessWidget {
  const SubCategoryCard({Key? key, this.childrenImage, this.childrenName, required this.children}) : super(key: key);
  final String? childrenImage,childrenName;
  final Children children;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppRouter.router.push(AppRouter.subCategoryScreen,extra: children);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.  h),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: cachedImage(childrenImage??'',height: 120,width: 200)),
          ),
          Styles.subTitle(childrenName??'No Name',size: 15)
        ],
      ),
    );
  }
}
