abstract class AllAddressesState{}

class AllAddressesInitial extends AllAddressesState{}
class AllAddressesLoading extends AllAddressesState{}
class AllAddressesSuccess extends AllAddressesState{}
class AllAddressesFailure extends AllAddressesState{
  final String errorMessage;
  AllAddressesFailure({required this.errorMessage});
}