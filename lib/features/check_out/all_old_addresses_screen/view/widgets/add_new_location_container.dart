import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/add_new_location/data/add_new_add_repo/add_new_add_repo_impl.dart';
import 'package:hanot/features/check_out/add_new_location/data/cities_repo/cities_repo_impl.dart';
import 'package:hanot/features/check_out/add_new_location/data/countries_repo/countries_repo_impl.dart';
import 'package:hanot/features/check_out/add_new_location/manager/add_new_add_cubit/add_new_add_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/manager/cities_cubit/cities_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/manager/countries_cubit/countries_cubit.dart';
import 'package:hanot/features/check_out/add_new_location/view/add_new_location_sheet.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../../core/design/app_styles.dart';
import '../../../../../../core/design/images.dart';

class AddNewLocationContainer extends StatelessWidget {
  const AddNewLocationContainer({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textMap = BlocProvider.of<LangCubit>(context).texts;
    return GestureDetector(
      onTap: ()async{
        Navigator.pop(context);
        Future.delayed(
          const Duration(milliseconds: 200),() => bottomSheet(context, MultiBlocProvider(providers: [
            BlocProvider(create: (context)=>CountriesCubit(CountriesRepoImpl())..getCountries(context: context)),
            BlocProvider(create: (context)=>CitiesCubit(CitiesRepoImpl())),
            BlocProvider(create: (context)=>AddNewAddressCubit(AddNewAddressRepoImpl())),
        ], child: const AddNewLocationSheet())),);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade100
        ),
        padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 14.w),
        child: Row(
          children: [
            Image.asset(Images.addNewLocIcon,width: 22.w,),
            SizedBox(width: 12.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.text(textMap['mobile_another_address_label'], size: 14),
                Styles.subTitle(textMap['mobile_add_new_address_label'], size: 11),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded,size: 20,),
          ],
        ),
      ),
    );
  }
}
