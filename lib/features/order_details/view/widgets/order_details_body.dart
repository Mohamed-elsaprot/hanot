import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/features/my_orders/data/models/orders_model.dart';
import 'package:hanot/features/my_orders/view/widgets/order_container.dart';
import 'package:hanot/features/order_details/view/widgets/order_loc_container.dart';
import 'package:hanot/features/order_details/view/widgets/order_price_container.dart';
import 'package:hanot/features/order_details/view/widgets/order_products_container.dart';
import 'package:hanot/features/order_details/view/widgets/order_state_container.dart';
import 'package:hanot/general_widgets/custom_button.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody(
      {Key? key,
      // this.statusName,
      // this.color,
      // this.day,
      // this.month,
      // this.year,
      // this.time
      })
      : super(key: key);
  // final String? statusName, color, day, month, year, time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secScaffoldColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () => AppRouter.router.pop(),
            icon: const Icon(Icons.arrow_back_ios_rounded)),
        title: Styles.text('تفاصيل الطلب'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Column(
          children: [
            const OrderStateContainer(),
            OrderContainer(
              day: 'day',
              month: 'month',
              time: 'time',
              year: 'year', order: Order(id: 11111,statusColor: StatusColor(color: '#f55157')),
            ),
            const OrderLocContainer(),
            const OrderProductsContainer(),
            const OrderPriceContainer()
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomButton(
          rad: 100,
          backGroundColor: Colors.red,
          title: 'الغاء الطلب',
          fun: () {},
        ),
      ),
    );
  }
}
