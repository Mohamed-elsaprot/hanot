import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/my_orders/view/widgets/orders_column.dart';
import 'package:hanot/features/my_orders/view/widgets/orders_empty_body.dart';

import '../../../core/design/app_styles.dart';
import '../../../core/design/widgets.dart';
import '../manager/orders_cubit.dart';

class PrevOrders extends StatelessWidget {
  const PrevOrders({Key? key, required this.scrollController}) : super(key: key);
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    var ordersCubit = BlocProvider.of<OrdersCubit>(context);
    return BlocConsumer<OrdersCubit, OrdersState>(
        buildWhen: (previous, current) =>
        current is OrdersSuccess ||
            current is OrdersFailure ||
            current is OrdersLoading,
        builder: (context, state) {
          if (state is OrdersSuccess) {
            return state.prevOrdersModelRes!.ordersList!.isEmpty ? const Expanded(child: OrdersEmptyBody())
                : Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: OrdersColumn(
                      dataList: state.prevOrdersModelRes!.ordersList!,
                      last: ordersCubit.last,isPrev: true,
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is OrdersFailure) {
            return Expanded(
              child: Center(
                child: Styles.text(state.errorMessage),
              ),
            );
          } else {
            return Expanded(
              child: Center(
                child: loadingIndicator(),
              ),
            );
          }
        }, listener: (BuildContext context, OrdersState state) {
          if(state is OrdersFailure) errorDialog(context: context, message: state.errorMessage);
    },);
  }
}
