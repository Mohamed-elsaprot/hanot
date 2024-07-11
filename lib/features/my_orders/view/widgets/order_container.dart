import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/features/my_orders/data/models/orders_model.dart';

import '../../../../consts.dart';
import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer(
      {Key? key,
      required this.day,
      required this.month,
      required this.year,
      required this.time, required this.order})
      : super(key: key);

  final String?  day, month, year, time;
  final Order order;
  @override
  Widget build(BuildContext context) {
    print(order.id);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r), color: Colors.white),
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                Images.orderIcon,
                width: 40.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Styles.text('رقم الطلب : ${order.id}'),
                  SizedBox(
                    height: 4.h,
                  ),
                  Styles.subTitle(
                      'تاريخ الطلب : $day $month $year - $time صباحاً',
                      size: 11),
                ],
              )
            ],
          ),
          Divider(
            height: 40.h,
          ),
          Row(
            children: [
              Styles.text('حالة الطلب : ', color: Colors.black54, size: 12),
              Styles.text(order.statusName??'state name', size: 12, color: HexColor.fromHex(order.statusColor!.color!)),//
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    AppRouter.router.push(AppRouter.orderDetails,
                        extra:<String?> [order.statusName, order.statusColor!.color!, day, month, year, time]);
                  },
                  child: Styles.text('عرض التفاصيل', size: 12)),
            ],
          )
        ],
      ),
    );
  }
}
