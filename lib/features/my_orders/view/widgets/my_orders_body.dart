import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/my_orders/logic/orders_cubit.dart';
import 'package:hanot/features/my_orders/view/widgets/my_orders_nav_row.dart';
import 'package:hanot/features/my_orders/view/widgets/order_container.dart';
import 'package:hanot/features/my_orders/view/widgets/search_app_bar.dart';
import '../../../../core/design/widgets.dart';
import '../../../cart/view/widgets/cart_appBar.dart';
import 'orders_empty_body.dart';

class MyOrdersBody extends StatefulWidget {
  const MyOrdersBody({Key? key}) : super(key: key);

  @override
  State<MyOrdersBody> createState() => _MyOrdersBodyState();
}

class _MyOrdersBodyState extends State<MyOrdersBody> {
  late OrdersCubit ordersCubit;
  @override
  void initState() {
    ordersCubit = BlocProvider.of<OrdersCubit>(context);
    ordersCubit.getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const CartAppBar(),
        bottom: PreferredSize(
          preferredSize: Size(0, 50.h),
          child: const SearchAppBar(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          const MyOrdersNavRow(),
          SizedBox(
            height: 10.h,
          ),
          BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
            if (state is OrdersSuccess) {
              return state.orders.data == null
                  ? const OrdersEmptyBody()
                  : Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        itemCount: state.orders.data!.length,
                        itemBuilder: (context, index) {
                          var day = DateFormat.d().format(DateTime.parse(state
                              .orders.data![index].createdAt!
                              .split(' | ')
                              .first));
                          var month = DateFormat.MMMM('ar').format(
                              DateTime.parse(state
                                  .orders.data![index].createdAt!
                                  .split(' | ')
                                  .first));
                          var year = DateFormat.y().format(DateTime.parse(state
                              .orders.data![index].createdAt!
                              .split(' | ')
                              .first));
                          var time = state.orders.data![index].createdAt!
                              .split(' | ')
                              .last;
                          return OrderContainer(
                            statusName: state.orders.data![index].statusName,
                            color: state.orders.data![index].statusColor!.color,
                            day: day,
                            month: month,
                            year: year,
                            time: time,
                          );
                        },
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
          }),
        ],
      ),
    );
  }
}
