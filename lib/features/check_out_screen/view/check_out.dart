import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hanot/features/check_out_screen/view/widgets/check_out_body.dart';
import '../../../core/design/appTexts.dart';
import '../../../core/design/app_styles.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.scaffoldColor,
      appBar: AppBar(title: Styles.text(Texts.checkOut,size: 22).tr(),),
      body: CheckOutBody(),
    );
  }
}
