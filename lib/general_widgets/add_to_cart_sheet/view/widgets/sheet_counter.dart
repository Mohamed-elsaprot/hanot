import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/managers/single_products_details_cubit/single_products_details_state.dart';

import '../../managers/single_products_details_cubit/single_products_details_cubit.dart';

class SheetCounter extends StatefulWidget {
  const SheetCounter({Key? key,}) : super(key: key);
  @override
  State<SheetCounter> createState() => _SheetCounterState();
}

class _SheetCounterState extends State<SheetCounter> {
  @override
  Widget build(BuildContext context) {
    var singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
    return Row(
      children: [
        SizedBox(
          height: 35.w,width: 35.w,
          child: TextButton(
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Colors.grey.shade100,),
            onPressed: () async {
              if(singleProductCubit.count>1){
                singleProductCubit.count--;
                setState(() {});
                singleProductCubit.emit(SingleProductDetailsSuccess());
              }
            },
            child: Text('-', style: TextStyle(fontSize: 20.sp, color: Colors.black),),
          ),
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey.shade300)
            ),
            height: 35.w,width: 45.w,alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 6,),
            padding: const EdgeInsets.all(2),
            child: FittedBox(fit: BoxFit.scaleDown,child: Text(singleProductCubit.count.toString(),style: const TextStyle(fontWeight: FontWeight.w600),))),
        SizedBox(
          height: 35.w,width: 35.w,
          child: TextButton(
              style: ElevatedButton.styleFrom(foregroundColor: Colors.white10,backgroundColor: Colors.grey.shade100,),
              onPressed:() async {
                singleProductCubit.count++;
                setState(() {});
                singleProductCubit.emit(SingleProductDetailsSuccess());
              },
              child:Text('+', style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w400, color: Colors.black,),)),
        ),
      ],
    );
  }
}
