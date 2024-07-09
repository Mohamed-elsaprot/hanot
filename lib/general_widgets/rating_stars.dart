import 'package:flutter/material.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/models/single_product_model/SingleProductModel.dart';

import '../core/models/category_model/Product.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({Key? key, this.product, this.textColor, this.textSize=13, this.iconSize=20, this.singleProductModel}) : super(key: key);
  final Product? product;
  final SingleProductModel? singleProductModel;
  final Color? textColor;
  final double textSize,iconSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star_rate_rounded,color: Colors.orange,size: iconSize,),
        const SizedBox(width: 1,),
        Text(3.4.toString(),style: TextStyle(fontWeight: FontWeight.w600,color: textColor??Colors.black,fontSize: textSize),),
      ],
    );
  }
}
