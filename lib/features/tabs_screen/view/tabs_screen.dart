import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/home/manager/home_cubit.dart';
import 'package:hanot/features/home/manager/home_state.dart';
import 'package:hanot/features/tabs_screen/view/widgets/tab_bar.dart';
import 'package:hanot/features/tabs_screen/view/widgets/tab_bar_view_body.dart';

import '../../../core/design/images.dart';
import '../../../general_widgets/app_bar.dart';
import '../manager/categories_cubit/category_cubit.dart';
import '../manager/categories_cubit/category_state.dart';
import '../manager/products_cubit/get_category_products_cubit.dart';
import '../manager/products_cubit/get_category_products_state.dart';

import 'package:badges/badges.dart' as badges;

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> with SingleTickerProviderStateMixin{
  late TabController controller;
  late CategoryCubit categoryCubit;
  late CategoryProductsCubit catProductsCubit;
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    categoryCubit = BlocProvider.of<CategoryCubit>(context);
    catProductsCubit = BlocProvider.of<CategoryProductsCubit>(context);
    homeCubit = BlocProvider.of<HomeCubit>(context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit,CategoryState>(
      builder: (context,state){
        if(state is CategorySuccess){
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: appBar(controller),
            body: BlocBuilder<CategoryProductsCubit,GetCategoryProductsState>(
              builder: (context,state){
                return TabBarViewBody(controller: controller);
              },
            ),
          );
      }else if(state is CategoryFailure){
        return Center(child: Styles.text(state.errorMessage),);
      }else{
        return loadingIndicator();
      }
    },
      listener: (BuildContext context, CategoryState state) async {
      if(state is CategorySuccess){
        controller = TabController(length: categoryCubit.tabBarCategoriesList.length+1, vsync: this);
        controller.addListener(() async{
          if(controller.index!=0){
            homeCubit.emit(HomeInitial()); //عشان الui يروح علطول اول مطلع منها
            await catProductsCubit.getCategoryProducts(catId: categoryCubit.tabBarCategoriesList[controller.index-1].id.toString());
          }else{
            catProductsCubit.emit(GetCategoryProductsLoading()); // عشان لو روحت لل home يحط shimmer في الcategory اللي كنت واقف فيه
            await homeCubit.getHomeData();
          }
        });
      }
    },);
  }
}

//NestedScrollView(
//           physics: const NeverScrollableScrollPhysics(),
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return [
//               SliverList(
//                 delegate: SliverChildListDelegate(
//                   [
//                     appBar(),
//                     CustomTabBar(controller: controller),
//                   ],
//                 ),
//               )
//             ];
//           },
//           body: BlocBuilder<CategoryProductsCubit,GetCategoryProductsState>(
//             builder: (context,state){
//               return TabBarViewBody(controller: controller);
//             },
//           ),
//         )
