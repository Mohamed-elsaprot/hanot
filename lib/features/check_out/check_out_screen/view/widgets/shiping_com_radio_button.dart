import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/models/shipping_company/ShippingCompany.dart';

import '../../../../../core/design/app_styles.dart';

class ShippingCompanyRadioButton extends StatelessWidget {
  const ShippingCompanyRadioButton({Key? key,required this.fun, required this.company}) : super(key: key);
  final void Function(dynamic)? fun;
  final ShippingCompany company;
  @override
  Widget build(BuildContext context) {
    var companiesCubit = BlocProvider.of<ShippingCompaniesCubit>(context);
    return RadioListTile(
      secondary: Styles.subTitle(company.duration??'',size: 16),
        title: Styles.text(company.name??'No Name'),
        activeColor: Styles.primary,
        value: company.priceId!, groupValue: companiesCubit.groupVal, onChanged: fun
    );
  }
}
