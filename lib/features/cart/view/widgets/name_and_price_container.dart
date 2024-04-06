import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../models/CartProductModel.dart';

class NameAndPriceContainer extends StatelessWidget {
  const NameAndPriceContainer({Key? key, required this.product}) : super(key: key);
  final CartProductModel product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              alignment: Alignment.centerRight,
              width: 230.w,height: 70.h, child: Styles.subTitle(product.name??'',size: 16,color: Colors.black54)),
          product.salePrice!=0||product.salePrice!=null?Row(
            children: [
              Styles.subTitle('${product.salePrice} PLN',size: 14,color: Colors.red.shade300),
              SizedBox(width: 5.w,),
              Stack(
                children: [
                  SizedBox(
                    width: 70.w,height: 20.h,
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Styles.subTitle('${product.netTotal} PLN',color: Colors.black45,size: 18)
                    ),
                  ),
                  Positioned(
                    bottom: 9.5.h,
                    child: Container(
                      color: Colors.black38,height: 1,width: 70.w,
                    ),
                  )
                ],
              ),
            ],
          ):Styles.subTitle('${product.salePrice} PLN',size: 14,color: Colors.red.shade300),
        ],
      ),
    );
  }
}
