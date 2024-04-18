import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/old_addresses_cubit/old_addresses_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/old_addresses_cubit/old_addresses_state.dart';

import 'old_address_option_tile.dart';

class OptionsContainer extends StatelessWidget {
  const OptionsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var oldAddresses = BlocProvider.of<OldAddressesCubit>(context);
    return Column(
      children: [
          BlocBuilder<OldAddressesCubit,OldAddressesState>(builder: (context,state){
          return OldAddressesOptionTile(title: Texts.deliveryMethod.tr(),subTitle: '${Texts.deliveryTo.tr()}: ${oldAddresses.selectedAddress?.city ?? ''}',);
        }),

      ],
    );
  }
}
