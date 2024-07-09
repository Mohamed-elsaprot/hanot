import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/widgets.dart';
import '../../../../core/models/category_model/Product.dart';
import '../../../../general_widgets/rating_stars.dart';

class NewProducts extends StatelessWidget {
  const NewProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 6.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Styles.text('احدث المنتجات',size: 19),
              Styles.text('عرض الكل',color: Styles.primary,size: 14),
            ],
          ),
          ...List.generate(4, (index) => Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                cachedImage(height: 100,width: 100,'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEihCYQw_1A6so6gt4KCWCXUOJd2Wq5N-fO8lQ4OTHGU3fEuBf05i5wFp0QB3_XiJZC6b8jYBDMtJufia4erF1sg6hCik5QukWfeTtkwfRx96esaJEAZTjak9c88SRJsxw7_JqtvKnnViD-AFLui-n_DYT_TpFR9EXB9kGAbsIev9ctB2eXRadgq8t9Ztg/s600/83016ea9b5dd1c2c836c44d46a91ae38f5f2956f.gif',rad: 8),
                SizedBox(width: 10.w,),
                SizedBox(
                  height: 110.h,
                  width: 265.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h,),
                      Styles.text('موبايل ابل ايفون 15 برو ماكس',overflow: TextOverflow.ellipsis),
                      SizedBox(height: 12.h,),
                      Styles.subTitle('الاخبار والمجلات',size: 13,overflow: TextOverflow.ellipsis),
                      SizedBox(height: 12.h,),
                      RatingStars(product: Product(),textColor: Colors.black45),
                      const Spacer(),
                      const Divider(height: 0,)
                    ],
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
