import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_address_state.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_addresses_cubit.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/view/widgets/all_addresses_success_body.dart';

import '../../../../core/design/appTexts.dart';

class AllOldAddressesScreen extends StatelessWidget {
  const AllOldAddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      body: BlocBuilder<AllAddressesCubit,AllAddressesState>(
        builder: (context,state){
          if(state is AllAddressesLoading || state is AllAddressesFailure){
            return Scaffold(
              appBar: AppBar(title: Styles.text(Texts.allAddresses,size: 22).tr(),),
              body: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context,index){
                    return shimmerWidget(height: 50.h, width: double.infinity,rad: 10.r,margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h));
                  }),
            );
          }else {
            return const AllAddressesSuccessBody();
          }
        },
      ),
    );
  }
}


