import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/tabs_screen/model/category_model/Product.dart';

import '../core/design/app_styles.dart';

class ItemPriceRow extends StatelessWidget {
  const ItemPriceRow({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Styles.text('${product.salePrice ?? product.costPrice} PLN',size: 13),
        SizedBox(width: 5.w,),
        if(product.salePrice!=null&&product.salePrice!=product.costPrice)Stack(
          children: [
            SizedBox(
              width: 50,height: 20,
              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Styles.subTitle('${product.costPrice} PLN',size: 16)
              ),
            ),
            Positioned(
              bottom: 9,
              child: Container(
                margin: const EdgeInsets.only(left: 6),
                color: Colors.black38,height: 1,width: 70,
              ),
            )
          ],
        ),
      ],
    );
  }
}
