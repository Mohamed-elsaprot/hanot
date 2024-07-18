import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/my_orders/data/models/orders_model.dart';
import 'package:hanot/features/my_orders/view/widgets/order_container.dart';
import 'package:hanot/features/order_details/manager/get_single_order_state.dart';
import 'package:hanot/features/order_details/manager/single_order_cubit.dart';
import 'package:hanot/features/order_details/view/widgets/order_loc_container.dart';
import 'package:hanot/features/order_details/view/widgets/order_price_container.dart';
import 'package:hanot/features/order_details/view/widgets/order_products_container.dart';
import 'package:hanot/features/order_details/view/widgets/order_state_container.dart';
import 'package:hanot/general_widgets/custom_button.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({Key? key, required this.orderId,}) : super(key: key);
  final int orderId;
  @override
  Widget build(BuildContext context) {
    var singleOrderCubit = BlocProvider.of<SingleOrderCubit>(context);
    return BlocConsumer<SingleOrderCubit,GetSingleOrderState>(
      buildWhen: (context,current)=> current is GetSingleOrderLoading || current is GetSingleOrderFailure || current is GetSingleOrderSuccess,
      builder: (context,state){
      if(state is GetSingleOrderSuccess){
        return Scaffold(
          backgroundColor: Styles.secScaffoldColor,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(onPressed: () => AppRouter.router.pop(), icon: const Icon(Icons.arrow_back_ios_rounded)), title: Styles.text('تفاصيل الطلب'),),
          body: RefreshIndicator(
            color: Styles.primary,
            onRefresh: ()async{
              singleOrderCubit.getSingleOrder(orderId: orderId);
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 40.h),
              child: Column(
                children: [
                  const OrderStateContainer(),
                  OrderContainer(order: singleOrderCubit.singleOrderModel.orderModel,inDetailsScreen: true,),
                  OrderLocContainer(orderModel: singleOrderCubit.singleOrderModel.orderModel,),
                  OrderProductsContainer(singleOrder: singleOrderCubit.singleOrderModel,),
                  OrderPriceContainer(singleOrder: singleOrderCubit.singleOrderModel,)
                ],
              ),
            ),
          ),
          // bottomNavigationBar: Padding(
          //   padding: const EdgeInsets.all(20),
          //   child: CustomButton(
          //     rad: 100,
          //     backGroundColor: Colors.red,
          //     title: 'الغاء الطلب',
          //     fun: () {},
          //   ),
          // ),
        );
      }else {
        return Scaffold(
        backgroundColor: Styles.secScaffoldColor,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(onPressed: () => AppRouter.router.pop(), icon: const Icon(Icons.arrow_back_ios_rounded)), title: Styles.text('تفاصيل الطلب'),),
          body: loadingIndicator(),
      );
      }
    },listener: (context,state){
      if(state is GetSingleOrderFailure){
        errorDialog(context: context, message: state.errorMessage);
      }
      if(state is GetSingleOrderSuccess) singleOrderCubit.getStates(orderId: orderId);
    },);
  }
}
