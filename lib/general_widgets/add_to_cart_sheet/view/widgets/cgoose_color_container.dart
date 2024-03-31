import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../managers/single_products_details_cubit/single_products_details_cubit.dart';
import 'colored_circle.dart';

class ChooseColorContainer extends StatefulWidget {
  const ChooseColorContainer({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<ChooseColorContainer> createState() => _ChooseColorContainerState();
}

class _ChooseColorContainerState extends State<ChooseColorContainer> {
  late SingleProductCubit cubit;
  late List<bool> choices;
  late String selectedColor;
  @override
  void initState() {
    cubit = BlocProvider.of<SingleProductCubit>(context);
    choices = List.generate(cubit.singleProductModel.options![widget.index].values!.length, (index)=> index==0?true:false);
    selectedColor= cubit.singleProductModel.options![widget.index].values![0].name??'';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    int dynamicWidth = cubit.singleProductModel.options![widget.index].values!.length;
    if(dynamicWidth==1)dynamicWidth=2;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white
      ),
      width: (dynamicWidth * 70).w,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Styles.subTitle('${cubit.singleProductModel.options![widget.index].name??''}:', size: 16),
              Styles.text(' $selectedColor', size: 16),
            ],
          ),
          SizedBox(height: 10.h,),
          SizedBox(
            height: 30.h,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(cubit.singleProductModel.options![widget.index].values!.length, (index) {
                int color = 4278190080 + (int.tryParse(cubit.singleProductModel.options![widget.index].values![index].value!.substring(1),radix: 16)??0);
                return GestureDetector(
                    onTap:(){
                      choices.fillRange(0, choices.length,false); //for ui
                      choices[index]=true; //for ui
                      selectedColor = cubit.singleProductModel.options![widget.index].values![index].name!; //for ui
                      cubit.setOption(widget.index, cubit.singleProductModel.options![widget.index].values![index].id!.toInt());
                      setState(() {});
                    },
                    child: ColoredCircle(
                      choose: choices[index], color: Color(color),));
              }),
            ),
          )
        ],
      ),
    );
  }
}
