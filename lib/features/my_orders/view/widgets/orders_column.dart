import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hanot/features/my_orders/view/widgets/order_container.dart';

import '../../../../core/design/widgets_fun.dart';
import '../../data/models/orders_model.dart';

class OrdersColumn extends StatelessWidget {
  const OrdersColumn({
    super.key,
    required this.dataList,
    required this.last, required this.isPrev,
  });

  final List<MyOrderModel> dataList;
  final bool last,isPrev;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(dataList.length, (index) {
            return OrderContainer(order: dataList[index], inDetailsScreen: false,);
          }),
        ),
        SizedBox(height: 8.h),
        if(isPrev)last || dataList.length <= 9 ? const SizedBox() : loadingIndicator(),
      ],
    );
  }
}
