abstract class GetSingleOrderState{}

class GetSingleOrderInitial extends GetSingleOrderState{}
class GetSingleOrderLoading extends GetSingleOrderState{}
class GetSingleOrderSuccess extends GetSingleOrderState{}
class GetSingleOrderFailure extends GetSingleOrderState{
  final String errorMessage;
  GetSingleOrderFailure({required this.errorMessage});
}

class GetStatesLoading extends GetSingleOrderState{}
class GetStatesSuccess extends GetSingleOrderState{}
class GetStatesFailure extends GetSingleOrderState{
  final String errorMessage;
  GetStatesFailure({required this.errorMessage});
}
