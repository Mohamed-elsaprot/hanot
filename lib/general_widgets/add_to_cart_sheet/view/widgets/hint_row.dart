import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/tabs_screen/model/category_model/Product.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/managers/single_products_details_cubit/single_products_details_cubit.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/managers/single_products_details_cubit/single_products_details_state.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/widgets.dart';
import '../../../../features/cart/manager/cart_cubit/cart_cubit.dart';
import '../../managers/hint_cubit/hint_cubit.dart';
import '../../managers/hint_cubit/hint_state.dart';

class HintAndPriceRow extends StatelessWidget {
  const HintAndPriceRow({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<SingleProductCubit,SingleProductDetailsState>(builder: (context,state){
      if(state is SingleProductDetailsSuccess){
        return Row(
          children: [
            Styles.text(product.salePrice!=null||product.salePrice!=0? '${product.salePrice} PLN':'${product.costPrice} PLN',size: 18,color: Colors.black),
            SizedBox(width: 20.w,),
            BlocBuilder<HintCubit,HintState>(builder: (context,state){
              print(state);
              if(state is HintLoading){
                return shimmerWidget(height: 15.h, width: 150.w,rad: 10);
              }else {
                return cartCubit.hintNum>0? Styles.text('متوفر',color: Colors.green):
              SizedBox(
                  width: 260.w,
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Styles.text('هذا المنتج غير متوفر بهذه المواصفات حاليا',color: Colors.red)));
              }
            }),
          ],
        );
      }else{
        return shimmerWidget(height: 15.h, width: 300.w,rad: 10);
      }
    });
  }
}
