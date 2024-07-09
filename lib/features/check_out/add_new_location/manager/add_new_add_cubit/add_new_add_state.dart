import 'package:hanot/features/check_out/check_out_screen/models/customer_addresses_model/Addresses.dart';

abstract class AddNewAddressState{}

class AddNewAddInitial extends AddNewAddressState{}
class AddNewAddLoading extends AddNewAddressState{}
class AddNewAddSuccess extends AddNewAddressState{
  final Address address;
  AddNewAddSuccess({required this.address});
}
class AddNewAddFailure extends AddNewAddressState{
  final String errorMessage;
  AddNewAddFailure({required this.errorMessage});
}