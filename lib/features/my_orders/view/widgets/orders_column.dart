import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hanot/features/my_orders/view/widgets/order_container.dart';

import '../../../../core/design/widgets.dart';
import '../../data/models/orders_model.dart';

class OrdersColumn extends StatelessWidget {
  const OrdersColumn({
    super.key,
    required this.dataList,
    required this.last,
  });

  final List<Order> dataList;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(dataList.length, (index) {
            var day = DateFormat.d().format(
                DateTime.parse(dataList[index].createdAt!.split(' | ').first));
            var month = DateFormat.MMMM('ar').format(
                DateTime.parse(dataList[index].createdAt!.split(' | ').first));
            var year = DateFormat.y().format(
                DateTime.parse(dataList[index].createdAt!.split(' | ').first));
            var time = dataList[index].createdAt!.split(' | ').last;
            return OrderContainer(
              order: dataList[index],
              day: day,
              month: month,
              year: year,
              time: time,
            );
          }),
        ),
        SizedBox(height: 8.h),
        last || dataList.length <= 4 ? const SizedBox() : loadingIndicator(),
      ],
    );
  }
}
