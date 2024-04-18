abstract class CheckOutState{}

class CheckOutInitial extends CheckOutState{}
class CheckOutLoading extends CheckOutState{}
class CheckOutSuccess extends CheckOutState{}
class CheckOutFailure extends CheckOutState{
  final String errorMessage;
  CheckOutFailure({required this.errorMessage});
}