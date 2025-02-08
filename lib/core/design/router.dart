import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:hanot/core/design/modal_material_with_page.dart';
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
import 'package:hanot/features/search/view/search.dart';
import 'package:hanot/features/settings/manager/settings_cubit.dart';
import 'package:hanot/features/sub_category_screen/manager/sub_category_cubit.dart';
import 'package:hanot/features/sub_category_screen/view/sub_category_screen.dart';
import 'package:hanot/features/navigation_screen/view/navigation_screen.dart';

import '../../features/categories/data/small_category_model/small_category_repo_impl.dart';
import '../../features/categories/manager/small_category_cubit/small_category_cubit.dart';
import '../../features/categories/manager/small_category_products_cubit/small_category_products_cubit.dart';
import '../../features/categories/model/category_details/Children.dart';
import '../../features/category_temp_2/main_cat_repo/main_car_repo.dart';
import '../../features/category_temp_2/manager/category_temp_2_cubit.dart';
import '../../features/category_temp_2/view/category_temp_2.dart';
import '../../features/my_orders/data/repositories/orders_repo.dart';
import '../../features/my_orders/manager/orders_cubit.dart';
import '../../features/settings/data/settings_repo.dart';
import '../data/get_category_products_repo/products_repo_impl.dart';
import '../data/next_page_products_repo/next_page_products_repo_impl.dart';
import '../general_managers/sort_cubit/sort_cubit.dart';

abstract class AppRouter {
  static const categoryProducts = '/categoryProducts';
  static const subCategoryScreen = '/subCategoryScreen';
  static const checkOutScreen = '/checkOutScreen';
  static const allOldAddressesScreen = '/allOldAddressesScreen';
  static const favScreen = '/favScreen';
  static const orderDetails = '/orderDetails';
  static const search = '/search';
  static const catTemp2 = '/catTemp2';


  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return ModalWithMaterialPage(child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) =>  SmallCategoryCubit(SmallCategoryRepoImpl())..getSmallCategories(),),
            BlocProvider(create: (context) =>  OrdersCubit(ordersRepo: OrdersRepo()),),
            BlocProvider(create: (context) =>  SettingsCubit(SettingsRepo())),
          ],
          child: const NavigationScreen(),
        ));
      },
    ),
    GoRoute(
      path: categoryProducts,
      pageBuilder: (BuildContext context, GoRouterState state) {
        var model = state.extra as SmallCategoryModel;
        return ModalWithMaterialPage(child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => SmallCategoryProductsAndChildrenCubit(
                ProductsRepoImpl(), NextPageProductsRepoImpl(),
                SingleCategoryRepoImpl())..getCategoryProducts(catId: model.id.toString()),
          ),
          BlocProvider(create: (context)=> SortCubit()),
        ], child: CategoryProductsScreen(smallCategoryModel: model)));
      },
    ),
    GoRoute(
      path: subCategoryScreen,
      pageBuilder: (BuildContext context, GoRouterState state) {
        Children children = state.extra as Children;
        return ModalWithMaterialPage(
            child: MultiBlocProvider(providers: [
                BlocProvider(create: (context) => SubCategoryCubit(ProductsRepoImpl(), NextPageProductsRepoImpl())..getCategoryProducts(subCatId: children.id.toString())),
                BlocProvider(create: (context)=>SortCubit())
            ], child: SubCategoryScreen(children: children)
        ));
      },
    ),
    GoRoute(
      path: checkOutScreen,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return ModalWithMaterialPage(child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CheckOutCubit(CheckOutRepoImpl())),
            BlocProvider(create: (context) => GetPaymentLinkCubit(GetPaymentLinkRepoImpl())),
            BlocProvider(create: (context) => PaymentMethodCubit(PaymentMethodRepoImpl())..getPaymentMethods(context: context)),
            BlocProvider(create: (context) => NoteCubit(),),
            BlocProvider(create: (context) => CouponCubit(CouponRepoImpl())),
          ],
          child: const CheckOutScreen(),
        ));
      },
    ),
    GoRoute(
      path: favScreen,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const ModalWithMaterialPage(child: FavoritesScreen());
      },
    ),
    GoRoute(
      path: orderDetails,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return ModalWithMaterialPage(child: OrderDetails(orderId: state.extra as int,));
      },
    ),
    GoRoute(
      path: search,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const ModalWithMaterialPage(child: Search());
      },
    ),
    GoRoute(
      path: catTemp2,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return ModalWithMaterialPage(
          child:
          MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => CategoryTemp2Cubit(CatTemp2Repo()),),
                BlocProvider(create: (context)=> SortCubit()),
          ], child: CategoryTemp2(smallCategoryModel: state.extra as SmallCategoryModel)),
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
