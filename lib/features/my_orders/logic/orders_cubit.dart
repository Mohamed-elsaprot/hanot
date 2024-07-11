import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hanot/features/my_orders/data/repositories/orders_repo.dart';
import 'package:meta/meta.dart';

import '../../../core/design/fun.dart';
import '../data/models/orders_model.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  late OrdersRepo ordersRepo;
  late OrdersModel orderModel;
  bool last = false;

  OrdersCubit({required this.ordersRepo}) : super(OrdersInitial());

  Future<void> getOrders() async {
    emit(OrdersLoading());
    try {
      var result = await ordersRepo.getOrders();

      result.fold((failure) {
        emit(OrdersFailure(errorMessage: failure.errorMessage));
      }, (ordersModel) {
        orderModel = ordersModel;
        log('${ordersModel.data}');
        emit(OrdersSuccess(orders: ordersModel));
      });
    } catch (e) {
      emit(OrdersFailure(errorMessage: e.toString()));
    }
  }

  Future<void> getNextOrders(BuildContext context) async {
    if (orderModel.nextPageUrl != null) {
      log(orderModel.nextPageUrl!);
      List<Data> cache = orderModel.data!;
      var res =
          await ordersRepo.getNextPageOrders(link: orderModel.nextPageUrl!);
      res.fold((failure) {
        errorDialog(context: context, message: failure.errorMessage);
      }, (ordersModel) {
        cache.addAll(ordersModel.data!);
        orderModel = orderModel.copyWith(links: ordersModel.links, list: cache);
      });
    } else {
      last = true;
    }
    emit(OrdersSuccess(orders: orderModel));
  }
}
