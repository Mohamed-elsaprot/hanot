import 'package:flutter/material.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/design/widgets_fun.dart';

import 'cart_appBar.dart';

class CartScreeShimmer extends StatelessWidget {
  const CartScreeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(10, (index) => Stack(
              children: [
                shimmerWidget(height: 120, width: double.infinity,),
                shimmerWidget(height: 95, width: 120,rad: 8,margin: const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0)),
                shimmerWidget(height: 12, width: 180,rad: 8,margin: const EdgeInsetsDirectional.fromSTEB(160, 35, 0, 0)),
                shimmerWidget(height: 12, width: 140,rad: 8,margin: const EdgeInsetsDirectional.fromSTEB(160, 70, 0, 0)),
                shimmerWidget(height: 12, width: 110,rad: 8,margin: const EdgeInsetsDirectional.fromSTEB(160, 100, 0, 0)),

                // const Divider(color: Colors.white,height: 20,)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
