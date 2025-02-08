import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/check_out/add_new_location/manager/add_new_add_cubit/add_new_add_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/manager/add_new_add_cubit/add_new_add_state.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_addresses_cubit.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../../general_widgets/custom_button.dart';
import '../../manager/cities_cubit/cities_cubit.dart';
import '../../manager/countries_cubit/countries_cubit.dart';
class SaveLocationButton extends StatelessWidget {
  const SaveLocationButton({Key? key, required this.formKey}) : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    var newAddressCubit = BlocProvider.of<AddNewAddressCubit>(context);
    var countriesCubit = BlocProvider.of<CountriesCubit>(context);
    var citiesCubit = BlocProvider.of<CitiesCubit>(context);
    var texts = BlocProvider.of<LangCubit>(context).texts;

    return BlocListener<AddNewAddressCubit,AddNewAddressState>(listener: (context,state){
      var allAddressCubit = BlocProvider.of<AllAddressesCubit>(context);
      if(state is AddNewAddSuccess){
        allAddressCubit.setNewAddress(newAddress: state.address);
      }
    },
      child: Container(
        width: double.infinity,
        padding:
        EdgeInsets.only(left: 15.w, right: 15.w, bottom: 20.h, top: 10.h),
        child: CustomButton(
          title: texts['mobile_save_address_label'],
          fun: () {
            if (formKey.currentState!.validate()) {
              newAddressCubit.addNewAdd(context: context, country: countriesCubit.selectedCountry!, city: citiesCubit.selectedCity!);
            }
          },
          rad: 50,
        ),
      ),
    );
  }
}
