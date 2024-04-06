import 'package:flutter/material.dart';

import '../core/design/app_styles.dart';
import '../features/tabs_screen/model/category_model/Product.dart';

class RedSaleContainer extends StatelessWidget {
  const RedSaleContainer({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          color: Colors.red,
          child: Styles.subTitle('${product.discountPrice}%',
              size: 10, color: Colors.white),
        ));
  }
}
