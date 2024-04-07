import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';

import '../../../../core/design/app_styles.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({Key? key, required this.title, required this.price, this.total=false}) : super(key: key);
  final String title;
  final num price;
  final bool? total;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Styles.subTitle(title,color: total!? Colors.black:Colors.black38,size:  !total!? 15:18,fontWeight: total!? FontWeight.w900:FontWeight.w600),
            const Spacer(),
            Styles.subTitle(price.toString(),color:const Color(0xffa40c0c),size: !total!? 15:18,fontWeight: total!? FontWeight.w900:FontWeight.w600),
            SizedBox(width: 5.w,),
            Styles.subTitle(Texts.currency,size:  !total!? 15:18,fontWeight: total!? FontWeight.w900:FontWeight.w600),
          ],
        ),
        if(!total!) const Divider(height: 20,thickness: .5,color: Colors.black,),
      ],
    );
  }
}
