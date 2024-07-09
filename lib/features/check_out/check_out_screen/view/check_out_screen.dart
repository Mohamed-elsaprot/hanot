import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_address_state.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_addresses_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/check_out_body.dart';

import '../../../../core/design/fun.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllAddressesCubit,AllAddressesState>(
        listener: (context,state){
          var addressCubit = BlocProvider.of<AllAddressesCubit>(context);
          if(state is AllAddressesFailure){
            errorDialog(context: context, message: state.errorMessage);
          }
          if(state is AllAddressesSuccess && addressCubit.allAddressesList.isNotEmpty){
            var shippingCompanyCubit = BlocProvider.of<ShippingCompaniesCubit>(context);
            var shippingFeesCubit = BlocProvider.of<ShippingFeesCubit>(context);
            shippingCompanyCubit.getCompanies(addressId: addressCubit.selectedAddressId!,);
            shippingFeesCubit.resetShippingFeesModel();
          }
        },
        builder: (context,state){
          if(state is AllAddressesSuccess){
            return const CheckOutBody();
          }else{
            return Scaffold(backgroundColor: Styles.scaffoldColor,body: loadingIndicator(),);
          }
        },
    );
  }
}
