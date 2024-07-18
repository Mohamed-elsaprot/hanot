import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/consts.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/images.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_state.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/activate_coupon_button.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/general_widgets/custom_button.dart';

class CouponTextField extends StatefulWidget {
  const CouponTextField({Key? key, }) : super(key: key);

  @override
  State<CouponTextField> createState() => _CouponTextFieldState();
}

class _CouponTextFieldState extends State<CouponTextField> {
  late CouponCubit couponCubit;
  late Map textsMap;
  @override
  void initState() {
    textsMap = BlocProvider.of<LangCubit>(context).texts;
    couponCubit = BlocProvider.of<CouponCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CouponCubit,CouponState>(builder: (context,state){
      return TextFormField(
        onChanged: (x){setState(() {});},
        controller: couponCubit.couponController,
        // onFieldSubmitted: widget.onSubmit,
        // focusNode: widget.focusNode,
        // onTap: widget.onTap,
        cursorColor: Styles.primary,
        decoration: InputDecoration(
          prefixIcon: Image.asset(Images.couponLogo,scale: 1.1,),
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: 10,top: 4,bottom: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if(couponCubit.couponController.text.isNotEmpty)GestureDetector(
                    onTap: (){
                      couponCubit.couponController.text='';
                      setState(() {});
                    },
                    child: CircleAvatar(backgroundColor: Colors.grey.shade400,radius: 10,child: const Icon(Icons.close,size: 14,color: Colors.black,),)),
                const SizedBox(width: 8,),
                const ActivateCouponButton(),
              ],
            ),
          ),
          hintText: textsMap['mobile_enterDiscountCoupon'],
          hintStyle: const TextStyle(fontFamily: fontFamily,fontSize: 13),
          focusedBorder: border(state is CouponFailure),
          focusColor: Colors.black12,
          enabledBorder: border(state is CouponFailure),
          filled: true,
        ),
      );
    });
  }

  border(bool error) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(width: 1, color:error? Colors.red:Colors.transparent));
  }
}
