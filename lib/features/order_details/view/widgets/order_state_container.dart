import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/design/widgets_fun.dart';

import '../../manager/get_single_order_state.dart';
import '../../manager/single_order_cubit.dart';
import 'order_state_item.dart';

class OrderStateContainer extends StatelessWidget {
  const OrderStateContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingleOrderCubit,GetSingleOrderState>(
        buildWhen: (context,current)=> current is GetStatesSuccess || current is GetStatesLoading || current is GetStatesFailure,
        builder: (context,state){
      if(state is GetStatesSuccess){
        var singleOrderCubit = BlocProvider.of<SingleOrderCubit>(context);
        return Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 15.h),
          padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w),
          height: 80.h,width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:List.generate(singleOrderCubit.statesList.length, (index)=>
                  OrderStateItem(
                    title: singleOrderCubit.statesList[index].statusName!,
                    colored: singleOrderCubit.singleOrderModel.orderModel.status!>=singleOrderCubit.statesList[index].status!,
                    color:  singleOrderCubit.statesList[index].color!,
                  ),
              ),
            ),
          ),
        );
      }else {
        return shimmerWidget(height: 65.h,width: double.infinity,margin:EdgeInsets.symmetric(vertical: 14.h) );
      }
    }, listener: (context,state){
      if(state is GetStatesFailure) errorDialog(context: context, message: state.errorMessage);
    });
  }
}


