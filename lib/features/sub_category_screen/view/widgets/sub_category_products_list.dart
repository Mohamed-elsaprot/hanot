import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/sub_category_screen/manager/sub_category_state.dart';
import 'package:hanot/features/sub_category_screen/view/widgets/sub_cat_filter_row.dart';
import 'package:hanot/general_widgets/cart_appbar_icon.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun.dart';
import '../../../../core/models/category_model/Product.dart';
import '../../../../general_widgets/general_products_list.dart';
import '../../../categories/category_products_screen/view/widgets/category_products_screen_shimmer.dart';
import '../../../categories/model/category_details/Children.dart';
import '../../manager/sub_category_cubit.dart';

class SubCategoryProductsList extends StatelessWidget {
  const SubCategoryProductsList({Key? key, required this.scrollController, required this.children}) : super(key: key);
  final ScrollController scrollController;
  final Children children;
  @override
  Widget build(BuildContext context) {
    var subCategoryCubit = BlocProvider.of<SubCategoryCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: catAppBar(
        context: context,title: children.name!,
          bottom: PreferredSize(preferredSize: Size(0, 40.h), child: SubCatFilterRow(children: children,),),
        action: CartAppbarIcon()
      ),
      body: SingleChildScrollView(controller: scrollController,child: GeneralProductsListBody(
        productList: subCategoryCubit.subCategoryModel.productsList??[] as List<Product>,
        scrollController: scrollController,last: subCategoryCubit.last,
      ),
      ),
    );
  }
}
