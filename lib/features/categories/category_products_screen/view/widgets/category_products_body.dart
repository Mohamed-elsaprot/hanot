import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/category_model/Product.dart';
import '../../../../../general_widgets/general_products_list.dart';
import '../../../manager/small_category_products_cubit/small_category_products_cubit.dart';

class CategoryProductsBody extends StatelessWidget {
  const CategoryProductsBody({Key? key, required this.scrollController,}) : super(key: key);
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SmallCategoryProductsAndChildrenCubit>(context);
    return ListView(
        controller: scrollController,
      children: [
        cubit.filteredList.isEmpty?
        GeneralProductsListBody(productList: cubit.categoryProductsModel.productsList??[] as List<Product>,scrollController: scrollController,last: cubit.last,):
        GeneralProductsListBody(productList: cubit.filteredList,scrollController: scrollController,last: true,)

      ],
    );
  }
}


// Container(color: Colors.grey.shade100,width: double.infinity,height: 20.h,alignment: Alignment.center,
//   child: Styles.text('${lang.texts['mobile_free_delivery_over_label']}${SecureStorage.currency} | ${lang.texts['mobile_free_delivery_over_label']}',size: 12),),
// Container(color: Colors.white,width: double.infinity,height: 35.h,alignment: Alignment.center,
//   child: Styles.subTitle(
//       cubit.filteredList.isEmpty?'${cubit.categoryProductsModel!.productsList!.length} ${lang.texts['mobile_product_label']}':
//       '${cubit.filteredList.length} ${lang.texts['mobile_product_label']}',
//       size: 18,fontWeight: FontWeight.w100,color: Colors.black87),),

// if(cubit.categoryDetails.hasChildren!)
//               Container(
//                   color: Colors.black,
//                   height: 30.h,
//                   child: ListView.builder(
//                     physics: const BouncingScrollPhysics(),
//                     scrollDirection: Axis.horizontal,
//                     itemCount: cubit.categoryDetails.children!.length,
//                     itemBuilder: (BuildContext context, int ind) => SubCategoryCard(
//                       children: cubit.categoryDetails.children![ind],
//                       childrenName: cubit.categoryDetails.children![ind].name,
//                       childrenImage: cubit.categoryDetails.children![ind].image,
//                     ),
//                   )),