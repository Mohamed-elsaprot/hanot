import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/images.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/features/my_orders/view/widgets/order_container.dart';
import 'package:hanot/features/order_details/view/widgets/order_loc_container.dart';
import 'package:hanot/features/order_details/view/widgets/order_price_container.dart';
import 'package:hanot/features/order_details/view/widgets/order_products_container.dart';
import 'package:hanot/features/order_details/view/widgets/order_state_container.dart';
import 'package:hanot/general_widgets/custom_button.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secScaffoldColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: ()=>AppRouter.router.pop(), icon: const Icon(Icons.arrow_back_ios_rounded)),
        title: Styles.text('تفاصيل الطلب'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Column(
          children: [
            OrderStateContainer(),
            OrderContainer(index: 0),
            OrderLocContainer(),
            OrderProductsContainer(),
            OrderPriceContainer()
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: CustomButton(
          rad: 100,backGroundColor: Colors.red,
          title: 'الغاء الطلب',
          fun: (){},
        ),
      ),
    );
  }
}
