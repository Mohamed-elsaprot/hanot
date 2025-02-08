import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/widgets_fun.dart';

class NavScreenShimmer extends StatelessWidget {
  const NavScreenShimmer({Key? key, this.isHome=false}) : super(key: key);
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(!isHome)shimmerWidget(height: 45.h, width: double.infinity),
            if(!isHome)SizedBox(height: 2,),
            if(!isHome)shimmerWidget(height: 25.h, width: double.infinity),
            if(!isHome)SizedBox(height: 2,),
            shimmerWidget(height: 265.h, width: double.infinity),
            SizedBox(height: 12.h,),
            shimmerWidget(height: 12.h, width: 150.w,rad: 50,margin: EdgeInsets.symmetric(horizontal: 10.w)),
            SizedBox(height: 15.h,),
            SizedBox(
              height: 200.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      shimmerWidget(height: 155, width: 170),
                      SizedBox(height: 10.h,),
                      shimmerWidget(height: 12, width: 60,rad: 50),
                      SizedBox(height: 8.h,),
                      shimmerWidget(height: 12, width: 120,rad: 50),
                    ],
                  ),
                  separatorBuilder: (context,index)=>SizedBox(width: 8.w,), itemCount: 8),
            ),
            SizedBox(height: 20.h,),
            SizedBox(
              height: 240.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>Column(
                    children: List.generate(2, (index)=>Column(
                      children: [
                        shimmerWidget(height: 75, width: 95,rad: 100),
                        SizedBox(height: 10.h,),
                        shimmerWidget(height: 12, width: 80.w,rad: 50),
                        SizedBox(height: 20.h,),
                      ],
                    )),
                  ),
                  separatorBuilder: (context,index)=>SizedBox(width: 8.w,), itemCount: 8),
            ),
            SizedBox(height: 30.h,),
          ],
        ),
      ),
      // bottomNavigationBar: shimmerWidget(height: 50.h, width: double.infinity),
    );
  }
}
