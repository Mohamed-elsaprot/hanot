import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/general_widgets/item_sheet/managers/single_products_details_cubit/single_products_details_cubit.dart';

import '../../core/design/app_styles.dart';

class ChooseSizeContainer extends StatefulWidget {
  const ChooseSizeContainer({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<ChooseSizeContainer> createState() => _ChooseSizeContainerState();
}

class _ChooseSizeContainerState extends State<ChooseSizeContainer> {
  late SingleProductCubit cubit;
  late List<bool> choices;

  @override
  void initState() {
    cubit = BlocProvider.of<SingleProductCubit>(context);
    choices = List.generate(cubit.singleProductModel.options![widget.index].values!.length, (index)=> index==0?true:false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.subTitle(singleProductCubit.singleProductModel.options![widget.index].name??'',size: 16),
          SizedBox(height: 10.h,),
          SizedBox(
            height: 28.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                ...List.generate(singleProductCubit.singleProductModel.options![widget.index].values!.length, (ind) => GestureDetector(
                  onTap: (){
                    choices.fillRange(0, choices.length,false);
                    choices[ind]=true;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.black38),
                        color: choices[ind]==true?Colors.grey.shade300:Colors.white
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 5.h),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    width: 60.w,
                    alignment: Alignment.center,
                    child: Styles.text(singleProductCubit.singleProductModel.options![widget.index].values![ind].name??'',fontWeight: FontWeight.w500,size: 14),
                  ),
                ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
