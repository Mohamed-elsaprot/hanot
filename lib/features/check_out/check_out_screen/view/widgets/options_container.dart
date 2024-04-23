import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/old_addresses_cubit/old_addresses_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/old_addresses_cubit/old_addresses_state.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/payment_method_option_tile.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/shipping_option_tile.dart';
import '../../manager/shipping_companies_cubit/shipping_companies_cubit.dart';
import '../../manager/shipping_fees_cubit/shipping_fees_cubit.dart';
import 'old_address_option_tile.dart';

class OptionsContainer extends StatelessWidget {
  const OptionsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shippingCompaniesCubit = BlocProvider.of<ShippingCompaniesCubit>(context);
    var shippingFeesCubit = BlocProvider.of<ShippingFeesCubit>(context);
    var oldAddressesCubit = BlocProvider.of<OldAddressesCubit>(context);
    return Column(
      children: [
        BlocConsumer<OldAddressesCubit, OldAddressesState>(
          listener: (context,state) async {
            if(state is OldAddressesSuccess){
              if(oldAddressesCubit.selectedAddress!=null) {
                await shippingCompaniesCubit.getCompanies(addressId: oldAddressesCubit.selectedAddress!.id!, context: context);
              }else{
                print('deleteeeee');
                shippingCompaniesCubit.deleteData();
                shippingFeesCubit.deleteData();
              }
            }
          },
            builder: (context, state) {
          return const OldAddressesOptionTile();
        }),
        const ShippingOptionTile(),
        const PaymentOptionTile(),

      ],
    );
  }
}
