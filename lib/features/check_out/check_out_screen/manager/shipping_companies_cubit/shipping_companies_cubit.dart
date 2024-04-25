import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/consts.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/check_out_screen/data/shipping_companies_repo/shipping_companies_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_state.dart';
import 'package:hanot/features/check_out/check_out_screen/models/shipping_company/ShippingCompany.dart';

class ShippingCompaniesCubit extends Cubit<ShippingCompaniesState> {
  ShippingCompaniesCubit(this.shippingCompaniesRepoImpl) : super(ShippingCompaniesInitial());
  final ShippingCompaniesRepoImpl shippingCompaniesRepoImpl;
  List<ShippingCompany> companiesList = constComList;
  late ShippingCompany? selectedCompany = companiesList[0];
  bool firstBuild = true;
  num? groupVal=0;

  getCompanies({required num addressId, required BuildContext context}) async {
    emit(ShippingCompaniesLoading());
    var res = await shippingCompaniesRepoImpl.getShippingCompanies(addressId: addressId);
    res.fold((failure) {
      errorDialog(context: context, message: failure.errorMessage);
      emit(ShippingCompaniesFailure(errorMessage: failure.errorMessage));
    }, (list) {
      companiesList = list;
      // if (list.isNotEmpty) {
      //   selectedCompany=list[0];
      //   groupVal = list[0].priceId!;
      // }
      emit(ShippingCompaniesSuccess());
    });
  }

  setSelectedCompany({required int index}){
    selectedCompany = companiesList[index];
    groupVal = selectedCompany!.priceId!;
  }

  resetShippingCompanies(){
    companiesList = constComList;
    groupVal=  0;
    selectedCompany= companiesList[0];
    emit(ShippingCompaniesSuccess());
  }

  deleteData(){
    groupVal=null;
    selectedCompany=null;
    companiesList=[];
    emit(ShippingCompaniesInitial());
  }
}
