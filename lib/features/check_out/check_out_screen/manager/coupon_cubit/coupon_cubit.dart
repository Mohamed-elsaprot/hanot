import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/check_out/check_out_screen/data/coupon_repo/coupon_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_state.dart';

class CouponCubit extends Cubit<CouponState>{
  CouponCubit(this.couponRepoImpl):super(CouponInitial());
  final CouponRepoImpl couponRepoImpl;
  final TextEditingController couponController= TextEditingController();
  num? oldTotal,newTotal,couponDiscount=0;
  String couponCode = '';

   applyCouponAndUpdateCartTotal({required BuildContext context})async{
    emit(CouponLoading());
    var res = await couponRepoImpl.applyCoupon(coupon: couponController.text);
    res.fold((failure){
      couponDiscount=0;
      emit(CouponFailure(errorMessage: failure.errorMessage));
    }, (map){
        oldTotal = map['cart']['net_total'];
        newTotal = map['cart']['total'];
        couponDiscount = map['cart']['coupon_discount'];
        couponCode = couponController.text;
        emit(CouponSuccess());

    });
  }

}