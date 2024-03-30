import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/consts.dart';
import 'package:hanot/core/design/appTexts.dart';

import '../../manager/categories_cubit/category_cubit.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key, required this.controller}) : super(key: key);
  final TabController controller;
  @override
  Widget build(BuildContext context) {
    var catCubit = BlocProvider.of<CategoryCubit>(context);
    return TabBar(
      controller: controller,
      isScrollable: true,
      unselectedLabelColor: Colors.black.withOpacity(.4),
      labelColor: Colors.black,
      indicatorColor: Colors.black,
      tabs: [
        Tab(child: Text(Texts.home.tr(),style: const TextStyle(fontFamily: fontFamily),),),
        ...List.generate(catCubit.tabBarCategoriesList.length, (index) => Tab(child: Text(catCubit.tabBarCategoriesList[index].name??'No Name',style: const TextStyle(fontFamily: fontFamily)),))
      ],
    );
  }
}
