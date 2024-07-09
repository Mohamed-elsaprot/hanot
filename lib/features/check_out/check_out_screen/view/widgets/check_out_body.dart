import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/payment_methods_container.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/price_container.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/shipping_container.dart';

import 'address_container.dart';
import 'complete_order_Container.dart';
import 'coupon_container.dart';
import 'note_container.dart';

class CheckOutBody extends StatelessWidget {
  const CheckOutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: customAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              AddressContainer(),
              SizedBox(height: 10.h,),
              ShippingContainer(),
              SizedBox(height: 10.h,),
              PaymentMethodsContainer(),
              SizedBox(height: 10.h,),
              CouponContainer(),
              SizedBox(height: 10.h,),
              NoteContainer(),
              SizedBox(height: 10.h,),
              PriceContainer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CompleteOrderContainer(),
    );
  }
}
