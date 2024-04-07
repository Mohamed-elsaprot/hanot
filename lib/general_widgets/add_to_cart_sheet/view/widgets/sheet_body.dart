import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/options_column.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/sheet_sliver_appBar.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/sheet_title_row.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../features/tabs_screen/model/category_model/Product.dart';


class SheetBody extends StatelessWidget {
  const SheetBody({Key? key,required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SheetSliverAppBar(product: product,),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                SheetTitleRow(product: product),
                SizedBox(height: 5.h,),
                Row(
                  children: [
                    Styles.text(product.salePrice!=null||product.salePrice!=0? '${product.salePrice} PLN':'${product.costPrice} PLN',size: 18,color: Colors.black),
                    SizedBox(width: 20.w,),
                  ],
                ),
                SizedBox(height: 8.h,),
                OptionsBody(product: product),
              ],
            ),
          ),
        )
      ],
    );
  }
}

// Styles.text('متوفر',color: Colors.green),
// SizedBox(
//     width: 260.w,
//     child: FittedBox(
//         fit: BoxFit.scaleDown,
//         child: Styles.text('هذا المنتج غير متوفر بهذه المواصفات حاليا',color: Colors.red))),
