import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/sub_category_screen/manager/sub_category_state.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../general_widgets/general_products_list.dart';
import '../../../categories/category_products_screen/view/widgets/category_products_screen_shimmer.dart';
import '../../manager/sub_category_cubit.dart';

class SubCategoryProductsList extends StatelessWidget {
  const SubCategoryProductsList({Key? key, required this.scrollController}) : super(key: key);
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    var subCategoryCubit = BlocProvider.of<SubCategoryCubit>(context);
    return BlocBuilder<SubCategoryCubit, SubCategoryState>(
      builder: (context, state) {
        if (state is SubCategorySuccess) {
          return GeneralProductsListBody(categoryModel: subCategoryCubit.subCategoryModel,scrollController: scrollController,last: subCategoryCubit.last,);
        }
        else if (state is SubCategoryFailure) {
          return Center(child: Styles.text(state.errorMessage));
        } else {
          return const CategoryProductsScreenShimmer();
        }
      },
    );
  }
}
