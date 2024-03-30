import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/general_widgets/item_sheet/cgoose_color_container.dart';
import 'package:hanot/general_widgets/item_sheet/choose_size_container.dart';
import 'package:hanot/general_widgets/item_sheet/data/single_product_repo/single_product_repo_impl.dart';
import 'package:hanot/general_widgets/item_sheet/managers/single_products_details_cubit/single_products_details_cubit.dart';
import 'package:hanot/general_widgets/item_sheet/managers/single_products_details_cubit/single_products_details_state.dart';
import 'package:hanot/general_widgets/item_sheet/models/sheet_options_shimmer.dart';
import 'package:hanot/general_widgets/item_sheet/sheet_sliver_appBar.dart';
import 'package:hanot/general_widgets/item_sheet/sheet_actions_row.dart';
import 'package:hanot/general_widgets/item_sheet/sheet_title_row.dart';

import '../../core/design/app_styles.dart';
import '../../features/tabs_screen/model/category_model/Product.dart';

class AddToCartSheet extends StatelessWidget {
  const AddToCartSheet({Key? key,required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SingleProductCubit(SingleProductRepoImpl())..getSingleProduct(id: product.id.toString()),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SheetSliverAppBar(product: product,),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h,),
                  SheetTitleRow(product: product),
                  SizedBox(height: 5.h,),
                  Styles.text(product.salePrice!=null||product.salePrice!=0? '${product.salePrice} PLN':'${product.costPrice} PLN',size: 18,color: Colors.black),
                  SizedBox(height: 8.h,),
                  BlocBuilder<SingleProductCubit,SingleProductDetailsState>(builder: (context,state){
                    var singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
                    if(state is SingleProductDetailsFailure){
                      return Center(child: Styles.text(state.errorMessage),);
                    }else if(state is SingleProductDetailsSuccess){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(singleProductCubit.singleProductModel.options!.length, (index) {
                            return singleProductCubit.singleProductModel.options![index].type=='color'? ChooseColorContainer(index: index):const SizedBox();
                          }),
                          ...List.generate(singleProductCubit.singleProductModel.options!.length, (index) {
                            return singleProductCubit.singleProductModel.options![index].type!='color'? ChooseSizeContainer(index: index,):const SizedBox();
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
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}