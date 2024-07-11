import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../logic/orders_cubit.dart';

class MyOrdersNavRow extends StatefulWidget {
  const MyOrdersNavRow({
    Key? key,
  }) : super(key: key);

  @override
  State<MyOrdersNavRow> createState() => _MyOrdersNavRowState();
}

class _MyOrdersNavRowState extends State<MyOrdersNavRow> {
  @override
  Widget build(BuildContext context) {
    var orderCubit = BlocProvider.of<OrdersCubit>(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r), color: Colors.white),
      padding: const EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          navItem('الجارية', orderCubit.orderNavIsSelected == 0, () {
            setState(() {});
            orderCubit.orderNavIsSelected == 1
                ? orderCubit.getCurrentOrders()
                : null;
            orderCubit.orderNavIsSelected == 1
                ? orderCubit.resetLastValue()
                : null;
            orderCubit.changeOrderNav(index: 0);
          }),
          navItem('السابقة', orderCubit.orderNavIsSelected == 1, () {
            setState(() {});
            orderCubit.changeOrderNav(index: 1);
          }),
        ],
      ),
    );
  }

  navItem(String title, bool sel, void Function() fun) {
    return Expanded(
      child: GestureDetector(
        onTap: fun,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: sel ? Styles.primary : Colors.white),
          child: Styles.text(title,
              size: 14, color: sel ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
