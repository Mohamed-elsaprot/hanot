import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/my_orders/view/widgets/my_orders_nav_row.dart';
import 'package:hanot/features/my_orders/view/widgets/order_container.dart';
import 'package:hanot/features/my_orders/view/widgets/search_app_bar.dart';

import '../../../cart/view/widgets/cart_appBar.dart';
import 'orders_empty_body.dart';

class MyOrdersBody extends StatefulWidget {
  const MyOrdersBody({Key? key}) : super(key: key);

  @override
  State<MyOrdersBody> createState() => _MyOrdersBodyState();
}

class _MyOrdersBodyState extends State<MyOrdersBody> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, title: const CartAppBar(),
        bottom: PreferredSize(preferredSize: Size(0, 50.h), child: const SearchAppBar(),),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h,),
          const MyOrdersNavRow(),
          SizedBox(height: 10.h,),
          // Expanded(
          //     child: ListView.builder(
          //       padding: EdgeInsets.symmetric(vertical: 10.h),
          //       itemCount: 5,
          //       itemBuilder: (context, index) {
          //         return OrderContainer(index:index,);
          //   },
          // )),
          const OrdersEmptyBody(),
        ],
      ),
    );
  }
}
