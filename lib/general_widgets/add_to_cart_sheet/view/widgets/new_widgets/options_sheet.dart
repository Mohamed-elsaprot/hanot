import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/design/widgets_fun.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_state.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../features/cart/manager/cart_cubit/cart_cubit.dart';
import '../../../../custom_button.dart';
import '../../../managers/single_products_details_cubit/single_products_details_cubit.dart';
import '../../../models/single_product_model/SingleProductModel.dart';

class OptionsSheet extends StatefulWidget {
  const OptionsSheet({Key? key, required this.index,required this.product,}) : super(key: key);
  final int index;
  final SingleProductModel product;

  @override
  State<OptionsSheet> createState() => _OptionsSheetState();
}

class _OptionsSheetState extends State<OptionsSheet> {
  late SingleProductCubit singleProductCubit;
  late CartCubit cartCubit;
  late Map texts;
  @override
  void initState() {
    singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
    cartCubit = BlocProvider.of<CartCubit>(context);
    texts = BlocProvider.of<LangCubit>(context).texts;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 640.h,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,scrolledUnderElevation: 0,automaticallyImplyLeading: false,
          backgroundColor: Styles.secScaffoldColor,
          title: Styles.text(singleProductCubit.singleProductModel.options![widget.index].name??'Choose Option ${widget.index+1}'),
          actions: [IconButton(onPressed: ()=>Navigator.pop(context), icon: const Icon(Icons.close))],
        ),
        body: ListView(
          children: List.generate(singleProductCubit.singleProductModel.options![widget.index].values!.length, (ind) =>
              RadioListTile(
                activeColor: Styles.primary,
                value: ind,
                groupValue: singleProductCubit.selectedOptionsIndex[widget.index], onChanged: (x){
                singleProductCubit.selectedOptionsIndex[widget.index]=x!;
                setState(() {});
              },
                title: Styles.text(singleProductCubit.singleProductModel.options![widget.index].values![ind].name??'No Name',size: 16),
              )
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
          child: BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {
                  if(state is CartSuccess) Navigator.pop(context);
                  if(state is CartFailure) errorDialog(context: context, message: state.errorMessage);
                },
            builder: (context,state){
                  if(state is CartLoading){
                    return CustomButton(fun: ()async{}, title: '',rad: 50,titleWidget: SizedBox(height: 23.h,child: loadingIndicator(color: Colors.white)),);
                  }else {
                    return CustomButton(
                      fun: ()async{
                        if(singleProductCubit.selectedOptionsIndex[widget.index]!=-1){
                          singleProductCubit.setOption(widget.index, singleProductCubit.singleProductModel.options![widget.index].values![singleProductCubit.selectedOptionsIndex[widget.index]].id!.toInt());
                          await cartCubit.getSkuDetails(
                              isAddToCartButton: false,
                              selectedOptionsList: singleProductCubit.productOptionsList,
                              product: singleProductCubit.singleProductModel,
                              body: {"options": singleProductCubit.productOptionsList, "product_id": widget.product.id!.toInt()},
                              context: context
                          ).then((val){
                            singleProductCubit.setNewSingleProductVal(sku: cartCubit.skuDetails);
                          });
                        }
                      }, title: texts['mobile_select_label'],rad: 50,);
                  }
            },
          ),
        ),
      ),
    );
  }
}
