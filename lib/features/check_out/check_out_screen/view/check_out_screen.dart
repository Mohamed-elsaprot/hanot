import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/widgets_fun.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_address_state.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_addresses_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/check_out_body.dart';

import '../../../../core/design/fun.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  late AllAddressesCubit addressCubit;
  @override
  void initState() {
    addressCubit = BlocProvider.of<AllAddressesCubit>(context);
    addressCubit.getAllAddresses();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllAddressesCubit,AllAddressesState>(
        listener: (context,state) async {
          if(state is AllAddressesFailure){
            errorDialog(context: context, message: state.errorMessage);
          }
          if(state is AllAddressesSuccess && addressCubit.allAddressesList.isNotEmpty){
            var shippingCompanyCubit = BlocProvider.of<ShippingCompaniesCubit>(context);
            var shippingFeesCubit = BlocProvider.of<ShippingFeesCubit>(context);
            await shippingCompanyCubit.getCompanies(addressId: addressCubit.selectedAddressId!,);
            shippingFeesCubit.resetShippingFeesModel();
            shippingFeesCubit.getShippingFees(priceId:shippingCompanyCubit.companiesList[0].priceId!, context: context);
          }
        },
        builder: (context,state){
          if(state is AllAddressesSuccess){
            return const CheckOutBody();
          }else{
            return Scaffold(
              appBar: AppBar(leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios)),elevation: 0,scrolledUnderElevation: 0,),
              backgroundColor: Styles.scaffoldColor,body: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
                child: Column(
                  children: List.generate(4, (index)=>Column(
                    children: [
                      shimmerWidget(height: 140, width: double.infinity,rad: 6),
                      SizedBox(height: 10.h,)
                    ],
                  ),),
                ),
              ),);
          }
        },
    );
  }
}
