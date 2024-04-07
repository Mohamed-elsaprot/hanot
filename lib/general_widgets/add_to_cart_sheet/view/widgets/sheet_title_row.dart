import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../features/tabs_screen/model/category_model/Product.dart';

class SheetTitleRow extends StatelessWidget {
  const SheetTitleRow({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Styles.text(product.name??'No Name',size: 15,color: Colors.black45),
        SizedBox(width: 20.w,),
        const Icon(Icons.share_rounded,color: Colors.black45,)
      ],
    );
  }
}
