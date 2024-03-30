abstract class SkuDetailsState{}

class SkuDetailsInitial extends SkuDetailsState{}
class SkuDetailsLoading extends SkuDetailsState{}
class SkuDetailsSuccess extends SkuDetailsState{}
class SkuDetailsFailure extends SkuDetailsState{
  final String errorMessage;
  SkuDetailsFailure({required this.errorMessage});
}