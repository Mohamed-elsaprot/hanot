import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/categories/category_products_screen/view/widgets/category_products_body.dart';
import 'package:hanot/features/categories/category_products_screen/view/widgets/category_products_screen_shimmer.dart';
import 'package:hanot/features/categories/category_products_screen/view/widgets/filter_sort_row.dart';
import 'package:hanot/features/categories/manager/small_category_products_cubit/small_category_products_cubit.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/general_widgets/cart_appbar_icon.dart';

import '../../../cart/manager/cart_cubit/cart_cubit.dart';
import '../../../home/view/widgets/hor_categories_list_2.dart';
import '../../../navigation_screen/manager/navigation_screen_manager.dart';
import '../../manager/small_category_products_cubit/small_category_products_state.dart';
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
  late NavigationScreenCubit navCubit;
  late CartCubit cartCubit;
  late LangCubit lang;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    smallCategoryProductsCubit = BlocProvider.of<SmallCategoryProductsAndChildrenCubit>(context);
    lang = BlocProvider.of<LangCubit>(context);
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.offset){
        smallCategoryProductsCubit.getNextPageProducts(context);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmallCategoryProductsAndChildrenCubit, SmallCategoryProductsState>(builder: (context,state){
      if(state is SmallCategoryProductsSuccess){
        return Scaffold(
          appBar: catAppBar(context: context,
              title: '${lang.texts['mobile_products_label']} - ${smallCategoryProductsCubit.categoryDetails.name??''}',
              action: CartAppbarIcon(),
              bottom: PreferredSize(preferredSize: Size(0, smallCategoryProductsCubit.categoryDetails.hasChildren!?80.h:40.h),
                  child: Column(
                    children: [
                      if(smallCategoryProductsCubit.categoryDetails.hasChildren!)
                        HorCategoriesList2(childrenList: smallCategoryProductsCubit.categoryDetails.children,),
                      const CatProductFilterRow(),
                    ],
                  )
              )),
            backgroundColor: Colors.white,
            body: CategoryProductsBody(scrollController: scrollController,)
        );
      }else if (state is SmallCategoryProductsFailure) {
        return Scaffold(
          appBar: AppBar(elevation: 0,leading: IconButton(icon: const Icon(Icons.arrow_back_ios),onPressed: ()=>Navigator.pop(context),),),
          body: Center(child: Styles.text(state.errorMessage)),backgroundColor: Colors.white,);
      }else{
        return const CategoryProductsScreenShimmer();
      }
    });
  }
}
