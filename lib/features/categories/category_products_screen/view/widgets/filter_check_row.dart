import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/general_managers/filter_cubit/filter_cubit.dart';
import '../../../model/filter_model/FilterItem.dart';

class FilterCheckRow extends StatefulWidget {
  const FilterCheckRow({Key? key, required this.item, required this.optionIndex}) : super(key: key);
  final FilterItem item;
  final int optionIndex;
  @override
  State<FilterCheckRow> createState() => _FilterCheckRowState();
}

class _FilterCheckRowState extends State<FilterCheckRow> {
  late FilterCubit filterCubit;
  bool taped=false,selected=false;
  @override
  void initState() {
    filterCubit = BlocProvider.of<FilterCubit>(context);
    super.initState();
  }
  onChange(x){
    setState(() {
      // filterCubit.setOptionVal(index: widget.optionIndex, val: widget.item.id.toString());
      filterCubit.setOptionVal(val: widget.item.id.toString());
      selected = !selected;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onChange!(widget.item.id.toString());
        setState(() {});
      },
      onPanDown: (x)=>setState(() => taped=true),
      onPanCancel: ()=>setState(() => taped=false),
      child: Container(
        margin: EdgeInsets.only(bottom: 4.h),
        padding: EdgeInsetsDirectional.only(end: 10.w),
        height: 25.h,
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  AnimatedScale(
                    scale: taped?1.3:1,
                    duration: const Duration(milliseconds: 100),
                    child: Container(
                      width: 20,height: 20,
                      alignment: Alignment.center,
                      margin: const EdgeInsetsDirectional.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1.2,color: Colors.black),
                          // color: filterCubit.selectedOptions![widget.optionIndex]==widget.item.id.toString()?Styles.primary:null
                        color: selected?Styles.primary:null
                      ),
                      child: selected?Icon(Icons.check,color: Colors.white,size: 16.sp):null,
                      // child: filterCubit.selectedOptions![widget.optionIndex]==widget.item.id.toString()? Icon(Icons.check,color: Colors.white,size: 16.sp):null,
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  FittedBox(child: Styles.text(widget.item!.name??'',color: Colors.black87,size: 13)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
