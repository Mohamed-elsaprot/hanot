import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../features/cart/manager/cart_cubit/cart_cubit.dart';
import '../../managers/hint_cubit/hint_cubit.dart';
import '../../managers/hint_cubit/hint_state.dart';
import '../../managers/single_products_details_cubit/single_products_details_cubit.dart';
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
  late HintCubit hintCubit;
  late List<bool> choices;

  @override
  void initState() {
    singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
    cartCubit = BlocProvider.of<CartCubit>(context);
    hintCubit = BlocProvider.of<HintCubit>(context);
    choices = List.generate(singleProductCubit.singleProductModel.options![widget.index].values!.length, (index)=> index==0?true:false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.text(singleProductCubit.singleProductModel.options![widget.index].name??'',size: 16),
          SizedBox(height: 10.h,),
          SizedBox(
            height: 28.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                ...List.generate(singleProductCubit.singleProductModel.options![widget.index].values!.length, (ind) => GestureDetector(
                  onTap: () async {
                    choices.fillRange(0, choices.length,false); //for ui
                    choices[ind]=true; //for ui
                    singleProductCubit.setOption(widget.index, singleProductCubit.singleProductModel.options![widget.index].values![ind].id!.toInt());
                    setState(() {});
                    hintCubit.emit(HintLoading());
                    await cartCubit.getSkuDetails(
                        isAddToCartButton: false,
                        selectedOptionsList: singleProductCubit.productOptionsList,
                        product: singleProductCubit.singleProductModel,
                        body: {"options": singleProductCubit.productOptionsList, "product_id": widget.product.id!.toInt()},
                        context: context
                    );
                    hintCubit.emit(HintInitial());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.black38),
                        color: choices[ind]==true?Colors.grey.shade300:Colors.white
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.w,),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    alignment: Alignment.center,
                    child: Styles.text(singleProductCubit.singleProductModel.options![widget.index].values![ind].name??'',textAlign: TextAlign.center,fontWeight: FontWeight.w500,size: 14),
                  ),
                ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
