abstract class OldAddressesState{}

class OldAddressesInitial extends OldAddressesState{}
class OldAddressesLoading extends OldAddressesState{}
class OldAddressesSuccess extends OldAddressesState{}
class OldAddressesFailure extends OldAddressesState{
  OldAddressesFailure({required this.errorMessage});
  final String errorMessage;
}