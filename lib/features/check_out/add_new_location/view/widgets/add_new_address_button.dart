import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/check_out/add_new_location/manager/add_new_add_cubit/add_new_add_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/manager/cities_cubit/cities_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/manager/countries_cubit/countries_cubit.dart';

import '../../../../../core/design/appTexts.dart';
import '../../../../../general_widgets/custom_button.dart';

class AddNewAddressButton extends StatelessWidget {
  const AddNewAddressButton({Key? key, required this.formKey}) : super(key: key);
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    var newAddCubit = BlocProvider.of<AddNewAddCubit>(context);
    var cityCubit = BlocProvider.of<CitiesCubit>(context);
    var countryCubit = BlocProvider.of<CountriesCubit>(context);
    return SizedBox(
        height: double.infinity,
        width: 180.w,
        child: CustomButton(
            fun: () {
              if(formKey.currentState!.validate()){
                newAddCubit.addNewAdd(context: context, country: countryCubit.selectedCountry, city: cityCubit.selectedCity);
              }
            }, rad: 15, title: Texts.add.tr()));
  }
}

class AddNewAddressLoadingButton extends StatelessWidget {
  const AddNewAddressLoadingButton({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: 180.w,
        child: CustomButton(fun: () {}, rad: 15,titleWidget: loadingIndicator(color: Colors.white), title: '',));
  }
}


