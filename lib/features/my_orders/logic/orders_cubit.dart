import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hanot/features/my_orders/data/repositories/orders_repo.dart';
import 'package:meta/meta.dart';

import '../data/models/orders_model.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  late OrdersRepo ordersRepo;
  OrdersCubit({required this.ordersRepo}) : super(OrdersInitial());

  Future<void> getOrders() async {
    emit(OrdersLoading());
    try {
      var result = await ordersRepo.getOrders();

      result.fold((failure) {
        emit(OrdersFailure(errorMessage: failure.errorMessage));
      }, (ordersModel) {
        log('${ordersModel.data}');
        emit(OrdersSuccess(orders: ordersModel));
      });
    } catch (e) {
      emit(OrdersFailure(errorMessage: e.toString()));
    }
  }
}
