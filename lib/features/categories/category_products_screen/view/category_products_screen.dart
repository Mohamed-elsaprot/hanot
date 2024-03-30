import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/categories/category_products_screen/view/widgets/category_products_body.dart';
import 'package:hanot/features/categories/manager/small_category_products_cubit/small_category_products_cubit.dart';

import '../../model/SmallCategoryModel.dart';

class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({Key? key, required this.smallCategoryModel,}) : super(key: key);
  final SmallCategoryModel smallCategoryModel;
  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  late final ScrollController scrollController;
  late SmallCategoryProductsAndChildrenCubit smallCategoryProductsCubit;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    smallCategoryProductsCubit = BlocProvider.of<SmallCategoryProductsAndChildrenCubit>(context);
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.offset){
        smallCategoryProductsCubit.getNextPageProducts(context);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Styles.text(widget.smallCategoryModel.name!, size: 22),),
        backgroundColor: Colors.white,
        body: CategoryProductsBody(scrollController: scrollController,)
    );
  }
}