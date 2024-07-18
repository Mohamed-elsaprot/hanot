import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_addresses_cubit.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../../general_widgets/custom_button.dart';

class ConfirmLocationButton extends StatelessWidget {
  const ConfirmLocationButton({Key? key, required this.selectedId, required this.index}) : super(key: key);
  final num selectedId;
  final int index;
  @override
  Widget build(BuildContext context) {
    var addressCubit = BlocProvider.of<AllAddressesCubit>(context);
    var textsMap = BlocProvider.of<LangCubit>(context).texts;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15.w,right: 15.w,bottom: 20.h,top: 10.h),
      child: CustomButton(
        title: textsMap['mobile_Confirm'],fun: (){
          addressCubit.setSelectedAddress(index: index, id: selectedId);
          Navigator.pop(context);
      },rad: 50,
      ),
    );
  }
}
