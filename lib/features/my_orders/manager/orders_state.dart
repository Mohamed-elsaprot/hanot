part of 'orders_cubit.dart';

sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}
final class NavChanged extends OrdersState {}

final class OrdersSuccess extends OrdersState {
  final OrdersModelRes? prevOrdersModelRes;
  final List<MyOrderModel>? currentOrders;
  OrdersSuccess({ this.prevOrdersModelRes,this.currentOrders});
}

final class OrdersFailure extends OrdersState {
  final String errorMessage;
  OrdersFailure({required this.errorMessage});
}

final class OrdersLoading extends OrdersState {}
