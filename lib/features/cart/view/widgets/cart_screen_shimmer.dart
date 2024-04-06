import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/widgets.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';

class CartScreeShimmer extends StatelessWidget {
  const CartScreeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Styles.text(Texts.cart,size: 22).tr(),),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shimmerWidget(height: 15, width: 125,margin: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0)),
            SizedBox(height: 10.h,),
            ...List.generate(10, (index) => Stack(
              children: [
                shimmerWidget(height: 220, width: double.infinity,rad: 8,margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h,)),
                shimmerWidget(height: 110, width: 100,margin: const EdgeInsetsDirectional.fromSTEB(30, 25, 0, 0)),
                shimmerWidget(height: 15, width: 180,margin: const EdgeInsetsDirectional.fromSTEB(150, 60, 0, 0)),
                shimmerWidget(height: 15, width: 120,margin: const EdgeInsetsDirectional.fromSTEB(150, 120, 0, 0)),
                shimmerWidget(height: 40, width: 150,margin: const EdgeInsetsDirectional.fromSTEB(30, 190, 0, 0),rad: 5),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
