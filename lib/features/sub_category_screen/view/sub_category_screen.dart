import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/sub_category_screen/manager/sub_category_cubit.dart';
import 'package:hanot/features/sub_category_screen/view/widgets/sub_category_products_list.dart';

import '../../../core/design/app_styles.dart';
import '../../categories/category_products_screen/view/widgets/category_products_screen_shimmer.dart';
import '../../categories/model/category_details/Children.dart';
import '../manager/sub_category_state.dart';

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
    return BlocBuilder<SubCategoryCubit, SubCategoryState>(
      builder: (context,state){
        if(state is SubCategorySuccess){
          return SubCategoryProductsList(scrollController: scrollController, children: widget.children,);
        }else if(state is SubCategoryFailure){
          return Scaffold(
            appBar: AppBar(leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios)),),
            body: Center(child: Styles.text(state.errorMessage)),
          );
        }else{
          return const CategoryProductsScreenShimmer();
        }
      },
    );
  }
}
