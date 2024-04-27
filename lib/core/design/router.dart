import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:hanot/features/categories/category_products_screen/view/category_products_screen.dart';
import 'package:hanot/features/categories/data/single_category_repo/single_category_repo_impl.dart';
import 'package:hanot/features/categories/model/SmallCategoryModel.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/data/all_addresses_repo_impl.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_addresses_cubit.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/view/all_old_addresses_screen.dart';
import 'package:hanot/features/check_out/check_out_screen/data/check_out_repo/check_out_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/data/coupon_repo/coupon_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/data/payment_method_repo/payment_method_repo.dart';
import 'package:hanot/features/check_out/check_out_screen/data/payment_method_repo/payment_method_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/data/shipping_companies_repo/shipping_companies_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/check_out_cubit/check_out_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/note_cubit/note_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/payment_method_cubit/payment_method_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_cubit.dart';
import 'package:hanot/features/check_out/payment_web_view/view/payment_web_vew.dart';
import 'package:hanot/features/sub_category_screen/manager/sub_category_cubit.dart';
import 'package:hanot/features/sub_category_screen/view/sub_category_screen.dart';
import 'package:hanot/features/tabs_screen/model/category_details/Children.dart';
import 'package:hanot/features/navigation_screen/view/navigation_screen.dart';

import '../../features/categories/manager/small_category_products_cubit/small_category_products_cubit.dart';
import '../../features/check_out/check_out_screen/view/check_out.dart';
import '../../features/tabs_screen/data/get_category_products_repo/products_repo_impl.dart';
import '../../features/tabs_screen/data/next_page_products_repo/next_page_products_repo_impl.dart';

abstract class AppRouter {
  static const categoryProducts = '/categoryProducts';
  static const subCategoryScreen = '/subCategoryScreen';
  static const checkOutScreen = '/checkOutScreen';
  static const allOldAddressesScreen = '/allOldAddressesScreen';

  // static const paymentWebView = '/paymentWebView';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const TabsScreen();
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
            BlocProvider(create: (context) => CheckOutCubit(CheckOutRepoImpl())),
            BlocProvider(create: (context) => ShippingCompaniesCubit(ShippingCompaniesRepoImpl())),
            BlocProvider(create: (context) => ShippingFeesCubit(ShippingCompaniesRepoImpl())),
            BlocProvider(create: (context) => PaymentMethodCubit(PaymentMethodRepoImpl())..getPaymentMethods(context: context)),
            BlocProvider(create: (context) => NoteCubit(),),
            BlocProvider(create: (context) => CouponCubit(CouponRepoImpl())),
          ],
          child: const CheckOut(),
        );
      },
    ),
    GoRoute(
      path: allOldAddressesScreen,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (_) => AllAddressesCubit(AllAddressesRepoImpl())
            ..getAllAddresses(context: context),
          child: BlocProvider.value(value: BlocProvider.of<ShippingCompaniesCubit>(state.extra as BuildContext),child: const AllOldAddressesScreen(),)
          //BlocProvider.value(value:BlocProvider.of<ShippingCompaniesCubit>(context) ,child: const AllOldAddressesScreen(),),
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
