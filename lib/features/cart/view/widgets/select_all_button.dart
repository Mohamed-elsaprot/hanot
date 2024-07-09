import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_state.dart';

import '../../../../core/design/app_styles.dart';
import '../../manager/cart_cubit/cart_cubit.dart';

class SelectAllButton extends StatefulWidget {
  const SelectAllButton({Key? key}) : super(key: key);

  @override
  State<SelectAllButton> createState() => _SelectAllButtonState();
}

class _SelectAllButtonState extends State<SelectAllButton> {
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit,CartState>(builder: (context,state){
      return GestureDetector(
        onTap: (){
          cartCubit.changeAllSelectedList();
          setState(() {});
        },
        child: Row(
          children: [
            Container(
              height: 18.w,width: 18.w,
              decoration: BoxDecoration(
                  border: Border.all(color:cartCubit.allSelected?Colors.transparent: Colors.black26),
                  shape: BoxShape.circle,
                  color:cartCubit.allSelected? Styles.primary:Colors.white
              ),
              alignment: Alignment.center,
              child:cartCubit.allSelected? const Icon(Icons.check,color: Colors.white,size: 13,):null,
            ),
            SizedBox(width: 4.w,),
            Styles.subTitle('تحديد الكل',size: 12),
          ],
        ),
      );
    });
  }
}
