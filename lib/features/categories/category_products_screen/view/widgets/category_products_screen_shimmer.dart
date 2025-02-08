import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';

import '../../../../../core/design/widgets_fun.dart';

class CategoryProductsScreenShimmer extends StatelessWidget {
  const CategoryProductsScreenShimmer({Key? key, this.padding=10, this.withBar=false,}) : super(key: key);
  final double? padding;
  final bool withBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: catAppBar(context: context,),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          shimmerWidget(height: 45.h, width: double.infinity),
          SizedBox(height: 2.h,),
          shimmerWidget(height: 25.h, width: double.infinity),
          SizedBox(height: 2.h,),
          shimmerWidget(height: 40.h, width: double.infinity),
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: padding!.h,horizontal: padding!.w),
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250.w,
                  mainAxisExtent: 235.h,
                  mainAxisSpacing: 14.h,
                  crossAxisSpacing: 14.w,
                ), itemBuilder: (context,index){
              return shimmerWidget(height: 235.h, width: double.infinity,);
            }),
          ),
        ],
      ),
    );
  }
}
