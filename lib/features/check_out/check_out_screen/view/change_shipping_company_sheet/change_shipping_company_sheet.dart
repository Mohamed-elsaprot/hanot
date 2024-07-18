import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/view/change_shipping_company_sheet/confirm_shipping_company_button.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/custom_shipping_company_tile.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

class ChangeShippingCompanySheet extends StatefulWidget {
  const ChangeShippingCompanySheet({Key? key}) : super(key: key);

  @override
  State<ChangeShippingCompanySheet> createState() => _ChangeShippingCompanySheetState();
}

class _ChangeShippingCompanySheetState extends State<ChangeShippingCompanySheet> {
  late ShippingCompaniesCubit shippingCompanyCubit;
  late Map textsMap;
  late num newVal,newIndex;
  @override
  void initState() {
    textsMap = BlocProvider.of<LangCubit>(context).texts;
    shippingCompanyCubit = BlocProvider.of<ShippingCompaniesCubit>(context);
    newVal = shippingCompanyCubit.groupVal!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: sheetAppBar(title: textsMap['mobile_chooseShippingCompany'], context: context),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: List.generate(shippingCompanyCubit.companiesList.length, (index) {
                  if(shippingCompanyCubit.companiesList[index].priceId==newVal){
                    newIndex=index;
                  }
                  return CustomRadioTiles(
                  fun: (x) {
                    newVal=x!;
                    newIndex=index;
                    setState(() {});
                    },
                  val: shippingCompanyCubit.companiesList[index].priceId!,gVal: newVal!,
                  circleImage: true,
                  title: shippingCompanyCubit.companiesList[index].name, subTitle: shippingCompanyCubit.companiesList[index].cost,
                  image: 'https://arqam.news/wp-content/uploads/2024/03/talabat.jpg',
                );
                }),
              ),
            ),
            bottomNavigationBar: ConfirmShippingCompanyButton(newIndex: newIndex,),
          ),
      ),
    );
  }
}
