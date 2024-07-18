import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/managers/hint_cubit/hint_cubit.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/managers/single_products_details_cubit/single_products_details_state.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/product_sheet_body.dart';

import '../../core/models/category_model/Product.dart';
import '../../features/cart/manager/cart_cubit/cart_cubit.dart';
import 'data/single_product_repo/single_product_repo_impl.dart';
import 'managers/hint_cubit/hint_state.dart';
import 'managers/single_products_details_cubit/single_products_details_cubit.dart';

class AddToCartSheet extends StatelessWidget {
  const AddToCartSheet({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocProvider(
      create: (context) => SingleProductCubit(SingleProductRepoImpl())..getSingleProduct(id: product.id.toString()),
      child: BlocProvider(
        create: (context) => HintCubit(),
        child: BlocConsumer<SingleProductCubit,SingleProductDetailsState>(
          listener: (context,state) async {
            if(state is SingleProductDetailsSuccess){
              var singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
              var hintCubit = BlocProvider.of<HintCubit>(context);
              hintCubit.emit(HintLoading());
              await cartCubit.getSkuDetails(
                  isAddToCartButton: false,
                  selectedOptionsList: singleProductCubit.productOptionsList,
                  product: singleProductCubit.singleProductModel,
                  body: {"options": singleProductCubit.productOptionsList, "product_id": singleProductCubit.singleProductModel.id!.toInt()},
                  context: context);
              hintCubit.emit(HintInitial());
            }
            if(state is SingleProductDetailsFailure){
              errorDialog(context: context, message: state.errorMessage);
            }
          },
          builder: (BuildContext context, SingleProductDetailsState state) {
          if(state is SingleProductDetailsSuccess){
            return SheetBody(product: product,);
          }else{
            return loadingIndicator();
          }
         },
        ),
      ),
    );
  }
}
