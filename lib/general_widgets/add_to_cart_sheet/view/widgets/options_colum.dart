import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../managers/single_products_details_cubit/single_products_details_cubit.dart';
import 'choose_color_container.dart';
import 'choose_size_container.dart';

class OptionsColumn extends StatelessWidget {
  const OptionsColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var singleProductCubit = BlocProvider.of<SingleProductCubit>(context);
    return Column(
      children: [
        ...List.generate(singleProductCubit.singleProductModel.options!.length, (index) {
          return singleProductCubit.singleProductModel.options![index].type=='color'? ChooseColorContainer(product: singleProductCubit.singleProductModel,index: index):const SizedBox();
        }),
        ...List.generate(singleProductCubit.singleProductModel.options!.length, (index) {
          return singleProductCubit.singleProductModel.options![index].type!='color'?
          ChooseSizeContainer(product: singleProductCubit.singleProductModel,index: index,):const SizedBox();
        }),
      ],
    );
  }
}
