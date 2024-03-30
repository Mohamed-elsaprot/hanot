import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/sub_category_screen/manager/sub_category_cubit.dart';
import 'package:hanot/features/sub_category_screen/view/widgets/sub_category_products_list.dart';
import 'package:hanot/features/tabs_screen/model/category_details/Children.dart';

import '../../../core/design/app_styles.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({Key? key, required this.children}) : super(key: key);
  final Children children;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  late final ScrollController scrollController;
  late SubCategoryCubit subCategoryCubit;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    subCategoryCubit = BlocProvider.of<SubCategoryCubit>(context);
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.offset){
        subCategoryCubit.getNextPageProducts(context);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Styles.text(widget.children.name!, size: 22),),
      body: SubCategoryProductsList(scrollController: scrollController,),
    );
  }
}
