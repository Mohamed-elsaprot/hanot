abstract class CountriesState{}

class CountriesInitial extends CountriesState{}
class CountriesLoading extends CountriesState{}
class HalfOpSuccess extends CountriesState{}
class CountriesSuccess extends CountriesState{}
class CountriesFailure extends CountriesState{
  final String errorMessage;
  CountriesFailure({required this.errorMessage});
}