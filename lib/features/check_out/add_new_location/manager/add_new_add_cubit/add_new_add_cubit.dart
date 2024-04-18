import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/add_new_location/data/add_new_add_repo/add_new_add_repo_impl.dart';
import 'package:hanot/features/check_out/add_new_location/manager/add_new_add_cubit/add_new_add_state.dart';
import 'package:hanot/features/check_out/add_new_location/models/Country.dart';

import '../../models/City.dart';

class AddNewAddCubit extends Cubit<AddNewAddState>{
  AddNewAddCubit(this.addNewAddressRepoImpl):super(AddNewAddInitial());
  final AddNewAddressRepoImpl addNewAddressRepoImpl;
  final TextEditingController neighborhoodController=TextEditingController(),streetController=TextEditingController(),homeController=TextEditingController(),postalCodeController=TextEditingController();

  addNewAdd({required BuildContext context,required Country country,required City city})async{
    emit(AddNewAddLoading());
    var res = await addNewAddressRepoImpl.addNewAddress(body: {
      "country_id": country.id, "city_id": city.id,
      "neighborhood": neighborhoodController.text, "street_name": streetController.text,
      "home_address": homeController.text, "postal_code": postalCodeController.text
    });
    res.fold((failure){
      errorDialog(context: context, message: failure.errorMessage);
      emit(AddNewAddFailure(errorMessage: failure.errorMessage));
    }, (address){
      emit(AddNewAddSuccess(address: address));
    });
  }
}