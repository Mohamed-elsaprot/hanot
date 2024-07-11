import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/my_orders/data/repositories/orders_repo.dart';

import '../../../core/design/fun.dart';
import '../data/models/orders_model.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  late OrdersRepo ordersRepo;
  late OrdersModel orderModel;
  int orderNavIsSelected = 0;
  bool last = false;

  OrdersCubit({required this.ordersRepo}) : super(OrdersInitial());

  void changeOrderNav({required int index}) {
    orderNavIsSelected = index;
    emit(NavChanged());
  }

  void resetLastValue() {
    last = false;
  }

  Future<void> getCurrentOrders() async {
    emit(OrdersLoading());
    try {
      var result = await ordersRepo.getCurrentOrders();
      result.fold((failure) {
        emit(OrdersFailure(errorMessage: failure.errorMessage));
      }, (ordersModel) {
        orderModel = ordersModel;
        emit(OrdersSuccess(orders: ordersModel));
      });
    } catch (e) {
      emit(OrdersFailure(errorMessage: e.toString()));
    }
  }

  Future<void> getCurrentNextOrders(BuildContext context) async {
    if (orderModel.nextPageUrl != null) {
      List<Order> cache = orderModel.ordersList!;
      var res = await ordersRepo.getCurrentNextPageOrders(
          link: orderModel.nextPageUrl!);
      res.fold((failure) {
        errorDialog(context: context, message: failure.errorMessage);
      }, (ordersModel) {
        cache.addAll(ordersModel.ordersList!);
        orderModel =
            orderModel.copyWith(next: ordersModel.nextPageUrl, list: cache);
      });
    } else {
      last = true;
    }
    emit(OrdersSuccess(orders: orderModel));
  }
}
