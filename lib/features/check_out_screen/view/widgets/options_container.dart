import 'package:flutter/material.dart';

import 'option_tile.dart';

class OptionsContainer extends StatelessWidget {
  const OptionsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionTile(title: 'طريقة الدفع',subTitle: 'كاش',iconData: Icons.wallet,groupVal: '1'),
        OptionTile(title: 'طريقة التوصيل',subTitle: 'توصيل لعنولن: البيت',iconData: Icons.navigation_outlined,groupVal: '1'),
        OptionTile(title: 'شركة الشحن',subTitle: 'شركة النسر السريع',iconData: Icons.local_shipping,groupVal: '1'),
      ],
    );
  }
}
