import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/old_addresses_cubit/old_addresses_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_state.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_state.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/shiping_com_radio_button.dart';

import '../../../../../core/design/app_styles.dart';
import '../../manager/shipping_companies_cubit/shipping_companies_cubit.dart';

class ShippingOptionTile extends StatefulWidget {
  const ShippingOptionTile({Key? key}) : super(key: key);

  @override
  State<ShippingOptionTile> createState() => _ShippingOptionTileState();
}

class _ShippingOptionTileState extends State<ShippingOptionTile> {
  late ShippingCompaniesCubit shippingCompaniesCubit;
  late OldAddressesCubit oldAddressesCubit;

  @override
  void initState() {
    shippingCompaniesCubit = BlocProvider.of<ShippingCompaniesCubit>(context);
    oldAddressesCubit = BlocProvider.of<OldAddressesCubit>(context);
    if(shippingCompaniesCubit.selectedCompany==null&&oldAddressesCubit.groupVal!=null&&shippingCompaniesCubit.firstBuild) shippingCompaniesCubit.getCompanies(addressId: oldAddressesCubit.selectedAddress!.id!, context: context);
    shippingCompaniesCubit.firstBuild=false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var shippingFeesCubit = BlocProvider.of<ShippingFeesCubit>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.grey.shade200,
      ),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      child: ExpansionTile(
          onExpansionChanged: (x) async {
             // if(shippingCompaniesCubit.selectedCompany==null&&oldAddressesCubit.groupVal!=null&&oldAddressesCubit.groupVal!=0)
             //   await shippingCompaniesCubit.getCompanies(addressId: oldAddressesCubit.selectedAddress!.id!, context: context);
            },
          leading: Icon(Icons.local_shipping_outlined, size: 30.w,),
          backgroundColor: Colors.white,
          iconColor: Styles.primary,
          textColor: Styles.primary,
          title: BlocConsumer<ShippingCompaniesCubit, ShippingCompaniesState>(
            listener: (context,state) async {
              if(state is ShippingCompaniesSuccess){
                await shippingFeesCubit.getShippingFees(priceId: shippingCompaniesCubit.groupVal!, context: context);
              }
            },
            builder: (context, state) {
              if(state is ShippingCompaniesSuccess || state is ShippingCompaniesInitial){
                return BlocBuilder<ShippingFeesCubit,ShippingFeesState>(builder: (context,feesState){
                  if(feesState is ShippingFeesSuccess || feesState is ShippingFeesInitial){
                    return Styles.text('${Texts.shippingCompany.tr()}:  ${shippingCompaniesCubit.selectedCompany?.name ?? ''}', fontWeight: FontWeight.w900);
                  }else{
                    return Row(
                      children: [
                        Styles.text('${Texts.shippingCompany.tr()}:  ', fontWeight: FontWeight.w900),
                        shimmerWidget(height: 12, width: 60,rad: 6),
                      ],
                    );
                  }
                });
              }else{
                return Row(
                  children: [
                    Styles.text('${Texts.shippingCompany.tr()}:  ', fontWeight: FontWeight.w900),
                    shimmerWidget(height: 12, width: 60,rad: 6),
                  ],
                );
              }
            },
          ),
          children: [
            BlocBuilder<ShippingCompaniesCubit, ShippingCompaniesState>(
                builder: (context, state) {
              return Column(
                children: List.generate(
                  shippingCompaniesCubit.companiesList.length,
                  (index) => ShippingCompanyRadioButton(
                    company: shippingCompaniesCubit.companiesList[index],
                    fun: (x) async {
                      shippingCompaniesCubit.setSelectedCompany(index: index);
                      setState(() {});
                      await shippingFeesCubit.getShippingFees(priceId: shippingCompaniesCubit.groupVal!, context: context);
                    },
                  ),
                ),
              );
            })
          ]),
    );
  }
}
