import 'package:flutter/material.dart';
import 'package:hanot/features/check_out_screen/view/widgets/price_row.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PriceRow(title: 'اجمالي السلة',price: 625,),
        PriceRow(title: 'اجمالي التخفيض',price: 0,),
        PriceRow(title: 'تخفيض الكوبون',price: 0,),
        PriceRow(title: 'رسوم الشحن',price: 75,),
        PriceRow(title: 'اجمالي الطلب',price: 300,total: true),
      ],
    );
  }
}
