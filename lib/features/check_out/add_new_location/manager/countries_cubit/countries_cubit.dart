import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/add_new_location/data/countries_repo/countries_repo_impl.dart';

import '../../models/Country.dart';
import 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState>{
  CountriesCubit(this.countriesRepoImpl):super(CountriesInitial());
  final CountriesRepoImpl countriesRepoImpl;
  List<Country> countriesList=[];
  Country? selectedCountry;

  getCountries({required BuildContext context})async{
    emit(CountriesLoading());
    var res = await countriesRepoImpl.getCountries();
    res.fold((failure){
      errorDialog(context: context, message: failure.errorMessage);
      emit(CountriesFailure(errorMessage: failure.errorMessage));
    }, (list){
      countriesList = list;
      // if(countriesList.length==1){
      //   selectedCountry=countriesList[0];
      // }
      emit(CountriesSuccess());
    });
  }
}