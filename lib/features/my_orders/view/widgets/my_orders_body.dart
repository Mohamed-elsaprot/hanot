import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/my_orders/view/current_orders.dart';
import 'package:hanot/features/my_orders/view/prev_orders.dart';
import 'package:hanot/features/my_orders/view/widgets/my_orders_nav_row.dart';
import '../../manager/orders_cubit.dart';
import 'orders_empty_body.dart';

class MyOrdersBody extends StatefulWidget {
  const MyOrdersBody({Key? key}) : super(key: key);

  @override
  State<MyOrdersBody> createState() => _MyOrdersBodyState();
}

class _MyOrdersBodyState extends State<MyOrdersBody> {
  late OrdersCubit ordersCubit;
  late AuthCubit authCubit;
  late final ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    ordersCubit = BlocProvider.of<OrdersCubit>(context);
    authCubit = BlocProvider.of<AuthCubit>(context);
    ordersCubit.orderNavIsSelected==0? ordersCubit.getCurrentOrders(context): ordersCubit.getPrevOrders(context);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        ordersCubit.getPrevNextOrders(context);
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
      body:authCubit.isAuth? Column(
        children: [
          SizedBox(height: 20.h,),
          BlocBuilder<OrdersCubit, OrdersState>(
            buildWhen: (previous, current) => current is NavChanged,
            builder: (context, state) {
              return const MyOrdersNavRow();
            },
          ),
          SizedBox(height: 10.h,),
          BlocBuilder<OrdersCubit, OrdersState>(
            buildWhen: (previous, current) => current is NavChanged,
            builder: (context, state) {
              return ordersCubit.orderNavIsSelected == 1 ?
              PrevOrders(scrollController: scrollController,) : const CurrentOrders();
            },
          ),
        ],
      ):const Center(child: OrdersEmptyBody()),
    );
  }
}
