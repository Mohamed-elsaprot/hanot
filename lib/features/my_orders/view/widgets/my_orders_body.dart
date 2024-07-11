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
import '../../data/models/orders_model.dart';
import 'orders_empty_body.dart';

class MyOrdersBody extends StatefulWidget {
  const MyOrdersBody({Key? key}) : super(key: key);

  @override
  State<MyOrdersBody> createState() => _MyOrdersBodyState();
}

class _MyOrdersBodyState extends State<MyOrdersBody> {
  late OrdersCubit ordersCubit;
  late final ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    ordersCubit = BlocProvider.of<OrdersCubit>(context);
    ordersCubit.getCurrentOrders();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        ordersCubit.getCurrentNextOrders(context);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    ordersCubit.resetLastValue();
    super.dispose();
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
          BlocBuilder<OrdersCubit, OrdersState>(
            buildWhen: (previous, current) => current is NavChanged,
            builder: (context, state) {
              return const MyOrdersNavRow();
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          BlocBuilder<OrdersCubit, OrdersState>(
            buildWhen: (previous, current) => current is NavChanged,
            builder: (context, state) {
              return ordersCubit.orderNavIsSelected == 1
                  ? const Center(
                      child: OrdersEmptyBody(),
                    )
                  : BlocBuilder<OrdersCubit, OrdersState>(
                      buildWhen: (previous, current) =>
                          current is OrdersSuccess ||
                          current is OrdersFailure ||
                          current is OrdersLoading,
                      builder: (context, state) {
                        if (state is OrdersSuccess) {
                          return state.orders.data == null
                              ? const OrdersEmptyBody()
                              : Expanded(
                                  child: ListView(
                                    physics: const BouncingScrollPhysics(),
                                    controller: scrollController,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: OrdersColumn(
                                          dataList: state.orders.data!,
                                          last: ordersCubit.last,
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
            },
          ),
        ],
      ),
    );
  }
}

class OrdersColumn extends StatelessWidget {
  const OrdersColumn({
    super.key,
    required this.dataList,
    required this.last,
  });

  final List<Data> dataList;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(dataList.length, (index) {
            var day = DateFormat.d().format(
                DateTime.parse(dataList[index].createdAt!.split(' | ').first));
            var month = DateFormat.MMMM('ar').format(
                DateTime.parse(dataList[index].createdAt!.split(' | ').first));
            var year = DateFormat.y().format(
                DateTime.parse(dataList[index].createdAt!.split(' | ').first));
            var time = dataList[index].createdAt!.split(' | ').last;
            return OrderContainer(
              statusName: dataList[index].statusName,
              color: dataList[index].statusColor!.color,
              day: day,
              month: month,
              year: year,
              time: time,
            );
          }),
        ),
        SizedBox(height: 8.h),
        !last ? loadingIndicator() : Container(),
      ],
    );
  }
}
