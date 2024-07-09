abstract class GetPaymentLinkState{}

class GetPaymentLingInitial extends GetPaymentLinkState{}
class GetPaymentLingLoading extends GetPaymentLinkState{}
class GetPaymentLingSuccess extends GetPaymentLinkState{
  final String link;
  GetPaymentLingSuccess({required this.link});
}
class GetPaymentLingFailure extends GetPaymentLinkState{
  final String errorMessage;
  GetPaymentLingFailure({required this.errorMessage});
}