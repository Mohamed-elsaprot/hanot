import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/add_new_location/data/cities_repo/cities_repo_impl.dart';
import 'package:hanot/features/check_out/add_new_location/manager/cities_cubit/cities_state.dart';

import '../../models/City.dart';

class CitiesCubit extends Cubit<CitiesState>{
  CitiesCubit(this.citiesRepoImpl):super(CitiesInitial());
  final CitiesRepoImpl citiesRepoImpl;
  List<City> citiesList=[];
  City? selectedCity;
  getCities({required BuildContext context,required String countryId})async{
    emit(CitiesLoading());
    var res = await citiesRepoImpl.getCities(countryId: countryId);
    res.fold((failure){
      errorDialog(context: context, message: failure.errorMessage);
      emit(CitiesFailure(errorMessage: failure.errorMessage));
    }, (list){
      citiesList = list;
      emit(CitiesSuccess());
    });
  }
}