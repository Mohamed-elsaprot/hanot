import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:hanot/features/categories/category_products_screen/view/category_products_screen.dart';
import 'package:hanot/features/categories/data/single_category_repo/single_category_repo_impl.dart';
import 'package:hanot/features/categories/model/SmallCategoryModel.dart';
import 'package:hanot/features/check_out/check_out_screen/data/check_out_repo/check_out_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/data/coupon_repo/coupon_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/data/payment_method_repo/payment_method_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/check_out_cubit/check_out_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/note_cubit/note_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/payment_method_cubit/payment_method_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/view/check_out_screen.dart';
import 'package:hanot/features/favorites/view/favorites_screen.dart';
import 'package:hanot/features/order_details/view/order_details.dart';
import 'package:hanot/features/payment_web_view/data/get_payment_link_repo_impl.dart';
import 'package:hanot/features/payment_web_view/manager/get_payment_link_cubit.dart';
import 'package:hanot/features/sub_category_screen/manager/sub_category_cubit.dart';
import 'package:hanot/features/sub_category_screen/view/sub_category_screen.dart';
import 'package:hanot/features/navigation_screen/view/navigation_screen.dart';

import '../../features/categories/data/small_category_model/small_category_repo_impl.dart';
import '../../features/categories/manager/small_category_cubit/small_category_cubit.dart';
import '../../features/categories/manager/small_category_products_cubit/small_category_products_cubit.dart';
import '../../features/categories/model/category_details/Children.dart';
import '../../features/home/data/home_data_repo_impl.dart';
import '../../features/home/manager/home_cubit.dart';
import '../../features/my_orders/data/repositories/orders_repo.dart';
import '../../features/my_orders/logic/orders_cubit.dart';
import '../data/get_category_products_repo/products_repo_impl.dart';
import '../data/next_page_products_repo/next_page_products_repo_impl.dart';

abstract class AppRouter {
  static const categoryProducts = '/categoryProducts';
  static const subCategoryScreen = '/subCategoryScreen';
  static const checkOutScreen = '/checkOutScreen';
  static const allOldAddressesScreen = '/allOldAddressesScreen';
  static const favScreen = '/favScreen';
  static const orderDetails = '/orderDetails';

  // static const paymentWebView = '/paymentWebView';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeCubit(HomeDataRepoImpl())..getHomeData()
            ),
            BlocProvider(
              create: (context) =>    SmallCategoryCubit(SmallCategoryRepoImpl())..getSmallCategories(),
            ),
            BlocProvider(
              create: (context) =>  OrdersCubit(ordersRepo: OrdersRepo()),
            ),
          ],
          child: const NavigationScreen(),
        );
      },
    ),
    GoRoute(
      path: categoryProducts,
      builder: (BuildContext context, GoRouterState state) {
        var model = state.extra as SmallCategoryModel;
        return BlocProvider(
          create: (context) => SmallCategoryProductsAndChildrenCubit(
              ProductsRepoImpl(),
              NextPageProductsRepoImpl(),
              SingleCategoryRepoImpl())
            ..getCategoryProducts(catId: model.id.toString()),
          child: CategoryProductsScreen(smallCategoryModel: model),
        );
      },
    ),
    GoRoute(
      path: subCategoryScreen,
      builder: (BuildContext context, GoRouterState state) {
        Children children = state.extra as Children;
        return BlocProvider(
          create: (context) =>
              SubCategoryCubit(ProductsRepoImpl(), NextPageProductsRepoImpl())
                ..getCategoryProducts(subCatId: children.id.toString()),
          child: SubCategoryScreen(
            children: children,
          ),
        );
      },
    ),
    GoRoute(
      path: checkOutScreen,
      builder: (BuildContext context, GoRouterState state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => CheckOutCubit(CheckOutRepoImpl())),
            BlocProvider(
                create: (context) =>
                    GetPaymentLinkCubit(GetPaymentLinkRepoImpl())),
            BlocProvider(
                create: (context) => PaymentMethodCubit(PaymentMethodRepoImpl())
                  ..getPaymentMethods(context: context)),
            BlocProvider(
              create: (context) => NoteCubit(),
            ),
            BlocProvider(create: (context) => CouponCubit(CouponRepoImpl())),
          ],
          child: const CheckOutScreen(),
        );
      },
    ),
    GoRoute(
      path: favScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const FavoritesScreen();
      },
    ),
    GoRoute(
      path: orderDetails,
      builder: (BuildContext context, GoRouterState state) {
        var model = state.extra as List<String?>;
        return OrderDetails(
          statusName: model[0],
          color: model[1],
          day: model[2],
          month: model[3],
          time: model[5],
          year: model[4],
        );
      },
    ),
    // GoRoute(
    //   path: paymentWebView,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const PaymentWebView();
    //   },
    // ),
  ]);
}
