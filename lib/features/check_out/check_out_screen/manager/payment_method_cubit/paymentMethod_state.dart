abstract class PaymentMethodState{}

class PaymentMethodInitial extends PaymentMethodState{}
class PaymentMethodLoading extends PaymentMethodState{}
class PaymentMethodSuccess extends PaymentMethodState{}
class PaymentMethodFailure extends PaymentMethodState{
  final String errorMessage;
  PaymentMethodFailure({required this.errorMessage});
}