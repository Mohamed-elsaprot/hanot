abstract class CouponState{}

class CouponInitial extends CouponState{}
class CouponLoading extends CouponState{}
class CouponSuccess extends CouponState{}
class CouponFailure extends CouponState{
  final String errorMessage;
  CouponFailure({required this.errorMessage});
}