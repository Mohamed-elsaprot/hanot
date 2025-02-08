import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/sub_category_screen/view/widgets/sub_cat_Filter_sheet.dart';
import 'package:hanot/features/sub_category_screen/view/widgets/sub_cat_sort_sheet.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun.dart';
import '../../../../core/general_managers/filter_cubit/filter_cubit.dart';
import '../../../../core/general_managers/sort_cubit/sort_cubit.dart';
import '../../../categories/data/filter_repo/filter_repo.dart';
import '../../../categories/model/category_details/Children.dart';
import '../../../lang/manager/lang_cubit.dart';
import '../../manager/sub_category_cubit.dart';

class SubCatFilterRow extends StatelessWidget {
  const SubCatFilterRow({Key? key, required this.children}) : super(key: key);
  final Children children;
  @override
  Widget build(BuildContext context) {
    var lang = BlocProvider.of<LangCubit>(context);
    return Container(
      color: Colors.grey.shade200,
      child: Row(
        children: [
          Expanded(child: Container(color: Colors.white,child: TextButton.icon(
            onPressed: ()=> bottomSheet(context, MultiBlocProvider(providers: [
              BlocProvider.value(value: BlocProvider.of<SubCategoryCubit>(context)),
              BlocProvider.value(value: BlocProvider.of<SortCubit>(context)),
            ], child: SubCatSortSheet(children: children,)
            )),
            label: Styles.text(lang.texts['mobile_sort_label']),icon: const Icon(CupertinoIcons.arrow_up_arrow_down,color: Colors.black,size: 20,),))),
          const SizedBox(width: 2,),
          Expanded(child: Container(color: Colors.white,child: TextButton.icon(onPressed: ()=>
              bottomSheet(context,
                  MultiBlocProvider(providers: [
                    BlocProvider.value(value: BlocProvider.of<SubCategoryCubit>(context)),
                    BlocProvider(create: (context)=> FilterCubit(FilterRepo())..getFilterOptions(catId: children.id.toString())),
                    BlocProvider.value(value: BlocProvider.of<SortCubit>(context)),
                  ], child:  SubCatFilterSheet(children: children,))
              ),
            label: Styles.text(lang.texts['mobile_filter_label']),icon: const Icon(CupertinoIcons.slider_horizontal_3,color: Colors.black,size: 20,),))),
        ],
      ),
    );
  }
}
