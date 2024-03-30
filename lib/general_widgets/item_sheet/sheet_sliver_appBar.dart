import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/design/widgets.dart';
import '../../features/tabs_screen/model/category_model/Product.dart';
import 'sheet_app_bar.dart';

class SheetSliverAppBar extends StatelessWidget {
  const SheetSliverAppBar({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: const SizedBox(),
      flexibleSpace: Stack(
        children: [
          SizedBox(
              width: double.infinity,height: double.infinity,
              child: cachedImage(product.image!)
          ),
          const SheetAppBar()
        ],
      ),
      expandedHeight: 370.h,
    );
  }
}
