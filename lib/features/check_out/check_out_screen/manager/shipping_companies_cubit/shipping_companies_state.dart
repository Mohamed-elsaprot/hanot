abstract class ShippingCompaniesState{}

class ShippingCompaniesInitial extends ShippingCompaniesState{}
class ShippingCompaniesLoading extends ShippingCompaniesState{}
class ShippingCompaniesSuccess extends ShippingCompaniesState{}
class ShippingCompaniesFailure extends ShippingCompaniesState{
  final String errorMessage;
  ShippingCompaniesFailure({required this.errorMessage});
}