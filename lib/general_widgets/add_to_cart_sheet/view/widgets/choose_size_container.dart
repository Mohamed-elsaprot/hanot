import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_state.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/new_widgets/options_sheet.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../features/cart/manager/cart_cubit/cart_cubit.dart';
import '../../managers/single_products_details_cubit/single_products_details_cubit.dart';
import '../../managers/single_products_details_cubit/single_products_details_state.dart';
import '../../models/single_product_model/SingleProductModel.dart';

class ChooseSizeContainer extends StatefulWidget {
  const ChooseSizeContainer({Key? key, required this.index, required this.product}) : super(key: key);
  final int index;
  final SingleProductModel product;
  @override
  State<ChooseSizeContainer> createState() => _ChooseSizeContainerState();
}

class _ChooseSizeContainerState extends State<ChooseSizeContainer> {
  late SingleProductCubit singleProductCubit;
  late CartCubit cartCubit;
  late List<bool> choices;
  @override
  void initState() {
    singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
    cartCubit = BlocProvider.of<CartCubit>(context);
    choices = List.generate(singleProductCubit.singleProductModel.options![widget.index].values!.length, (index)=> index==0?true:false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.subTitle(singleProductCubit.singleProductModel.options![widget.index].name??'Option ${widget.index+1}',size: 16),
          SizedBox(height: 6.h,),
          singleProductCubit.singleProductModel.options![widget.index].values!.length>3?BlocBuilder<CartCubit,CartState>(builder: (context,state)=>Container(
            decoration: BoxDecoration(
                border: Border.all(),color: Colors.white,
                borderRadius: BorderRadius.circular(50)
            ),
            child: ListTile(
              minTileHeight: 35.h,
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
              trailing: const Icon(Icons.arrow_drop_down_outlined),
              title: Styles.text(
                  singleProductCubit.singleProductModel.options![widget.index].values![singleProductCubit.selectedOptionsIndex[widget.index]!].name??'',
              ),
              onTap: (){
                bottomSheet(context, BlocProvider.value(value: BlocProvider.of<SingleProductCubit>(context),
                  child: OptionsSheet(index: widget.index, product: widget.product,),
                ),
                );
              },
            ),
          )):SizedBox(
            height: 30.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children:
              List.generate(singleProductCubit.singleProductModel.options![widget.index].values!.length, (ind) => GestureDetector(
                onTap: () async {
                  choices.fillRange(0, choices.length,false); //for ui
                  choices[ind]=true; //for ui
                  singleProductCubit.setOption(widget.index, singleProductCubit.singleProductModel.options![widget.index].values![ind].id!.toInt());
                  setState(() {});
                  await cartCubit.getSkuDetails(
                      isAddToCartButton: false,
                      selectedOptionsList: singleProductCubit.productOptionsList,
                      product: singleProductCubit.singleProductModel,
                      body: {"options": singleProductCubit.productOptionsList, "product_id": widget.product.id!.toInt()},
                      context: context
                  ).then((val){
                    singleProductCubit.setNewSingleProductVal(sku: cartCubit.skuDetails);
                    cartCubit.emit(CartSuccess());
                  });
                  },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color:choices[ind]==true?Colors.black: Colors.black38,width: choices[ind]==true?2:1),
                      color: Colors.white
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.w,),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  alignment: Alignment.center,
                  child: Styles.text(singleProductCubit.singleProductModel.options![widget.index].values![ind].name??'',textAlign: TextAlign.center,fontWeight: FontWeight.w500,size: 14),
                ),
              ),),
            ),
          )
        ],
      ),
    );
  }
}

