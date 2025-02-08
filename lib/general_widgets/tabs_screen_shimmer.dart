import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/widgets_fun.dart';

class TabsScreenShimmer extends StatelessWidget {
  const TabsScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          shimmerWidget(height: 240.h,width: double.infinity),
          SizedBox(height: 8.h,),
          shimmerWidget(height: 60.h, width: double.infinity),
          SizedBox(height: 8.h,),
          SizedBox(
            height: 300.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    shimmerWidget(height: 230.h, width: 230.w,margin: EdgeInsets.symmetric(horizontal: 8.w)),
                    SizedBox(height: 4.h,),
                    shimmerWidget(height: 60.h, width: 230.w,margin: EdgeInsets.symmetric(horizontal: 8.w)),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
