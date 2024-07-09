import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/check_out/add_new_location/manager/cities_cubit/cities_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/manager/cities_cubit/cities_state.dart';

import '../../../../../../core/design/appTexts.dart';
import '../../../../../../core/design/app_styles.dart';
import '../../../../../../core/design/fun.dart';
import '../../../../../../core/design/images.dart';
import 'drop_down_placeholdeer.dart';

class CityDropDownButton extends StatelessWidget {
  const CityDropDownButton({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var citiesCubit = BlocProvider.of<CitiesCubit>(context);
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Styles.text('المدينة',size: 12),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Image.asset(Images.requiredStar,width: 10,),
              )
            ],
          ),
          SizedBox(height: 4.h,),
          BlocBuilder<CitiesCubit,CitiesState>(builder: (context,state){
            if(state is CitiesSuccess){
              return DropdownButtonFormField(
                validator: (x){
                  if(x==null){
                    return Texts.required.tr();
                  }else {
                    return null;
                  }
                },
                decoration: dropDownButtonBorderDecoration(),
                menuMaxHeight: 200.h,
                borderRadius: BorderRadius.circular(20),
                items: List.generate(citiesCubit.citiesList.length, (index) => DropdownMenuItem(
                    value: citiesCubit.citiesList[index],
                    child: Styles.text(citiesCubit.citiesList[index].label??'',size: 14),
                  ),
                ),
                onChanged: (x){
                  citiesCubit.selectedCity = x!;
                },
              );
            }else{
              return const DropDownPlaceHolder();
            }
          }),
          SizedBox(height: 4.h,)
        ],
      ),
    );
  }
}
