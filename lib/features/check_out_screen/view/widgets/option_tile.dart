import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/consts.dart';
import 'package:hanot/features/check_out_screen/view/widgets/radio_button.dart';

import '../../../../core/design/app_styles.dart';

class OptionTile extends StatefulWidget {
   OptionTile({Key? key, required this.iconData, required this.title, required this.subTitle, required this.groupVal}) : super(key: key);
  final IconData iconData;
  final String title,subTitle;
  var groupVal;

  @override
  State<OptionTile> createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    List payMethod = ['فيزا','بايبال','كاش'];

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.grey.shade200
      ),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      child: ExpansionTile(
          leading: Icon(widget.iconData,size: 30.w,),
          backgroundColor: Colors.white,
          iconColor: Styles.primary,
          textColor: Styles.primary,
          title: Styles.text(widget.title,fontWeight: FontWeight.w500),
          subtitle: Styles.text(widget.subTitle,fontWeight: FontWeight.w900),
          children: [
            ...List.generate(3, (index) => RadioOption(
              title: payMethod[index],image: testImages[index],
              groupVal: widget.groupVal, val: index.toString(),
              fun: (x){
                widget.groupVal= index.toString();
                setState(() {});
              },
            ))

          ]
      ),
    );
  }
}
