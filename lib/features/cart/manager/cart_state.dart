abstract class CartState{}

class CartInitial extends CartState{}
class CartLoading extends CartState{}
class CartSuccess extends CartState{}
class CartFailure extends CartState{
  final String errorMessage;
  CartFailure({required this.errorMessage});
}