import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun.dart';
import '../../../../core/design/widgets_fun.dart';
import '../../../../core/general_managers/filter_cubit/filter_cubit.dart';
import '../../../../core/general_managers/filter_cubit/filter_state.dart';
import '../../../../core/general_managers/sort_cubit/sort_cubit.dart';
import '../../../../general_widgets/custom_button.dart';
import '../../../categories/category_products_screen/view/widgets/filter_check_row.dart';
import '../../../categories/model/category_details/Children.dart';
import '../../../lang/manager/lang_cubit.dart';
import '../../manager/sub_category_cubit.dart';

class SubCatFilterSheet extends StatefulWidget {
  const SubCatFilterSheet({Key? key, required this.children}) : super(key: key);
  final Children children;
  @override
  State<SubCatFilterSheet> createState() => _SubCatFilterSheetState();
}

class _SubCatFilterSheetState extends State<SubCatFilterSheet> {
  late SubCategoryCubit subCategoryCubit;
  late FilterCubit filterCubit;
  late LangCubit lang;
  GlobalKey<FormState> formKey= GlobalKey<FormState>();
  late Map textMap;
  @override
  void initState() {
    subCategoryCubit = BlocProvider.of<SubCategoryCubit>(context);
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
              subCategoryCubit.getCategoryProducts(link: '/categories/${widget.children.id}?page=1&pre_page=26&values_ids=$x');
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
    });  }
}
