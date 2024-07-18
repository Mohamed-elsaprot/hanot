import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/my_orders/view/widgets/orders_column.dart';
import 'package:hanot/features/my_orders/view/widgets/orders_empty_body.dart';

import '../../../core/design/app_styles.dart';
import '../../../core/design/fun.dart';
import '../../../core/design/widgets.dart';
import '../manager/orders_cubit.dart';

class CurrentOrders extends StatelessWidget {
  const CurrentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
        listener: (BuildContext context, OrdersState state) {
          if(state is OrdersFailure) errorDialog(context: context, message: state.errorMessage);
        },
        buildWhen: (previous, current) =>
        current is OrdersSuccess ||
            current is OrdersFailure ||
            current is OrdersLoading,
        builder: (context, state) {
          if (state is OrdersSuccess) {
            return state.currentOrders!.isEmpty ? const Expanded(child: OrdersEmptyBody())
                : Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: OrdersColumn(
                      dataList: state.currentOrders!,
                      last: false,isPrev: false,
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
        });
  }
}
