import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/check_out_screen/data/coupon_repo/coupon_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_state.dart';

class CouponCubit extends Cubit<CouponState>{
  CouponCubit(this.couponRepoImpl):super(CouponInitial());
  final CouponRepoImpl couponRepoImpl;
  final TextEditingController couponController= TextEditingController();
  double? oldTotal,newTotal,couponDiscount;
  String couponCode = '';

   applyCouponAndUpdateCartTotal({required String coupon,required BuildContext context})async{
    emit(CouponLoading());
    var res = await couponRepoImpl.applyCoupon(coupon: coupon);
    res.fold((failure){
      errorDialog(context: context, message: failure.errorMessage);
      emit(CouponFailure(errorMessage: failure.errorMessage));
    }, (map){
      oldTotal = double.tryParse(map['cart']['net_total']);
      newTotal = double.tryParse(map['cart']['total']);
      couponDiscount = double.tryParse(map['cart']['coupon_discount']);
      couponCode = coupon;
      emit(CouponSuccess());
      Navigator.pop(context);
    });
  }

}