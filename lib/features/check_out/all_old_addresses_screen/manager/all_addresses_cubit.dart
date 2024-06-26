import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/data/all_addresses_repo_impl.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_address_state.dart';
import 'package:hanot/features/check_out/check_out_screen/models/customer_addresses_model/Addresses.dart';

class AllAddressesCubit extends Cubit<AllAddressesState>{
  AllAddressesCubit(this.addressesRepoImpl):super(AllAddressesInitial());
  final AllAddressesRepoImpl addressesRepoImpl;
  List<Address> allAddressesList = [];

  getAllAddresses({required BuildContext context})async{
    emit(AllAddressesLoading());
    var res = await addressesRepoImpl.getAllAddresses();
    res.fold((failure) {
      errorDialog(context: context, message: failure.errorMessage);
      emit(AllAddressesFailure(errorMessage: failure.errorMessage));
    }, (list){
      allAddressesList = list;
      emit(AllAddressesSuccess());
    });
  }

  deleteAddress({required String addressId,required BuildContext context,})async{
    var res = await addressesRepoImpl.deleteAddress(addressId: addressId);
    res.fold((failure){
      errorDialog(context: context, message: failure.errorMessage);
    }, (map){
      emit(AllAddressesSuccess());
    });
  }

}