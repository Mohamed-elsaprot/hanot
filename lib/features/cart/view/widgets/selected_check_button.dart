import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_state.dart';

import '../../../../core/design/app_styles.dart';
import '../../manager/cart_cubit/cart_cubit.dart';

class SelectedCheckButton extends StatefulWidget {
  const SelectedCheckButton({Key? key, required this.cartIndex}) : super(key: key);
  final int cartIndex;
  @override
  State<SelectedCheckButton> createState() => _SelectedCheckButtonState();
}

class _SelectedCheckButtonState extends State<SelectedCheckButton> {
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return GestureDetector(
      onTap: () {
        cartCubit.selectedList[widget.cartIndex] = !cartCubit.selectedList[widget.cartIndex];
        if(cartCubit.selectedList.contains(false)){
          cartCubit.allSelected=false;
        }else{
          cartCubit.allSelected=true;
        }
        cartCubit.emit(CartSuccess());
        setState(() {});
      },
      child: Container(
        height: 100,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:cartCubit.selectedList[widget.cartIndex]? Styles.primary:Colors.white,
              border: Border.all(color: cartCubit.selectedList[widget.cartIndex]? Colors.transparent:Colors.black26)
          ),
          height: 20.w,width: 20.w,
          child: cartCubit.selectedList[widget.cartIndex]?const Icon(Icons.check, color: Colors.white, size: 18,):null,
        ),
      ),
    );
  }
}
