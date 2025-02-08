import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../core/design/app_styles.dart';
import '../core/models/category_model/Product.dart';
import 'item_card.dart';

class RelatedProductsList extends StatelessWidget {
  const RelatedProductsList({Key? key, required this.relatedList}) : super(key: key);
  final List<Product> relatedList;
  @override
  Widget build(BuildContext context) {
    var lang = BlocProvider.of<LangCubit>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
            child: Styles.text(lang.texts['mobile_related_products_label']),
          ),
          SizedBox(height: 10.h,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: List.generate(relatedList.length, (index) => Container(
                width: 170.w,
                margin: EdgeInsets.symmetric(horizontal: 6.w),
                child: ItemCard(product: relatedList[index],navFromSheet: true,),
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
