import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/categories/model/SmallCategoryModel.dart';
import 'package:hanot/features/category_temp_2/view/category_temp_2_body.dart';

import '../manager/category_temp_2_cubit.dart';

class CategoryTemp2 extends StatefulWidget {
  const CategoryTemp2({Key? key, required this.smallCategoryModel}) : super(key: key);
  final SmallCategoryModel smallCategoryModel;

  @override
  State<CategoryTemp2> createState() => _CategoryTemp2State();
}

class _CategoryTemp2State extends State<CategoryTemp2> {
  late CategoryTemp2Cubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<CategoryTemp2Cubit>(context);
    cubit.getMainCatDetails(catId: widget.smallCategoryModel.id.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CategoryTemp2Body(smallCategoryModel: widget.smallCategoryModel,);
  }
}
