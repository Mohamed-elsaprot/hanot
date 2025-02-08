import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class OrdersEmptyBody extends StatelessWidget {
  const OrdersEmptyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = BlocProvider.of<LangCubit>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Images.ordersEmpty,width: 200.w,),
        Styles.text(lang.texts['mobile_current_orders_not_available_label'],size: 18),
        SizedBox(height: 10.h,),
        SizedBox(
            width: 350.w,
            child: Styles.subTitle(lang.texts['mobile_current_order_not_available_capture'],size: 14,textAlign: TextAlign.center)),
      ],
    );
  }
}
