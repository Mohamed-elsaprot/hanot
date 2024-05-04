import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/cart/view/cart_screen.dart';
import 'package:hanot/features/favorites/view/favorites_screen.dart';
import 'package:hanot/features/settings/view/settings_screen.dart';

import 'core/design/appTexts.dart';
import 'features/categories/categories_screen/view/categories.dart';
import 'features/categories/data/small_category_model/small_category_repo_impl.dart';
import 'features/categories/manager/small_category_cubit/small_category_cubit.dart';
import 'features/check_out/check_out_screen/models/shipping_company/ShippingCompany.dart';
import 'features/home/data/home_data_repo_impl.dart';
import 'features/home/manager/home_cubit.dart';
import 'features/tabs_screen/data/get_categories_details_repo/category_repo_impl.dart';
import 'features/tabs_screen/data/get_category_products_repo/products_repo_impl.dart';
import 'features/tabs_screen/data/next_page_products_repo/next_page_products_repo_impl.dart';
import 'features/tabs_screen/manager/categories_cubit/category_cubit.dart';
import 'features/tabs_screen/manager/products_cubit/get_category_products_cubit.dart';
import 'features/tabs_screen/view/tabs_screen.dart';

List<Widget> tabsList = [
  MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => CategoryCubit(CategoryDetailsRepoImpl())..getCategories(),),
      BlocProvider(create: (context) => CategoryProductsCubit(ProductsRepoImpl(), NextPageProductsRepoImpl()),),
      BlocProvider(create: (context) => HomeCubit(HomeDataRepoImpl())..getHomeData(),),
    ],
    child: const TabsScreen(),
  ),
  BlocProvider(create: (context) => SmallCategoryCubit(SmallCategoryRepoImpl())..getSmallCategories(),
      child: const Categories()),
  const CartScreen(),
  const FavoritesScreen(),
  const SettingsScreen(),
];
const String fontFamily = 'Noto Kufi Arabic';
List<ShippingCompany> constComList = [
  ShippingCompany(
      name: Texts.selfPickUp.tr(),
      id: 0,
      cost: '0',
      duration: Texts.selfPickUp.tr(),
      priceId: 0,
      supportedCities: [])
];
