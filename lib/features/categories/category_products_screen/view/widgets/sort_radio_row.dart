import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/general_managers/sort_cubit/sort_cubit.dart';
import '../../../../../core/general_managers/sort_cubit/sort_state.dart';

class SortRadioRow extends StatefulWidget {
  const SortRadioRow({Key? key, required this.val, required this.title}) : super(key: key);
  final int val;
  final String title;
  @override
  State<SortRadioRow> createState() => _SortRadioRowState();
}

class _SortRadioRowState extends State<SortRadioRow> {
  bool taped=false;
  late SortCubit sortCubit;
  @override
  void initState() {
    sortCubit = BlocProvider.of<SortCubit>(context);
    super.initState();
  }
  onChange(x){
    sortCubit.sortIndex=widget.val;
    sortCubit.emit(SortInitial());
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onChange!(widget.val);
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
                    child: Radio(value: widget.val, groupValue: sortCubit.sortIndex, onChanged: onChange,activeColor: Styles.primary,),
                  ),
                  SizedBox(width: 10.w,),
                  FittedBox(child: Styles.text(widget.title,color: Colors.black87,size: 13)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
