import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/models/category_model/Product.dart';

import '../../../../../core/design/widgets_fun.dart';
import '../../../../../features/home/view/widgets/banner_slider.dart';
import '../../../../fav_icon.dart';

class SheetSlider extends StatelessWidget {
  const SheetSlider({Key? key, required this.product, this.fromFavScreen=false}) : super(key: key);
  final Product product;
  final bool fromFavScreen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        product.images!=null&&product.images!.isNotEmpty?BannerSlider(images:product.images,):
        cachedImage(product.image??'',height: 480),
        PositionedDirectional(
            bottom: 10,end: 10,
            child: Column(
              children: [
                // Container(
                //     height: 45.sp,width: 45.sp,
                //     decoration: const BoxDecoration(shape: BoxShape.circle,color: Color(0xff3a8a7b)),
                //     child: const Icon(Icons.add_card_outlined,color: Colors.white,size: 26,)
                // ),
                // const SizedBox(height: 8,),
                Container(
                    height: 45.sp,width: 45.sp,
                    decoration: BoxDecoration(border: Border.all(),shape: BoxShape.circle),
                    child: FavIcon(product: product,iconSize: 28,fromFavScreen: fromFavScreen,)
                ),
              ],
            ).animate().slideX(begin: 5,duration: const Duration(milliseconds: 400),curve: Curves.ease)
        )
      ],
    );
  }
}
