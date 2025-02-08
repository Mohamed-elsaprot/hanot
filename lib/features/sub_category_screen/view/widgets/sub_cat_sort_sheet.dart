import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/categories/model/category_details/Children.dart';

import '../../../../core/design/fun.dart';
import '../../../../core/general_managers/sort_cubit/sort_cubit.dart';
import '../../../../core/general_managers/sort_cubit/sort_state.dart';
import '../../../../general_widgets/custom_button.dart';
import '../../../categories/category_products_screen/view/widgets/sort_radio_row.dart';
import '../../../lang/manager/lang_cubit.dart';
import '../../manager/sub_category_cubit.dart';

class SubCatSortSheet extends StatefulWidget {
  const SubCatSortSheet({Key? key, required this.children}) : super(key: key);
  final Children children;
  @override
  State<SubCatSortSheet> createState() => _SubCatSortSheetState();
}

class _SubCatSortSheetState extends State<SubCatSortSheet> {
  late SortCubit sortCubit;
  late SubCategoryCubit subCategoryCubit;
  late LangCubit lang;
  late List<Map> sortOptions;
  @override
  void initState() {
    sortCubit = BlocProvider.of<SortCubit>(context);
    lang = BlocProvider.of<LangCubit>(context);
    subCategoryCubit = BlocProvider.of<SubCategoryCubit>(context);
    sortOptions=[
      {'link':'price&order=asc','name':lang.texts['mobile_price_sort_asc_label']},
      {'link':'price&order=desc','name':lang.texts['mobile_price_sort_desc_label']}, {'link':'latest','name':lang.texts['mobile_latest_sort_label']}
    ];    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: catAppBar(context: context,title: lang.texts['mobile_sort_label']),
      body: BlocBuilder<SortCubit,SortState>(builder: (context,state){
        return ListView.separated(
            itemBuilder: (context,index)=> Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
              child: SortRadioRow(val: index,title: sortOptions[index]['name'],),
            ),
            separatorBuilder: (context,index)=>SizedBox(height: 2.h,),
            itemCount: 3,
        );
      }),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        child: CustomButton(fun: (){
          if(sortCubit.sortIndex==-1){
            Navigator.pop(context);
          }else{
            subCategoryCubit.getCategoryProducts(link: '/categories/${widget.children.id}?page=1&pre_page=26&sort_by=${sortOptions[sortCubit.sortIndex]['link']}');
            Navigator.pop(context);
          }
        }, title: lang.texts['mobile_sort_label']),),
    );
  }
}
