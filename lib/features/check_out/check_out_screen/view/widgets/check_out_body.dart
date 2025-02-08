import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/payment_methods_container.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/price_container.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/shipping_container.dart';

import '../../../all_old_addresses_screen/manager/all_addresses_cubit.dart';
import '../../manager/shipping_companies_cubit/shipping_companies_cubit.dart';
import '../../manager/shipping_companies_cubit/shipping_companies_state.dart';
import 'address_container.dart';
import 'complete_order_Container.dart';
import 'coupon_container.dart';
import 'note_container.dart';

class CheckOutBody extends StatelessWidget {
  const CheckOutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var add = BlocProvider.of<AllAddressesCubit>(context);
    return Scaffold(
      appBar: customAppBar(context,withCartIcon: false),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              const AddressContainer(),
                BlocBuilder<ShippingCompaniesCubit,ShippingCompaniesState>(builder: (context,state)=>add.selectedAddress!=null?Column(
                  children: [
                    SizedBox(height: 10.h,),
                    const ShippingContainer(),
                  ],
                ):const SizedBox()),
              SizedBox(height: 10.h,),
              const PaymentMethodsContainer(),
              SizedBox(height: 10.h,),
              const CouponContainer(),
              SizedBox(height: 10.h,),
              const NoteContainer(),
              SizedBox(height: 10.h,),
              const PriceContainer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CompleteOrderContainer(),
    );
  }
}
