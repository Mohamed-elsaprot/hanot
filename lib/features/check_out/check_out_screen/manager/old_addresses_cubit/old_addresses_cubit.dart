import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';

import '../../data/get_first_addresses_repo/get_first_addresses_repo_impl.dart';
import '../../models/customer_addresses_model/Addresses.dart';
import '../../models/customer_addresses_model/CustomerAddressesModel.dart';
import 'old_addresses_state.dart';

class OldAddressesCubit extends Cubit<OldAddressesState>{
  OldAddressesCubit(this.firstAddressesRepoImpl):super(OldAddressesInitial());
  final FirstAddressesRepoImpl firstAddressesRepoImpl;
  late CustomerAddressesModel customerAddressesModel;
  Address? selectedAddress;
  late int selectedAddressIndex;
  bool last = false;
  late num groupVal;

  getCustomerFirsAddresses({required BuildContext context})async{
    emit(OldAddressesLoading());
    var res = await firstAddressesRepoImpl.getFirstAddresses();
    res.fold((failure){
      errorDialog(context: context, message: failure.errorMessage);
      emit(OldAddressesFailure(errorMessage: failure.errorMessage));
    }, (model){
      customerAddressesModel = model;
      if(customerAddressesModel.nextPageUrl!=null){
        last = true;
      }
      if(model.addressesList!.isNotEmpty){
        selectedAddress = model.addressesList![0];
        selectedAddressIndex = 0;
        groupVal = model.addressesList![0].id!;
      }else{
        selectedAddress = null;
      }
      emit(OldAddressesSuccess());
    });
  }

  setSelectedAddress(int index){
    selectedAddress = customerAddressesModel.addressesList![index];
    selectedAddressIndex = index;
    emit(OldAddressesSuccess());
  }

  deleteAddress({required String addressId,required int index})async{
    customerAddressesModel.addressesList!.removeAt(index);
    if(selectedAddressIndex==index){
     selectedAddressIndex=0;
     if(customerAddressesModel.addressesList!.isNotEmpty){
       selectedAddress = customerAddressesModel.addressesList![0];
       groupVal= customerAddressesModel.addressesList![0].id!;
     }else{
       selectedAddress = null;
     }
    }
    emit(OldAddressesSuccess());
    await firstAddressesRepoImpl.deleteAddress(addressId: addressId);
  }
}