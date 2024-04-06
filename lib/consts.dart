import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/cart/view/cart_screen.dart';
import 'package:hanot/features/favorites/view/favorites_screen.dart';
import 'package:hanot/features/settings/view/settings_screen.dart';

import 'features/categories/categories_screen/view/categories.dart';
import 'features/categories/data/small_category_model/small_category_repo_impl.dart';
import 'features/categories/manager/small_category_cubit/small_category_cubit.dart';
import 'features/home/data/home_data_repo_impl.dart';
import 'features/home/manager/home_cubit.dart';
import 'features/tabs_screen/data/get_categories_details_repo/category_repo_impl.dart';
import 'features/tabs_screen/data/get_category_products_repo/products_repo_impl.dart';
import 'features/tabs_screen/data/next_page_products_repo/next_page_products_repo_impl.dart';
import 'features/tabs_screen/manager/categories_cubit/category_cubit.dart';
import 'features/tabs_screen/manager/products_cubit/get_category_products_cubit.dart';
import 'features/tabs_screen/view/tabs_screen.dart';

List<Widget> tabsList = [
  BlocProvider(
    create: (context) => CategoryCubit(CategoryDetailsRepoImpl())..getCategories(),
    child: BlocProvider(
      create: (context) => CategoryProductsCubit(ProductsRepoImpl(),NextPageProductsRepoImpl()),
      child: BlocProvider(create: (context)=> HomeCubit(HomeDataRepoImpl())..getHomeData(),child: const TabsScreen(),),
    ),
  ),
  BlocProvider(create: (context)=> SmallCategoryCubit(SmallCategoryRepoImpl())..getSmallCategories(),child: const Categories()),
  const CartScreen(),
  const FavoritesScreen(),
  const SettingsScreen(),
];
const String fontFamily = 'Noto Kufi Arabic';

List testImages = [
  'https://www.pngitem.com/pimgs/m/131-1313063_cash-stack-of-money-clipart-free-best-transparent.png',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqoP5xMilrb7ilVu6hhYcR6BI24lcnsMo3NXGRHAmYEz94HF7CpY9vw2ZEpe564mnuAII&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS39ADIiwONBpbuyX_WfT2g1qi4jyGtgunXNA&s',
];
