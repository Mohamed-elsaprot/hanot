import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../general_widgets/general_products_list.dart';
import '../../../../../general_widgets/sub_category_card.dart';
import '../../../manager/small_category_products_cubit/small_category_products_cubit.dart';
import '../../../manager/small_category_products_cubit/small_category_products_state.dart';
import 'category_products_screen_shimmer.dart';

class CategoryProductsBody extends StatelessWidget {
  const CategoryProductsBody({Key? key, required this.scrollController,}) : super(key: key);
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SmallCategoryProductsAndChildrenCubit>(context);
    return BlocBuilder<SmallCategoryProductsAndChildrenCubit, SmallCategoryProductsState>(
      builder: (context, state) {
        if (state is SmallCategoryProductsSuccess) {
          return ListView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
            children: [
              if(cubit.categoryDetails.hasChildren!)
              SizedBox(
                  height: 170.h,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.categoryDetails.children!.length,
                    itemBuilder: (BuildContext context, int ind) => SubCategoryCard(
                      children: cubit.categoryDetails.children![ind],
                      childrenName: cubit.categoryDetails.children![ind].name,
                      childrenImage: cubit.categoryDetails.children![ind].image,
                    ),
                  )),
              GeneralProductsListBody(categoryModel: cubit.categoryProductsModel,scrollController: scrollController,last: cubit.last,)
            ],
          );
        }
        else if (state is SmallCategoryProductsFailure) {
          return Center(child: Styles.text(state.errorMessage));
        } else {
          return const CategoryProductsScreenShimmer();
        }
      },
    );
  }
}
