import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/order_details/data/get_single_order_repo.dart';
import 'package:hanot/features/order_details/data/get_states_repo.dart';
import 'package:hanot/features/order_details/manager/single_order_cubit.dart';
import 'package:hanot/features/order_details/view/widgets/order_details_body.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key, required this.orderId,}) : super(key: key);
  final int orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SingleOrderCubit(GetSingleOrderRepo(), GetStatesRepo())
            ..getSingleOrder(orderId: orderId),
      child: OrderDetailsBody(orderId: orderId,),
    );
  }
}
