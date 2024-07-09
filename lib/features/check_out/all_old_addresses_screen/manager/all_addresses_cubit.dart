import 'dart:developer';

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
  Address? selectedAddress;
  num? selectedAddressId;

  getAllAddresses()async{
    emit(AllAddressesLoading());
    var res = await addressesRepoImpl.getAllAddresses();
    res.fold((failure) {
      emit(AllAddressesFailure(errorMessage: failure.errorMessage));
    }, (list){
      allAddressesList = list;
      if(allAddressesList.isNotEmpty){
        selectedAddress=allAddressesList[allAddressesList.length-1];
        selectedAddressId=selectedAddress!.id;
      }
      emit(AllAddressesSuccess());
    });
  }

  setSelectedAddress({required int index,required num id}){
    if(allAddressesList.isNotEmpty){
      selectedAddress = allAddressesList[index];
      selectedAddressId = id;
      emit(AllAddressesSuccess());
    }
  }

  setNewAddress({required Address newAddress}){
    allAddressesList.add(newAddress);
    selectedAddress = newAddress;
    selectedAddressId = newAddress.id;
    emit(AllAddressesSuccess());
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