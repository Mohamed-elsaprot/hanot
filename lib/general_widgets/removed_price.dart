import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/design/app_styles.dart';
import '../core/local_storage/secure_storage.dart';

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
            width: 60,
            // height: 30,
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Styles.subTitle('$removedPrice ${SecureStorage.currency}',size: textSize,textDecoration: TextDecoration.lineThrough)
            ),
          ),

        ],
      ),
    );
  }
}
