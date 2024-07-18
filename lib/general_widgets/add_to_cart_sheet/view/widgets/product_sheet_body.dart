import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/models/category_model/Product.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/product_details_container.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/sheet_app_bar.dart';

import '../../managers/single_products_details_cubit/single_products_details_cubit.dart';
import 'options_colum.dart';
import 'sheet_actions_row.dart';

class SheetBody extends StatelessWidget {
  const SheetBody({Key? key, required this.product,}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    var textsMap = BlocProvider.of<LangCubit>(context).texts;
    var singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const SizedBox(),
        bottom: PreferredSize(preferredSize: Size(0, 25.h), child: SheetAppBar(product: product,),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20.h),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 15.h,),
            ProductDetailsContainer(product: singleProductCubit.singleProductModel),
            SizedBox(height: 10.h,),
            const OptionsColumn(),
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Styles.text(textsMap['mobile_des']),
                  const SizedBox(height: 8,),
                  Styles.subTitle(singleProductCubit.singleProductModel.options.toString(),size: 11),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SheetActionsRow(product: singleProductCubit.singleProductModel),
    );
  }
}
