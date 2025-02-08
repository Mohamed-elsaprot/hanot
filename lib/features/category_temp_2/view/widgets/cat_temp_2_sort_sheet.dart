import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/fun.dart';
import '../../../../core/general_managers/sort_cubit/sort_cubit.dart';
import '../../../../core/general_managers/sort_cubit/sort_state.dart';
import '../../../../general_widgets/custom_button.dart';
import '../../../categories/category_products_screen/view/widgets/sort_radio_row.dart';
import '../../../categories/model/SmallCategoryModel.dart';
import '../../../lang/manager/lang_cubit.dart';
import '../../manager/category_temp_2_cubit.dart';

class CatTemp2SortSheet extends StatefulWidget {
  const CatTemp2SortSheet({Key? key, required this.categoryModel}) : super(key: key);
  final SmallCategoryModel categoryModel;

  @override
  State<CatTemp2SortSheet> createState() => _CatTemp2SortSheetState();
}

class _CatTemp2SortSheetState extends State<CatTemp2SortSheet> {

  late SortCubit sortCubit;
  late CategoryTemp2Cubit categoryTemp2Cubit;
  late LangCubit lang;
  late List<Map> sortOptions;
  @override
  void initState() {
    sortCubit = BlocProvider.of<SortCubit>(context);
    lang = BlocProvider.of<LangCubit>(context);
    categoryTemp2Cubit = BlocProvider.of<CategoryTemp2Cubit>(context);
    sortOptions=[
      {'link':'price&order=asc','name':lang.texts['mobile_price_sort_asc_label']},
      {'link':'price&order=desc','name':lang.texts['mobile_price_sort_desc_label']}, {'link':'latest','name':lang.texts['mobile_latest_sort_label']}
    ];
    super.initState();
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
            itemCount: 3
        );
      }),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        child: CustomButton(fun: (){
          if(sortCubit.sortIndex==-1){
            Navigator.pop(context);
          }else{
            categoryTemp2Cubit.getMainCatDetails(catId: '${widget.categoryModel.id}?sort_by=${sortOptions[sortCubit.sortIndex]['link']}&categories_ids=${widget.categoryModel.id}');
            // smallCarProCubit.getFilteredList(link: '${'/products?sort_by='+sortOptions[sortCubit.sortIndex]['link']}&categories_ids=${smallCarProCubit.categoryDetails.id}');
            Navigator.pop(context);
          }
        }, title: lang.texts['mobile_sort_label']),),
    );
  }
}
