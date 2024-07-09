import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/general_widgets/removed_price.dart';

import '../core/design/app_styles.dart';
import '../core/models/category_model/Product.dart';

class ItemPriceRow extends StatelessWidget {
  const ItemPriceRow({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    // bool checkPrice= product.hasCampaign??false;
    bool checkPrice= product.discountPrice!=null&&product.discountPrice!=0;
    return SizedBox(
      height: 20.h,
      child: Row(
        children: [
          Styles.text('${checkPrice? product.discountPrice : product.salePrice} ${Texts.currency}',color: Styles.primary,size: 13),
          SizedBox(width: 5.w,),
          if(checkPrice)RemovedPrice(removedPrice: product.salePrice??0),
        ],
      ),
    );
  }
}
