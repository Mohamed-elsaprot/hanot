import 'package:hanot/features/check_out/check_out_screen/models/customer_addresses_model/Addresses.dart';

abstract class AddNewAddState{}

class AddNewAddInitial extends AddNewAddState{}
class AddNewAddLoading extends AddNewAddState{}
class AddNewAddSuccess extends AddNewAddState{
  final Address address;
  AddNewAddSuccess({required this.address});
}
class AddNewAddFailure extends AddNewAddState{
  final String errorMessage;
  AddNewAddFailure({required this.errorMessage});
}