import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/check_out/add_new_location/manager/add_new_add_cubit/add_new_add_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/manager/add_new_add_cubit/add_new_add_state.dart';
import 'package:hanot/features/check_out/add_new_location/manager/countries_cubit/countries_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/manager/countries_cubit/countries_state.dart';
import 'package:hanot/features/check_out/add_new_location/view/widgets/add_new_address_button.dart';
import 'package:hanot/features/check_out/add_new_location/view/widgets/counrty_city_row.dart';
import 'package:hanot/features/check_out/add_new_location/view/widgets/shimmer_sheet_body.dart';
import 'package:hanot/general_widgets/custom_textField.dart';

import '../../../check_out_screen/manager/old_addresses_cubit/old_addresses_cubit.dart';
import '../../../check_out_screen/manager/old_addresses_cubit/old_addresses_state.dart';
import '../../manager/cities_cubit/cities_cubit.dart';

class AddNewLocationBody extends StatelessWidget {
  const AddNewLocationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newAddCubit = BlocProvider.of<AddNewAddCubit>(context);
    var oldAddressCubit = BlocProvider.of<OldAddressesCubit>(context);
    var countriesCubit = BlocProvider.of<CountriesCubit>(context);
    var citiesCubit = BlocProvider.of<CitiesCubit>(context);
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<CountriesCubit, CountriesState>(
      listener: (context,state) async {
        if(state is CountriesSuccess){
          if(countriesCubit.countriesList.length==1){
            countriesCubit.selectedCountry = countriesCubit.countriesList[0];
            await citiesCubit.getCities(context: context, countryId: countriesCubit.countriesList[0].id.toString());
          }
        }
      },
        builder: (context, state) {
      if (state is CountriesSuccess) {
        return SizedBox(
          height: 410.h,
          child: Scaffold(
            backgroundColor: Styles.scaffoldColor,
            appBar: AppBar(title: Styles.text(Texts.addNewLocation, size: 22).tr(),
              leading: InkWell(onTap: () => Navigator.pop(context), child: const Icon(Icons.close)),),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const CountryCityRow(),
                    SizedBox(height: 20.h,),
                    CustomTextField(title: Texts.neighborhood.tr(),
                      validator: (x) {
                      if (x == null || x.isEmpty) {
                        return Texts.required.tr();
                      } else {
                        return null;
                      }
                    }, controller: newAddCubit.neighborhoodController,),
                    SizedBox(height: 20.h,),
                    CustomTextField(title: Texts.streetName.tr(), controller: newAddCubit.streetController),
                    SizedBox(height: 20.h,),
                    CustomTextField(title: Texts.homeAddress.tr(), controller: newAddCubit.homeController),
                    SizedBox(height: 20.h,),
                    SizedBox(
                      height: 50.h,
                      child: Row(
                        children: [
                          SizedBox(width: 180.w, child: CustomTextField(title: Texts.postalCode.tr(), controller: newAddCubit.postalCodeController),),
                          const Spacer(),
                          BlocConsumer<AddNewAddCubit,AddNewAddState>(
                              listener: (context,state) async {
                                if(state is AddNewAddSuccess){
                                  oldAddressCubit.customerAddressesModel.addressesList!.insert(0, state.address);
                                  oldAddressCubit.selectedAddressIndex=0;
                                  oldAddressCubit.selectedAddress = state.address;
                                  oldAddressCubit.groupVal = state.address.id!;
                                  oldAddressCubit.emit(OldAddressesSuccess());
                                  Navigator.pop(context);
                                }
                              },
                              builder: (context,state){
                            if(state is AddNewAddLoading){
                              return const AddNewAddressLoadingButton();
                            }else{
                              return AddNewAddressButton(formKey: formKey,);
                            }
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return const ShimmerSheetBody();
      }
    });
  }
}
