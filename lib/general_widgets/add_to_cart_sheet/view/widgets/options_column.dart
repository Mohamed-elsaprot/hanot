import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/managers/hint_cubit/hint_cubit.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/managers/hint_cubit/hint_state.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/sheet_actions_row.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../features/tabs_screen/model/category_model/Product.dart';
import '../../managers/single_products_details_cubit/single_products_details_cubit.dart';
import '../../managers/single_products_details_cubit/single_products_details_state.dart';
import '../../models/sheet_options_shimmer.dart';
import 'cgoose_color_container.dart';
import 'choose_size_container.dart';

class OptionsBody extends StatelessWidget {
  const OptionsBody({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    var singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var hintCubit = BlocProvider.of<HintCubit>(context);
    return BlocConsumer<SingleProductCubit,SingleProductDetailsState>(
        listener: (context,state) async {
          if(state is SingleProductDetailsSuccess){
            hintCubit.emit(HintLoading());
            await cartCubit.getSkuDetails(
                isAddToCartButton: false,
                selectedOptionsList: singleProductCubit.productOptionsList,
                product: singleProductCubit.singleProductModel,
                body: {"options": singleProductCubit.productOptionsList, "product_id": product.id!.toInt()},
                context: context);
            hintCubit.emit(HintInitial());
          }
        },
      builder: (context,state){
      if(state is SingleProductDetailsFailure){
        return Center(child: Styles.text(state.errorMessage),);
      }else if(state is SingleProductDetailsSuccess){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(singleProductCubit.singleProductModel.options!.length, (index) {
              return singleProductCubit.singleProductModel.options![index].type=='color'? ChooseColorContainer(product: product,index: index):const SizedBox();
            }),
            ...List.generate(singleProductCubit.singleProductModel.options!.length, (index) {
              return singleProductCubit.singleProductModel.options![index].type!='color'? ChooseSizeContainer(product: product,index: index,):const SizedBox();
            }),
            if(singleProductCubit.singleProductModel.options!.length==1) SizedBox(height: 85.h,),
            if(singleProductCubit.singleProductModel.options!.isEmpty) SizedBox(height: 190.h,),
            if(singleProductCubit.singleProductModel.options!.length>1) SizedBox(height: 20.h,),
            SheetActionsRow(product: product,)
          ],
        );
      }else{
        return const SheetOptionsShimmer();
      }
    });
  }
}
