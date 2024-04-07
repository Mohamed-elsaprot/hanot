import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/managers/hint_cubit/hint_cubit.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/view/widgets/sheet_body.dart';

import '../../features/tabs_screen/model/category_model/Product.dart';
import 'data/single_product_repo/single_product_repo_impl.dart';
import 'managers/single_products_details_cubit/single_products_details_cubit.dart';

class AddToCartSheet extends StatelessWidget {
  const AddToCartSheet({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleProductCubit(SingleProductRepoImpl())
        ..getSingleProduct(id: product.id.toString()),
      child: BlocProvider(
        create: (context) {
          return HintCubit();
          },
        child: SheetBody(product: product),
      ),
    );
  }
}
