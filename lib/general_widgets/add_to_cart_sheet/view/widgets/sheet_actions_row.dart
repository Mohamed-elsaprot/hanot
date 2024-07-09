import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/models/single_product_model/SingleProductModel.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/add_to_cart_button.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/sheet_counter.dart';

class SheetActionsRow extends StatelessWidget {
  const SheetActionsRow({Key? key,required this.product}) : super(key: key);
  final SingleProductModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 14.w),
      child: Row(
        children: [
          const Expanded(flex: 6,child: SheetCounter()),
          Expanded(flex: 8, child: AddToCartButton(product: product,))
        ],
      ),
    );
  }
}
