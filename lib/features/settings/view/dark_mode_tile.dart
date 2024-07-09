import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/design/app_styles.dart';

class DarkModeTile extends StatefulWidget {
  const DarkModeTile({Key? key}) : super(key: key);

  @override
  State<DarkModeTile> createState() => _DarkModeTileState();
}

class _DarkModeTileState extends State<DarkModeTile> {
  bool val=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:val?Colors.black.withOpacity(.7): Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: ListTile(
        title: Row(
          children: [
            Icon(Icons.dark_mode_outlined,size: 20,color: val?Colors.white:Colors.black),
            SizedBox(width: 10.w,),
            Styles.text('الوضع الداكن',size: 12.5,color: val?Colors.white:Colors.black),
            const Spacer(),
            CupertinoSwitch(
                activeColor: Colors.white,
                thumbColor: Colors.grey.shade400,
                value: val,
                onChanged: (x){
                  val=x;
                  setState(() {});
                }
            )
          ],
        ),
      ),
    );
  }
}
