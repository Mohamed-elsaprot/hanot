import 'package:flutter/material.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/payment_method_option_tile.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/shipping_option_tile.dart';
import 'old_address_option_tile.dart';

class OptionsContainer extends StatelessWidget {
  const OptionsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        OldAddressesOptionTile(),
        ShippingOptionTile(),
        PaymentOptionTile(),
      ],
    );
  }
}
