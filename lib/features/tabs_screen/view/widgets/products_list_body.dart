import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/tabs_screen/view/widgets/sub_category_card.dart';
import 'package:hanot/features/tabs_screen/view/widgets/tab_bar_view_body_shimmer.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../general_widgets/item_card.dart';
import '../../manager/categories_cubit/category_cubit.dart';
import '../../manager/products_cubit/get_category_products_cubit.dart';
import '../../manager/products_cubit/get_category_products_state.dart';

class ProductsListBody extends StatefulWidget {
  const ProductsListBody({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<ProductsListBody> createState() => _ProductsListBodyState();
}

class _ProductsListBodyState extends State<ProductsListBody> {
  late final ScrollController scrollController;
  late CategoryCubit categoriesCubit;
  late CategoryProductsCubit catProductsCubit;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    categoriesCubit = BlocProvider.of<CategoryCubit>(context);
    catProductsCubit = BlocProvider.of<CategoryProductsCubit>(context);
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.offset){
        catProductsCubit.getNextPageProducts(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductsCubit,GetCategoryProductsState>(
      builder: (context,state){
        if(state is GetCategoryProductsSuccess){
          return SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(categoriesCubit.tabBarCategoriesList[widget.index].hasChildren!)
                  SizedBox(
                      height: 170.h,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: categoriesCubit.tabBarCategoriesList[widget.index].children!.length,
                        itemBuilder: (BuildContext context, int ind) => SubCategoryCard(
                          children: categoriesCubit.tabBarCategoriesList[widget.index].children![ind],
                          childrenName: categoriesCubit.tabBarCategoriesList[widget.index].children![ind].name,
                          childrenImage: categoriesCubit.tabBarCategoriesList[widget.index].children![ind].image,
                        ),
                      )),
                // const NavigationRow(),
                // SizedBox(height: 15.h,),
                for(int i=0; i<catProductsCubit.categoryModel!.productsList!.length; i+=2)
                  i == catProductsCubit.categoryModel!.productsList!.length-1?
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 185.w, child: ItemCard(product:catProductsCubit.categoryModel!.productsList![i],)),
                        SizedBox(width: 185.w,),
                      ],
                    ),
                  )
                      :Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 185.w, child: ItemCard(product:catProductsCubit.categoryModel!.productsList![i],)),
                        SizedBox(width: 185.w, child: ItemCard(product:catProductsCubit.categoryModel!.productsList![i+1],)),
                      ],
                    ),
                  ),
                catProductsCubit.last|| catProductsCubit.categoryModel!.productsList!.length<=4? const SizedBox():loadingIndicator()
              ],
            ),
          );
          // return TabBarViewBodyShimmer();
        }else if(state is GetCategoryProductsFailure){
          return Center(child: Styles.text(state.errorMessage),);
        }else {
          return const TabBarViewBodyShimmer();
        }
      },
    );
  }
}