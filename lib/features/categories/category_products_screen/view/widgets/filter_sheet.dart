import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/general_widgets/custom_button.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/design/widgets_fun.dart';
import '../../../../../core/general_managers/filter_cubit/filter_cubit.dart';
import '../../../../../core/general_managers/filter_cubit/filter_state.dart';
import '../../../../../core/general_managers/sort_cubit/sort_cubit.dart';
import '../../../manager/small_category_products_cubit/small_category_products_cubit.dart';
import 'filter_check_row.dart';

class CatProductsFilterSheet extends StatefulWidget {
  const CatProductsFilterSheet({Key? key}) : super(key: key);

  @override
  State<CatProductsFilterSheet> createState() => _CatProductsFilterSheetState();
}

class _CatProductsFilterSheetState extends State<CatProductsFilterSheet> {
  late SmallCategoryProductsAndChildrenCubit smallCatProCubit;
  late FilterCubit filterCubit;
  late LangCubit lang;
  GlobalKey<FormState> formKey= GlobalKey<FormState>();
  late Map textMap;
  @override
  void initState() {
    smallCatProCubit = BlocProvider.of<SmallCategoryProductsAndChildrenCubit>(context);
    filterCubit = BlocProvider.of<FilterCubit>(context);
    lang = BlocProvider.of<LangCubit>(context);
    textMap = BlocProvider.of<LangCubit>(context).texts;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilterCubit,FilterState>(builder: (context,state){
      if(state is FilterSuccess){
        return Scaffold(
          appBar: catAppBar(context: context,title: lang.texts['mobile_filter_label']),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            children: List.generate(filterCubit.filterOptions.length, (index){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Styles.text(filterCubit.filterOptions[index].name??''),
                    SizedBox(height: 6.h,),
                    ...List.generate(filterCubit.filterOptions[index].filterItem!.length,
                            (ind)=> FilterCheckRow(item: filterCubit.filterOptions[index].filterItem![ind],optionIndex: index,))
                  ],
                ),
              );
            })

          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            child: CustomButton(fun: (){
                BlocProvider.of<SortCubit>(context).sortIndex=-1;
                String x = filterCubit.selectedOptions.toString().replaceAll('[', '').replaceAll(']', '').replaceAll(' ', '').replaceAll('null', '');
                smallCatProCubit.getFilteredList(link: '/categories/${smallCatProCubit.categoryDetails.id}?values_ids=$x');
                Navigator.pop(context);
            }, title: textMap['mobile_enable_filter_label']),
          ),
        );
      }else{
        return Scaffold(
          appBar: catAppBar(context: context,title: lang.texts['mobile_filter_label']),
          body: loadingIndicator(),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            child: CustomButton(fun: (){}, title: lang.texts['mobile_enable_filter_label']),
          ),
        );
      }
    }, listener: (context,state){
      if(state is FilterFailure) errorDialog(context: context, message: state.errorMessage);
    });
  }
}


