import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/design/widgets.dart';

class CustomRadioTiles<T> extends StatelessWidget {
  const CustomRadioTiles({Key? key, required this.val, required this.gVal, required this.fun, this.image, this.assetsImage, this.title, this.subTitle, this.horPadding=8, this.circleImage=false}) : super(key: key);
  final T val,gVal;
  final void Function(T?) fun;
  final String? image,assetsImage,title,subTitle;
  final double? horPadding;
  final bool? circleImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> fun(val),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color:val==gVal? Styles.primary : Colors.grey.shade200),
          color: val==gVal? Styles.primary.withOpacity(.1):Colors.transparent
        ),
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: horPadding!.w),
        child: Row(
          children: [
            if(assetsImage!=null) Image.asset(assetsImage!,width: 30.w,),
            if(image!=null) cachedImage(image??'',boxFit: BoxFit.fill,width:circleImage!?44: 50,height:circleImage!? 35:30,rad:circleImage!? 50:8),
            SizedBox(width: 12.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 200.w,
                    child: FittedBox(
                        alignment: AlignmentDirectional.centerStart,
                        fit: BoxFit.scaleDown,child: Styles.text(title??'', size: 14))),
                SizedBox(height: 6.h,),
                SizedBox(
                    width: 200.w,
                    child: FittedBox(
                      alignment: AlignmentDirectional.centerStart,
                        fit: BoxFit.scaleDown,
                        child: Styles.subTitle(subTitle??'', size: 11))
                ),
              ],
            ),
            const Spacer(),
            Radio(value: val, groupValue: gVal, onChanged: fun,activeColor: Styles.primary,),
          ],
        ),
      ),
    );
  }
}
