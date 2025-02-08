import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/models/single_product_model/SingleProductModel.dart';

import '../../../../core/design/widgets_fun.dart';
import 'sheet_title_row.dart';

class ProductDetailsContainer extends StatelessWidget {
  const ProductDetailsContainer({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      child: SheetTitleRow(),
    );
  }
}
