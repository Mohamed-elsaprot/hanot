import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../lang/manager/lang_cubit.dart';
import '../../manager/orders_cubit.dart';

class MyOrdersNavRow extends StatefulWidget {
  const MyOrdersNavRow({Key? key,}) : super(key: key);

  @override
  State<MyOrdersNavRow> createState() => _MyOrdersNavRowState();
}

class _MyOrdersNavRowState extends State<MyOrdersNavRow> {
  @override
  Widget build(BuildContext context) {
    var orderCubit = BlocProvider.of<OrdersCubit>(context);
    var langCubit = BlocProvider.of<LangCubit>(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r), color: Colors.white),
      padding: const EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          navItem(langCubit.texts['mobile_new_button_label'], orderCubit.orderNavIsSelected == 0, () {
            orderCubit.orderNavIsSelected == 1 ? orderCubit.getCurrentOrders(context) : null;
            orderCubit.changeOrderNav(index: 0);
            setState(() {});
          }),
          navItem(langCubit.texts['mobile_prev_label'], orderCubit.orderNavIsSelected == 1, () {
            orderCubit.orderNavIsSelected == 0 ? orderCubit.getPrevOrders(context) : null;
            orderCubit.orderNavIsSelected == 0 ? orderCubit.resetLastValue() : null;
            orderCubit.changeOrderNav(index: 1);
            setState(() {});
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
