import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_addresses_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/check_out_cubit/check_out_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/check_out_cubit/check_out_state.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_state.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/note_cubit/note_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_state.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/features/payment_web_view/manager/get_payment_link_cubit.dart';
import 'package:hanot/features/payment_web_view/manager/get_payment_link_state.dart';
import '../../../../../core/design/app_styles.dart';
import '../../../../../core/local_storage/secure_storage.dart';
import '../../../../../general_widgets/custom_button.dart';
import '../../../../cart/manager/cart_cubit/cart_cubit.dart';
import '../../../../payment_web_view/view/payment_web_vew.dart';
import '../../../../success_sucreen/success_screen.dart';
import '../../manager/payment_method_cubit/payment_method_cubit.dart';

class CompleteOrderContainer extends StatelessWidget {
  const CompleteOrderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textsMap = BlocProvider.of<LangCubit>(context).texts;
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var couponCubit = BlocProvider.of<CouponCubit>(context);
    var shippingFeesCubit = BlocProvider.of<ShippingFeesCubit>(context);
    var paymentMethodCubit = BlocProvider.of<PaymentMethodCubit>(context);

    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.black12))),
      padding: EdgeInsets.only(left: 15.w,right: 15.w, top: 10.h,bottom: 16.h),
      child: Row(
        children: [
          Expanded(
              flex: 10,
              child: BlocBuilder<ShippingFeesCubit, ShippingFeesState>(
                  builder: (context, feesState) {
                return BlocBuilder<CouponCubit, CouponState>(
                    builder: (context, couponState) {
                  num? totalWithShipping = shippingFeesCubit.shippingFeesModel?.total;
                  if (totalWithShipping != null) totalWithShipping -= couponCubit.couponDiscount!;
                  return Styles.text('${textsMap['mobile_Order_Total']} ${totalWithShipping ?? cartCubit.cartTotal - couponCubit.couponDiscount!} ${SecureStorage.currency}');
                });
              })),
          Expanded(
              flex: 7,
              child: BlocConsumer<CheckOutCubit, CheckOutState>(
                listener: (context, state) async {
                  if (state is CheckOutSuccess) {
                    var cartCubit = BlocProvider.of<CartCubit>(context);
                    cartCubit.getCartProducts();// to update cart

                    var getLinkCubit = BlocProvider.of<GetPaymentLinkCubit>(context);
                    getLinkCubit.getLink(state.orderId, context);

                  }
                },
                builder: (BuildContext context, CheckOutState state) { 
                  return BlocListener<GetPaymentLinkCubit,GetPaymentLinkState>(listener: (context,linkState){
                    if(linkState is GetPaymentLingSuccess){
                      if(paymentMethodCubit.groupVal!='cod'){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentWebView(link: linkState.link,)));
                      }else{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessScreen()));
                      }
                    }
                  }, child: CustomButton(
                    fun: () {
                      var note = BlocProvider.of<NoteCubit>(context);
                      var ship = BlocProvider.of<ShippingCompaniesCubit>(context);
                      var add = BlocProvider.of<AllAddressesCubit>(context);
                      var checkoutCubit = BlocProvider.of<CheckOutCubit>(context);
                      if(couponCubit.couponDiscount!=0)ApiService.updateHeader({'coupon':couponCubit.couponCode});
                      if(add.selectedAddress!=null&&ship.selectedCompany!=null){
                        checkoutCubit.sendOrder(context: context,
                            paymentMethod: paymentMethodCubit.groupVal,
                            deliveryMethod: ship.groupVal == 0 ? 'pick_up' : 'delivery',
                            notes: note.noteController.text,
                            addressId: add.selectedAddressId,
                            priceId: ship.groupVal);
                      }else{
                        errorDialog(context: context, message: textsMap['mobile_please_select_address_label']);
                      }
                    },
                    title: textsMap['mobile_confirmOrder'],
                    rad: 30,
                    padding: EdgeInsets.symmetric(vertical: 7.h),
                  ),) ;
                },
              ))
        ],
      ),
    );
  }
}
