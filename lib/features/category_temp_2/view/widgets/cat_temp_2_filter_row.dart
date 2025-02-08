import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/category_temp_2/view/widgets/cat_temp_2_filter_sheet.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun.dart';
import '../../../../core/general_managers/filter_cubit/filter_cubit.dart';
import '../../../../core/general_managers/sort_cubit/sort_cubit.dart';
import '../../../categories/data/filter_repo/filter_repo.dart';
import '../../../categories/model/SmallCategoryModel.dart';
import '../../../lang/manager/lang_cubit.dart';
import '../../manager/category_temp_2_cubit.dart';
import 'cat_temp_2_sort_sheet.dart';

class CatTemp2FilterRow extends StatelessWidget {
  const CatTemp2FilterRow({Key? key, required this.categoryModel}) : super(key: key);
  final SmallCategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    var lang = BlocProvider.of<LangCubit>(context);
    return Container(
      color: Colors.grey.shade200,
      child: Row(
        children: [
          Expanded(child: Container(color: Colors.white,child: TextButton.icon(
            onPressed: ()=> bottomSheet(context, MultiBlocProvider(providers: [
              BlocProvider.value(value: BlocProvider.of<CategoryTemp2Cubit>(context)),
              BlocProvider.value(value: BlocProvider.of<SortCubit>(context)),
            ], child: CatTemp2SortSheet(categoryModel: categoryModel,))),
            label: Styles.text(lang.texts['mobile_sort_label']),icon: const Icon(CupertinoIcons.arrow_up_arrow_down,color: Colors.black,size: 20,),))),
          const SizedBox(width: 2,),
          Expanded(child: Container(color: Colors.white,child: TextButton.icon(onPressed: ()=>
              bottomSheet(context,
                  MultiBlocProvider(providers: [
                    BlocProvider.value(value: BlocProvider.of<CategoryTemp2Cubit>(context)),
                    BlocProvider(create: (context)=> FilterCubit(FilterRepo())..getFilterOptions(catId: categoryModel.id.toString())),
                    BlocProvider.value(value: BlocProvider.of<SortCubit>(context)),
                  ], child:  CatTemp2FilterSheet(categoryModel: categoryModel,))
              ),
            label: Styles.text(lang.texts['mobile_filter_label']),icon: const Icon(CupertinoIcons.slider_horizontal_3,color: Colors.black,size: 20,),))),
        ],
      ),
    );
  }
}
