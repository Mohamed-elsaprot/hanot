import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/widgets_fun.dart';
import '../../manager/counter_cubit/counter_cubit.dart';
import '../../manager/counter_cubit/counter_state.dart';
import '../../models/CartProductModel.dart';

class ProductCountContainer extends StatelessWidget {
  const ProductCountContainer({Key? key, required this.cartProductModel}) : super(key: key);
  final CartProductModel cartProductModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>( builder: (context, st) {
      if (st is CounterLoading) {
        return Container(
            height: 35.w,width: 45.w,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black12)
            ),
            child: loadingIndicator(rad: 10));
      } else {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black12)
          ),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 35.w,width: 45.w,
          alignment: Alignment.center,
          child: FittedBox(
            child: Text(
              cartProductModel.qty!.toString(),
              style: TextStyle(fontSize: 16.sp, color: Colors.black87,fontWeight: FontWeight.w900),
            ),
          ),
        );
      }
    });
  }
}
