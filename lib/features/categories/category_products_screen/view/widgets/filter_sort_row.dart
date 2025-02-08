import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/categories/category_products_screen/view/widgets/filter_sheet.dart';
import 'package:hanot/features/categories/category_products_screen/view/widgets/sort_sheet.dart';
import 'package:hanot/features/categories/data/filter_repo/filter_repo.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/general_managers/filter_cubit/filter_cubit.dart';
import '../../../../../core/general_managers/sort_cubit/sort_cubit.dart';
import '../../../manager/small_category_products_cubit/small_category_products_cubit.dart';

class CatProductFilterRow extends StatelessWidget {
  const CatProductFilterRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SmallCategoryProductsAndChildrenCubit>(context);
    var lang = BlocProvider.of<LangCubit>(context);
    return Container(
      color: Colors.grey.shade200,
      child: Row(
        children: [
          Expanded(child: Container(color: Colors.white,child: TextButton.icon(
            onPressed: ()=> bottomSheet(context, MultiBlocProvider(providers: [
              BlocProvider.value(value: BlocProvider.of<SmallCategoryProductsAndChildrenCubit>(context)),
              BlocProvider.value(value: BlocProvider.of<SortCubit>(context)),
            ], child: const CatProductsSortSheet())),
            label: Styles.text(lang.texts['mobile_sort_label']),icon: const Icon(CupertinoIcons.arrow_up_arrow_down,color: Colors.black,size: 20,),))),
          const SizedBox(width: 2,),
          Expanded(child: Container(color: Colors.white,child: TextButton.icon(onPressed: ()=>
              bottomSheet(context,
                  MultiBlocProvider(providers: [
                    BlocProvider(create: (context)=> FilterCubit(FilterRepo())..getFilterOptions(catId: cubit.categoryDetails.id.toString())),
                    BlocProvider.value(value: BlocProvider.of<SortCubit>(context)),
                    BlocProvider.value(value: BlocProvider.of<SmallCategoryProductsAndChildrenCubit>(context))
                  ], child: const CatProductsFilterSheet())
              ),
            label: Styles.text(lang.texts['mobile_filter_label']),icon: const Icon(CupertinoIcons.slider_horizontal_3,color: Colors.black,size: 20,),))),
        ],
      ),
    );
  }
}
