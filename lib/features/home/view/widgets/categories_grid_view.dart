import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/categories/model/SmallCategoryModel.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/router.dart';
import '../../../../core/design/widgets_fun.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({Key? key, required this.list}) : super(key: key);
  final List<SmallCategoryModel> list;
  @override
  Widget build(BuildContext context) {
    return list.length<8?
    SizedBox(
      height: 130.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(list.length, (index)=>GestureDetector(
            onTap: ()=>AppRouter.router.push(AppRouter.categoryProducts,extra: list[index]),
            child: Padding(
              padding: EdgeInsets.all(5.sp),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 46,backgroundColor: Colors.grey.shade200,
                    child: cachedImage(rad: 80,height: 110,width: 110,list[index].image??'',boxFit: BoxFit.cover),
                  ),
                  const SizedBox(height: 6,),
                  Styles.text('${list[index].name!}'??'',maxLines: 2,overflow: TextOverflow.ellipsis,size: 12,textAlign: TextAlign.center,fontWeight: FontWeight.w500)
                ],
              ),
            ),
          )),
        ),
      ),
    ):
    SizedBox(
      height: 255.h,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 4),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 100.w,
              // crossAxisSpacing: 0,mainAxisSpacing: 0
          ),
          itemCount: list.length,
          itemBuilder: (context,index)=> GestureDetector(
            onTap: ()=>AppRouter.router.push(AppRouter.categoryProducts,extra: list[index]),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 46,backgroundColor: Colors.grey.shade200,
                  child: cachedImage(rad: 80,height: 110,width: 110,list[index].image??'',boxFit: BoxFit.cover),
                ),
                const SizedBox(height: 6,),
                Styles.text('${list[index].name!}'??'',maxLines: 2,overflow: TextOverflow.ellipsis,size: 12,textAlign: TextAlign.center,fontWeight: FontWeight.w500)
              ],
            ),
          )
      ),
    );
  }
}
