import 'package:flutter/material.dart';
import 'package:hanot/features/order_details/view/widgets/order_details_body.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails(
      {Key? key,
      // required this.statusName,
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
    return OrderDetailsBody(
      // color: color,
      // statusName: statusName,
      // day: day,
      // month: month,
      // year: year,
      // time: time,
    );
  }
}
