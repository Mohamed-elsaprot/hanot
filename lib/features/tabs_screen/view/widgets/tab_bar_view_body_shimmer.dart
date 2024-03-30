import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/widgets.dart';

class TabBarViewBodyShimmer extends StatelessWidget {
  const TabBarViewBodyShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          SizedBox(
              height: 170.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int ind) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
                        child: shimmerWidget(height: 100.h, width: 200,rad: 20),
                      ),
                      shimmerWidget(height: 12,width: 120,rad: 10),
                    ],
                  );
                },
              )),
          // SizedBox(height: 8.h,),
          // shimmerWidget(height: 35.h, width: double.infinity),
          SizedBox(height: 8.h,),
          // SizedBox(
          //   height: 300.h,
          //   child: ListView.builder(
          //     physics: const BouncingScrollPhysics(),
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context,index){
          //       return Column(
          //         children: [
          //           shimmerWidget(height: 220.h, width: 230.w,margin: EdgeInsets.symmetric(horizontal: 8.w)),
          //           SizedBox(height: 4.h,),
          //           shimmerWidget(height: 60.h, width: 230.w,margin: EdgeInsets.symmetric(horizontal: 8.w)),
          //         ],
          //       );
          //     },
          //   ),
          // ),
          Row(
            children: [
              Expanded(flex: 1, child: shimmerItem()),
              SizedBox(width: 5.w,),
              Expanded(flex: 1, child: shimmerItem()),
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              Expanded(flex: 1, child: shimmerItem()),
              SizedBox(width: 5.w,),
              Expanded(flex: 1, child: shimmerItem()),
            ],
          ),
          SizedBox(height: 15.h,),
        ],
      ),
    );
  }
}

shimmerItem(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      shimmerWidget(height: 170.h, width: double.infinity),
      Padding(
        padding: EdgeInsets.only(right: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            shimmerWidget(height: 8.h, width: 80),
            SizedBox(height: 10.h,),
            shimmerWidget(height: 10.h, width: 150,),
          ],
        ),
      ),

    ],
  );
}
