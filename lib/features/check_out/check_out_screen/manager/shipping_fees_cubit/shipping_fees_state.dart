abstract class ShippingFeesState{}

class ShippingFeesInitial extends ShippingFeesState{}
class ShippingFeesLoading extends ShippingFeesState{}
class ShippingFeesSuccess extends ShippingFeesState{}
class ShippingFeesFailure extends ShippingFeesState{
  final String errorMessage;
  ShippingFeesFailure({required this.errorMessage});
}