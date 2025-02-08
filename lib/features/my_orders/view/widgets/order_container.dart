import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/features/my_orders/data/models/orders_model.dart';

import '../../../../consts.dart';
import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';
import '../../../lang/manager/lang_cubit.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({Key? key, required this.order, required this.inDetailsScreen}) : super(key: key);
  final bool inDetailsScreen;
  final MyOrderModel order;
  @override
  Widget build(BuildContext context) {
    var langCubit = BlocProvider.of<LangCubit>(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r), color: Colors.white,
          boxShadow: const [BoxShadow(offset: Offset(2, 4),color: Colors.black12,blurRadius: 6)]

      ),
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(Images.orderIcon, width: 40.w,),
              SizedBox(width: 10.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Styles.text('${langCubit.texts['mobile_order_number_label']} : ${order.id}'),
                  SizedBox(height: 4.h,),
                  Styles.subTitle('${langCubit.texts['mobile_order_date_label']} : ${order.createdAt}', size: 11),
                ],
              )
            ],
          ),
          Divider(height: 40.h,),
          Row(
            children: [
              Styles.text('${langCubit.texts['mobile_order_status_label']} : ', color: Colors.black54, size: 12),
              Styles.text(order.statusName??'state name', size: 12, color: HexColor.fromHex(order.statusColor!)),//
              const Spacer(),
              if(!inDetailsScreen)GestureDetector(
                  onTap: () {
                    AppRouter.router.push(AppRouter.orderDetails, extra: order.id);
                  },
                  child: Styles.text(langCubit.texts['mobile_preview_order_label'], size: 12)),
            ],
          )
        ],
      ),
    );
  }
}
