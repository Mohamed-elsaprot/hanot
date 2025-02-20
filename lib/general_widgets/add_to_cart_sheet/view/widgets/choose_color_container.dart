import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/models/single_product_model/SingleProductModel.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../features/cart/manager/cart_cubit/cart_state.dart';
import '../../managers/single_products_details_cubit/single_products_details_cubit.dart';
import 'colored_circle.dart';

class ChooseColorContainer extends StatefulWidget {
  const ChooseColorContainer({Key? key, required this.index, required this.product}) : super(key: key);
  final int index;
  final SingleProductModel product;
  @override
  State<ChooseColorContainer> createState() => _ChooseColorContainerState();
}

class _ChooseColorContainerState extends State<ChooseColorContainer> {
  late SingleProductCubit singleProductCubit;
  late CartCubit cartCubit;
  // late HintCubit hintCubit;
  late List<bool> choices;
  late String? selectedColor;
  @override
  void initState() {
    singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
    cartCubit = BlocProvider.of(context);
    // hintCubit = BlocProvider.of<HintCubit>(context);
    choices = List.generate(singleProductCubit.singleProductModel.options![widget.index].values!.length, (index)=> index==0?true:false);
    selectedColor=  singleProductCubit.singleProductModel.options![widget.index].values![0].name;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Styles.text(singleProductCubit.singleProductModel.options![widget.index].name??'', size: 16),
          SizedBox(height: 10.h,),
          SizedBox(
            height: 30.h,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(singleProductCubit.singleProductModel.options![widget.index].values!.length, (index) {
                if(singleProductCubit.singleProductModel.options![widget.index].values![index].value != null){
                  int color = 4278190080 + (int.tryParse(singleProductCubit.singleProductModel.options![widget.index].values![index].value!.substring(1),radix: 16)??0);
                  return GestureDetector(
                      onTap:() async {
                        choices.fillRange(0, choices.length,false); //for ui
                        choices[index]=true; //for ui
                        selectedColor = singleProductCubit.singleProductModel.options![widget.index].values![index].name!; //for ui
                        singleProductCubit.setOption(widget.index, singleProductCubit.singleProductModel.options![widget.index].values![index].id!.toInt());
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
                      child: ColoredCircle(choose: choices[index], color: Color(color),));
                }else{
                  return const SizedBox();
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
