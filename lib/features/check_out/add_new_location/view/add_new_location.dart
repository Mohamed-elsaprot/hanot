import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/check_out/add_new_location/data/add_new_add_repo/add_new_add_repo_impl.dart';
import 'package:hanot/features/check_out/add_new_location/data/cities_repo/cities_repo_impl.dart';
import 'package:hanot/features/check_out/add_new_location/data/countries_repo/countries_repo_impl.dart';
import 'package:hanot/features/check_out/add_new_location/manager/add_new_add_cubit/add_new_add_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/manager/cities_cubit/cities_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/manager/countries_cubit/countries_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/view/widgets/add_new_location_body.dart';

class AddNewLocation extends StatelessWidget {
  const AddNewLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CountriesCubit(CountriesRepoImpl())..getCountries(context: context),
      child: BlocProvider(
        create: (context) => CitiesCubit(CitiesRepoImpl()),
        child: BlocProvider(
            create: (context) => AddNewAddCubit(AddNewAddressRepoImpl()),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const AddNewLocationBody())),
      ),
    );
  }
}
