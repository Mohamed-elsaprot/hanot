import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/widgets.dart';
import '../../../tabs_screen/model/category_model/Product.dart';
import '../../manager/cart_cubit.dart';
import 'counter_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.black12,)
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 70.w, child: cachedImage(product.image!,height: 100)),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      height: 100.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              alignment: Alignment.centerRight,
                              width: 230.w,height: 70.h, child: Styles.subTitle(product.name??'',size: 16,color: Colors.black54)),
                          product.costPrice!=product.salePrice?Row(
                            children: [
                              Styles.subTitle('${product.salePrice} PLN',size: 14,color: Colors.red.shade300),
                              SizedBox(width: 5.w,),
                              Stack(
                                children: [
                                  SizedBox(
                                    width: 70.w,height: 20.h,
                                    child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Styles.subTitle('${product.costPrice} PLN',color: Colors.black45,size: 18)
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
                    )
                  ],
                ),
                const Divider(color: Colors.black87,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCounterButton(product: product),
                    Styles.text('${product.salePrice!*product.count!} PLN'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.r)),
            ),
            padding: EdgeInsets.all(8.sp),
            child: InkWell(
              onTap:(){
                cartCubit.removeFromCart(product);
              },
              child: CircleAvatar(
                radius: 17,backgroundColor: Colors.red.shade400,
                child: const Icon(Icons.delete_outline,color: Colors.white,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
