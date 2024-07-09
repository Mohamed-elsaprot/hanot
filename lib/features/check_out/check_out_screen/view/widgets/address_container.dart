import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_address_state.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_addresses_cubit.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/design/images.dart';
import '../../../../../general_widgets/custom_button.dart';
import '../../../all_old_addresses_screen/view/old_locations_sheet.dart';
import 'custom_continer.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addressCubit = BlocProvider.of<AllAddressesCubit>(context);
    return BlocBuilder<AllAddressesCubit,AllAddressesState>(builder: (context,state)=>CustomContainer(
        body: [
          Row(
            children: [
              Image.asset(Images.locIcon, scale: 4,),
              SizedBox(width: 10.w,),
              Styles.text(Texts.deliveryLoc.tr(), size: 14)
            ],
          ),
          Divider(endIndent: 5, indent: 5, height: 20.h,),
          addressCubit.selectedAddress!=null? Styles.text('${addressCubit.selectedAddress?.country}, ${addressCubit.selectedAddress?.city}', size: 14):
          Styles.text(Texts.notChosenYet.tr(), size: 14),
          SizedBox(height: 4.h,),
          if(addressCubit.selectedAddress!=null)Styles.subTitle('${addressCubit.selectedAddress?.neighborhood}'
              '${addressCubit.selectedAddress?.homeAddress!=null? ', ${addressCubit.selectedAddress?.homeAddress}':''}', size: 13),
          SizedBox(height: 10.h,),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              fun: () {
                bottomSheet(context,BlocProvider.value(value: BlocProvider.of<AllAddressesCubit>(context),child: const AddNewLocationSheet(),));
              },
              textSize: 13, rad: 30, title: Texts.changeLoc.tr(),
              backGroundColor: Colors.grey.shade200,
              textColor: Colors.black,
            ),
          )
        ]
    ));
  }
}
