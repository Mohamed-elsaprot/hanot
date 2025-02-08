import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/design/widgets_fun.dart';
import 'package:hanot/features/check_out/add_new_location/manager/add_new_add_cubit/add_new_add_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/manager/cities_cubit/cities_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/manager/countries_cubit/countries_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/manager/countries_cubit/countries_state.dart';
import 'package:hanot/features/check_out/add_new_location/view/widgets/city_drop_down_button.dart';
import 'package:hanot/features/check_out/add_new_location/view/widgets/country_drop_down_button.dart';
import 'package:hanot/features/check_out/add_new_location/view/widgets/location_item_text_field.dart';
import 'package:hanot/features/check_out/add_new_location/view/widgets/save_location_button.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

class AddNewLocationSheet extends StatelessWidget {
  const AddNewLocationSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    var citiesCubit = BlocProvider.of<CitiesCubit>(context);
    var countriesCubit = BlocProvider.of<CountriesCubit>(context);
    var newAddressCubit = BlocProvider.of<AddNewAddressCubit>(context);
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SizedBox(
      height: 520.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: sheetAppBar(title: textsMap['mobile_add_new_address_label'], context: context),
          body: BlocConsumer<CountriesCubit,CountriesState>(
              listener: (context,state){
                if(state is CountriesSuccess){
                  bool isOneCountry = countriesCubit.selectedCountry!=null;
                  if(isOneCountry){
                    citiesCubit.getCities(context: context, countryId: countriesCubit.selectedCountry!.id.toString());
                  }
                }
              },
              builder: (context,state){
                if(state is CountriesSuccess) {
                  bool isOneCountry = countriesCubit.selectedCountry!=null;
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: 15.w,right: 15.w,bottom: 10.h),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              if(!isOneCountry)
                                const CountryDropDownButton(),
                              if(!isOneCountry)
                                SizedBox(width: 10.w,),
                              const CityDropDownButton(),
                            ],
                          ),
                          LocationItemTextField(title: textsMap['mobile_Neighborhood'],validator: (x){
                            if(x!.isEmpty){
                              return textsMap['mobile_required'];
                            }else{
                              return null;
                            }
                          },required: true,controller: newAddressCubit.neighborhoodController,iconData: CupertinoIcons.scribble,),
                          LocationItemTextField(title: textsMap['mobile_Home_Description'],required: false,controller: newAddressCubit.homeController,iconData: CupertinoIcons.chat_bubble_text,),
                          LocationItemTextField(title: textsMap['mobile_Street_Name'],required: false,controller: newAddressCubit.streetController,iconData: Icons.receipt_long,),
                          LocationItemTextField(title: textsMap['mobile_Postal_Code'],required: false,controller: newAddressCubit.postalCodeController,iconData: Icons.password_outlined,textInputType: TextInputType.phone,),
                        ],
                      ),
                    ),
                  );
                }else{
                  return loadingIndicator();
                }
              }
          ),
          bottomNavigationBar: SaveLocationButton(formKey: formKey),
        ),
      ),
    );
  }
}
