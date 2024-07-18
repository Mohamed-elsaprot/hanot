import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/check_out/add_new_location/manager/cities_cubit/cities_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/manager/countries_cubit/countries_cubit.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../../consts.dart';
import '../../../../../../core/design/app_styles.dart';
import '../../../../../../core/design/images.dart';

class CountryDropDownButton extends StatelessWidget {
  const CountryDropDownButton({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    var countriesCubit = BlocProvider.of<CountriesCubit>(context);
    var citiesCubit = BlocProvider.of<CitiesCubit>(context);
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Styles.text('البلد',size: 12),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Image.asset(Images.requiredStar,width: 10,),
              )
            ],
          ),
          SizedBox(height: 4.h,),
          DropdownButtonFormField(
            validator: (x){
              if(x==null){
                return textsMap['mobile_required'];
              }else {
                return null;
              }
            },
            decoration: InputDecoration(
                errorStyle: const TextStyle(fontFamily: fontFamily),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.shade200)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.shade200)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.shade200)),
                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.shade200))
              ),
            menuMaxHeight: 200.h,
            borderRadius: BorderRadius.circular(20),
              items: List.generate(countriesCubit.countriesList.length, (index) => DropdownMenuItem(
                  value: countriesCubit.countriesList[index],
                  child:Styles.text(countriesCubit.countriesList[index].label??'',size: 14),
                ),
              ),
              onChanged: (x){
                citiesCubit.selectedCity=null;
                countriesCubit.selectedCountry = x!;
                citiesCubit.getCities(context: context, countryId: x!.id.toString());
              },
          ),
          SizedBox(height: 4.h,)
        ],
      ),
    );
  }
}
