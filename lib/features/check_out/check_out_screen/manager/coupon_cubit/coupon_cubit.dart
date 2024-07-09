import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/check_out_screen/data/coupon_repo/coupon_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_state.dart';

class CouponCubit extends Cubit<CouponState>{
  CouponCubit(this.couponRepoImpl):super(CouponInitial());
  final CouponRepoImpl couponRepoImpl;
  final TextEditingController couponController= TextEditingController();
  double? oldTotal,newTotal,couponDiscount=0;
  String couponCode = '';

   applyCouponAndUpdateCartTotal({required BuildContext context})async{
    emit(CouponLoading());
    var res = await couponRepoImpl.applyCoupon(coupon: couponController.text);
    res.fold((failure){
      errorDialog(context: context, message: failure.errorMessage);
      couponDiscount=0;
      emit(CouponFailure(errorMessage: failure.errorMessage));
    }, (map){
        oldTotal = double.tryParse(map['cart']['net_total']);
        newTotal = double.tryParse(map['cart']['total']);
        couponDiscount = double.tryParse(map['cart']['coupon_discount']);
        couponCode = couponController.text;
        emit(CouponSuccess());

    });
  }

}