import 'package:hanot/features/my_orders/data/models/orders_model.dart';
import 'package:hanot/features/order_details/models/SingleOrderDetails.dart';

class SingleOrder{
  final MyOrderModel orderModel;
  final List<SingleOrderItem> detailsList;
  SingleOrder( {
   required this.orderModel,
    required this.detailsList,
});
}