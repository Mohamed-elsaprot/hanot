import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/categories/category_products_screen/view/widgets/sort_radio_row.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../core/design/fun.dart';
import '../../../../../core/general_managers/sort_cubit/sort_cubit.dart';
import '../../../../../core/general_managers/sort_cubit/sort_state.dart';
import '../../../../../general_widgets/custom_button.dart';
import '../../../manager/small_category_products_cubit/small_category_products_cubit.dart';

class CatProductsSortSheet extends StatefulWidget {
  const CatProductsSortSheet({Key? key,}) : super(key: key);
  @override
  State<CatProductsSortSheet> createState() => _CatProductsSortSheetState();
}

class _CatProductsSortSheetState extends State<CatProductsSortSheet> {
  late SortCubit sortCubit;
  late SmallCategoryProductsAndChildrenCubit smallCarProCubit;
  late LangCubit lang;
  late List<Map> sortOptions;
  @override
  void initState() {
    sortCubit = BlocProvider.of<SortCubit>(context);
    lang = BlocProvider.of<LangCubit>(context);
    smallCarProCubit = BlocProvider.of<SmallCategoryProductsAndChildrenCubit>(context);
    sortOptions=[
      {'link':'price&order=asc','name':lang.texts['mobile_price_sort_asc_label']},
      {'link':'price&order=desc','name':lang.texts['mobile_price_sort_desc_label']}, {'link':'latest','name':lang.texts['mobile_latest_sort_label']}
    ];
    super.initState();
  }
  // double height=5;
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
            itemCount: 3
        );
      }),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        child: CustomButton(fun: (){
          if(sortCubit.sortIndex==-1){
            Navigator.pop(context);
          }else{
            smallCarProCubit.getFilteredList(link: '${'/products?sort_by='+sortOptions[sortCubit.sortIndex]['link']}&categories_ids=${smallCarProCubit.categoryDetails.id}');
            Navigator.pop(context);
          }
        }, title: lang.texts['mobile_sort_label']),),
    );
  }
}




