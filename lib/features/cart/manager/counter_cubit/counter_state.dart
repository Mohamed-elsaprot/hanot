abstract class CounterState{}

class CounterInitial extends CounterState{}
class CounterLoading extends CounterState{}
class CounterSuccess extends CounterState{}
class CounterFailure extends CounterState{
  final String errorMessage;
  CounterFailure({required this.errorMessage});
}