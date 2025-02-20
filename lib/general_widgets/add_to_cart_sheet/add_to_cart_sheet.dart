import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/design/widgets_fun.dart';
// import 'package:hanot/features/cart/manager/cart_cubit/cart_state.dart';
// import 'package:hanot/general_widgets/add_to_cart_sheet/managers/hint_cubit/hint_cubit.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/managers/single_products_details_cubit/single_products_details_state.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/product_sheet_body.dart';

import '../../core/models/category_model/Product.dart';
import '../../features/cart/manager/cart_cubit/cart_cubit.dart';
import '../../features/cart/manager/cart_cubit/cart_state.dart';
import 'data/single_product_repo/single_product_repo_impl.dart';
// import 'managers/hint_cubit/hint_state.dart';
import 'managers/single_products_details_cubit/single_products_details_cubit.dart';

class AddToCartScreen extends StatelessWidget {
  const AddToCartScreen({Key? key, required this.product, this.fromFavScreen=false}) : super(key: key);
  final Product product;
  final bool fromFavScreen;
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => SingleProductCubit(SingleProductRepoImpl())..getSingleProduct(id: product.id.toString()),),
            // BlocProvider(create: (context) => HintCubit(),)
          ],
          child: BlocConsumer<SingleProductCubit,SingleProductDetailsState>(
            listener: (context,state) async {
              if(state is SingleProductDetailsSuccess){
                var singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
                await cartCubit.getSkuDetails(
                    isAddToCartButton: false,
                    selectedOptionsList: singleProductCubit.productOptionsList,
                    product: singleProductCubit.singleProductModel,
                    body: {"options": singleProductCubit.productOptionsList, "product_id": singleProductCubit.singleProductModel.id!.toInt()},
                    context: context).then((val){
                  singleProductCubit.setNewSingleProductVal(sku: cartCubit.skuDetails,resetCount: false);
                  cartCubit.emit(CartSuccess());
                });
              }
              if(state is SingleProductDetailsFailure){
                errorDialog(context: context, message: state.errorMessage);
              }
            },
            builder: (BuildContext context, SingleProductDetailsState state) {
              if(state is SingleProductDetailsSuccess ){
                return SheetBody(product: product,fromFavScreen: fromFavScreen,);
              }else{
                return Scaffold(body: Hero(tag: product.id!,child: Stack(
                  children: [
                    cachedImage(product.image??'',height: 480),
                    GestureDetector(
                      onTap: ()=>Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30.h),color: Colors.transparent,
                        child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 28,),
                      ),
                    ),
                  ],
                )));
              }
            },
          ),
    );
  }
}

