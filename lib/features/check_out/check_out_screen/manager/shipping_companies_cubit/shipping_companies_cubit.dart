import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/consts.dart';
import 'package:hanot/features/check_out/check_out_screen/data/shipping_companies_repo/shipping_companies_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_state.dart';
import 'package:hanot/features/check_out/check_out_screen/models/shipping_company/ShippingCompany.dart';

class ShippingCompaniesCubit extends Cubit<ShippingCompaniesState> {
  ShippingCompaniesCubit(this.shippingCompaniesRepoImpl) : super(ShippingCompaniesInitial());
  final ShippingCompaniesRepoImpl shippingCompaniesRepoImpl;
  List<ShippingCompany> companiesList = List.castFrom(constComList);
  late ShippingCompany? selectedCompany = companiesList[0];
  bool firstBuild = true;
  num? groupVal = 0;

  getCompanies({required num addressId,}) async {
    emit(ShippingCompaniesLoading());
    var res = await shippingCompaniesRepoImpl.getShippingCompanies(addressId: addressId);
    res.fold((failure) {
      emit(ShippingCompaniesFailure(errorMessage: failure.errorMessage));
    }, (list) {
      companiesList = list;
      setSelectedCompany(index: 0);
      emit(ShippingCompaniesSuccess());
    });
  }

  setSelectedCompany({required int index}){
    selectedCompany = companiesList[index];
    groupVal = selectedCompany!.priceId!;
    emit(ShippingCompaniesSuccess());
  }

  // resetShippingCompanies(){
  //   companiesList = constComList;
  //   groupVal=  0;
  //   selectedCompany= companiesList[0];
  //   emit(ShippingCompaniesSuccess());
  // }
}
