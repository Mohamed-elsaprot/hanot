import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/design/appTexts.dart';
import '../core/design/app_styles.dart';

class RemovedPrice extends StatelessWidget {
  const RemovedPrice({Key? key, required this.removedPrice, this.textSize=14}) : super(key: key);
  final num removedPrice;
  final double? textSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      child: Stack(
        children: [
          SizedBox(
            width: 60,  height: 30,
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Styles.subTitle('$removedPrice ${Texts.currency}',size: textSize)
            ),
          ),
          Positioned(
            bottom: 12,
            child: Container(
              margin: const EdgeInsets.only(left: 6),
              color: Colors.black38,height: 1,width: 70,
            ),
          )
        ],
      ),
    );
  }
}
