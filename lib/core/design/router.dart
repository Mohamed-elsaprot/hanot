import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:hanot/features/categories/category_products_screen/view/category_products_screen.dart';
import 'package:hanot/features/categories/data/single_category_repo/single_category_repo_impl.dart';
import 'package:hanot/features/categories/model/SmallCategoryModel.dart';
import 'package:hanot/features/sub_category_screen/manager/sub_category_cubit.dart';
import 'package:hanot/features/sub_category_screen/view/sub_category_screen.dart';
import 'package:hanot/features/tabs_screen/model/category_details/Children.dart';
import 'package:hanot/features/navigation_screen/view/navigation_screen.dart';

import '../../features/categories/manager/small_category_products_cubit/small_category_products_cubit.dart';
import '../../features/tabs_screen/data/get_category_products_repo/products_repo_impl.dart';
import '../../features/tabs_screen/data/next_page_products_repo/next_page_products_repo_impl.dart';
abstract class AppRouter{

  static const categoryProducts='/categoryProducts';
  static const subCategoryScreen='/subCategoryScreen';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const TabsScreen();
        },
      ),
      GoRoute(
        path: categoryProducts,
        builder: (BuildContext context, GoRouterState state) {
          var model =state.extra as SmallCategoryModel;
          return BlocProvider(
            create: (context) => SmallCategoryProductsAndChildrenCubit(ProductsRepoImpl(),NextPageProductsRepoImpl(),SingleCategoryRepoImpl())..getCategoryProducts(catId: model.id.toString()),
            child: CategoryProductsScreen(smallCategoryModel: model),
          );
        },
      ),
      GoRoute(
        path: subCategoryScreen,
        builder: (BuildContext context, GoRouterState state) {
          Children children = state.extra as Children;
          return BlocProvider(
            create: (context) => SubCategoryCubit(ProductsRepoImpl(),NextPageProductsRepoImpl())..getCategoryProducts(subCatId: children.id.toString()),
            child: SubCategoryScreen(children: children,),
          );
        },
      ),
    ]
  );
}