abstract class SingleProductDetailsState{}

class SingleProductDetailsInitial extends SingleProductDetailsState{}
class SingleProductDetailsLoading extends SingleProductDetailsState{}
class SingleProductDetailsSuccess extends SingleProductDetailsState{}
class SingleProductDetailsFailure extends SingleProductDetailsState{
  final String errorMessage;
  SingleProductDetailsFailure({required this.errorMessage});
}