import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_state.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/view/change_shipping_company_sheet/change_shipping_company_sheet.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/design/images.dart';
import '../../../../../core/design/widgets.dart';
import '../../../../../general_widgets/custom_button.dart';
import 'custom_continer.dart';

class ShippingContainer extends StatelessWidget {
  const ShippingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    var shippingCubit = BlocProvider.of<ShippingCompaniesCubit>(context);
    return CustomContainer(
        body:[
          Row(
            children: [
              Image.asset(Images.shippingLogo, scale: 4,),
              SizedBox(width: 10.w,),
              Styles.text(textsMap['mobile_Shipping_Company'], size: 14)
            ],
          ),
          Divider(endIndent: 5, indent: 5, height: 20.h,),
          BlocBuilder<ShippingCompaniesCubit,ShippingCompaniesState>(builder: (context,state){
            if(state is ShippingCompaniesSuccess){
              return Row(
                children: [
                  cachedImage('https://arqam.news/wp-content/uploads/2024/03/talabat.jpg',width: 40,height: 32,rad: 50),
                  SizedBox(width: 8.w,),
                  Styles.text(shippingCubit.selectedCompany!.name!, size: 14),
                ],
              );
            }else if(state is ShippingCompaniesLoading){
             return Row(
               children: [
                 shimmerWidget(width: 44,height: 35,rad: 50),
                 SizedBox(width: 8.w,),
                 shimmerWidget(height: 13, width: 120,rad: 15),
               ],
             );
            }else{
              return Row(
                children: [
                  cachedImage('https://arqam.news/wp-content/uploads/2024/03/talabat.jpg',width: 40,height: 32,rad: 50),
                  SizedBox(width: 8.w,),
                  Styles.text(textsMap['mobile_selfPickUp'], size: 14),
                ],
              );
            }
          }),
          SizedBox(height: 10.h,),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              fun: () {
                bottomSheet(context, const ChangeShippingCompanySheet());
              },
              textSize: 13,rad: 30, title: textsMap['changeShippingCompany'],
              backGroundColor: Colors.grey.shade200,
              textColor: Colors.black,
            ),
          )
        ]
    );
  }
}
