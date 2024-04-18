import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/design/appTexts.dart';
import '../../manager/cities_cubit/cities_cubit.dart';
import '../../manager/cities_cubit/cities_state.dart';
import '../../manager/countries_cubit/countries_cubit.dart';
import 'custom_drop_down_menu.dart';
import 'loading_cities_container.dart';

class CountryCityRow extends StatelessWidget {
  const CountryCityRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var countriesCubit = BlocProvider.of<CountriesCubit>(context);
    var citiesCubit = BlocProvider.of<CitiesCubit>(context);
    return Row(
      children: [
        SizedBox(
          width: 180.w,
          child: CustomDropDownMenu(
            title: Texts.country,
            valList: countriesCubit.countriesList,
            onSelect: (x) async{
              await citiesCubit.getCities(context: context, countryId: x.id.toString());
              countriesCubit.selectedCountry = x;
            },
          ),
        ),
        const Spacer(),
        BlocBuilder<CitiesCubit, CitiesState>(
            builder: (context, state) {
              if (state is CitiesSuccess) {
                return SizedBox(
                  width: 180.w,
                  child: CustomDropDownMenu(
                    title: Texts.city,
                    valList: citiesCubit.citiesList,
                    onSelect: (x) {
                      citiesCubit.selectedCity = x;
                    },
                  ),
                );
              } else {
                return const LoadingCitiesContainer();
              }
            }),
      ],
    );
  }
}
