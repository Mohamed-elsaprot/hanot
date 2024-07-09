import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';
import '../../data/cart_repo_impl.dart';
import '../../manager/counter_cubit/counter_cubit.dart';
import '../../manager/counter_cubit/counter_state.dart';
import '../../models/CartProductModel.dart';
import 'counter_button.dart';

class CartItemDetailsContainer extends StatelessWidget {
  const CartItemDetailsContainer({Key? key, required this.cartProductModel, required this.indexInCartList}) : super(key: key);
  final CartProductModel cartProductModel;
  final int indexInCartList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.text(cartProductModel.name??'',size: 11,overflow: TextOverflow.ellipsis),
          SizedBox(height: 8.h,),
          Styles.subTitle(cartProductModel.image??''),
          SizedBox(height: 8.h,),
          Styles.subTitle('متبقي 12 قطعة',color: Colors.red),
          BlocProvider(
            create: (context) => CounterCubit(CartRepoImpl()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<CounterCubit,CounterState>(builder: (context,state)=>
                    Container(
                      alignment: AlignmentDirectional.centerStart, width: 70.w,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Styles.text('${cartProductModel.total} ${Texts.currency}',size: 15,color: Styles.primary,fontWeight: FontWeight.w400),
                      ),
                    ),
                ),
                CustomCounterButton(product: cartProductModel,indexInCartList: indexInCartList),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
