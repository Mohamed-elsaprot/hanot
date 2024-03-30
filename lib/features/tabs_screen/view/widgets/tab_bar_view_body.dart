import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/home/view/home.dart';
import 'package:hanot/features/tabs_screen/view/widgets/products_list_body.dart';
import 'package:hanot/features/tabs_screen/view/widgets/tab_bar_view_body_shimmer.dart';

import '../../manager/categories_cubit/category_cubit.dart';

class TabBarViewBody extends StatelessWidget{
  const TabBarViewBody({Key? key, required this.controller}) : super(key: key);
  final TabController controller;
  @override
  Widget build(BuildContext context) {
    var categoriesCubit = BlocProvider.of<CategoryCubit>(context);
    return TabBarView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      children: [
        const HomeTab(),
        ...List.generate(categoriesCubit.tabBarCategoriesList.length, (index) {
          return index==controller.index-1?ProductsListBody(index: index):const TabBarViewBodyShimmer();
        },
        )
      ],
    );
  }
}
