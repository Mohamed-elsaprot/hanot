import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../tabs_screen/model/category_model/Product.dart';
import '../../manager/cart_cubit.dart';

class CustomCounterButton extends StatefulWidget {
  const CustomCounterButton({Key? key,required this.product,}) : super(key: key);
  final Product product;
  @override
  State<CustomCounterButton> createState() => _CustomCounterButtonState();
}

class _CustomCounterButtonState extends State<CustomCounterButton> {

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.r),
          ),
      child: Row(
        children: [
          TextButton(
              style: ElevatedButton.styleFrom(foregroundColor: Colors.grey.shade300),
              onPressed: () async{
                cartCubit.changeCount(widget.product, '+');
              },
              child: Text('+', style: TextStyle(fontSize: 22.sp, color: Colors.black38),)),
          SizedBox(
            child: Text(
              widget.product.count!.toString(),
              style: TextStyle(fontSize: 16.sp, color: Colors.black87),
            ),
          ),
          TextButton(
            style: ElevatedButton.styleFrom(foregroundColor: Colors.grey.shade300),
            onPressed: () async{
              cartCubit.changeCount(widget.product, '-');
              setState(() {});
            },
            child: Text('-', style: TextStyle(fontSize: 30.sp, color: Colors.black38),),
          ),
        ],
      ),
    );
  }
}
