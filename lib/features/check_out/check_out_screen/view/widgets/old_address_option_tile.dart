import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/features/check_out/add_new_location/view/add_new_location.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/old_addresses_cubit/old_addresses_state.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/old_address_radio_button.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/design/fun.dart';
import '../../manager/old_addresses_cubit/old_addresses_cubit.dart';
import '../../manager/shipping_companies_cubit/shipping_companies_cubit.dart';

class OldAddressesOptionTile extends StatefulWidget {
  const OldAddressesOptionTile({Key? key,}) : super(key: key);
  @override
  State<OldAddressesOptionTile> createState() => _OldAddressesOptionTileState();
}

class _OldAddressesOptionTileState extends State<OldAddressesOptionTile> {
  late OldAddressesCubit oldAddressesCubit;
  late ShippingCompaniesCubit shippingCompaniesCubit;
  @override
  void initState() {
    shippingCompaniesCubit = BlocProvider.of<ShippingCompaniesCubit>(context);
    oldAddressesCubit = BlocProvider.of<OldAddressesCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.grey.shade200),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      child: BlocBuilder<OldAddressesCubit,OldAddressesState>(builder: (context,state){
        return ExpansionTile(
            leading: Icon(Icons.navigation_outlined, size: 30.w,),
            backgroundColor: Colors.white,
            iconColor: Styles.primary,
            textColor: Styles.primary,
            title: Styles.text(Texts.deliveryMethod, fontWeight: FontWeight.w500).tr(),
            subtitle: Styles.text('${Texts.deliveryTo.tr()}: ${oldAddressesCubit.selectedAddress?.city ?? ''}', fontWeight: FontWeight.w900),
            children: [
              ...List.generate(
                  oldAddressesCubit.customerAddressesModel.addressesList!.length,
                      (index) => AddressRadioOption(
                    index: index,inAllScreen: false,
                    address: oldAddressesCubit.customerAddressesModel.addressesList![index],
                    fun: (x) async {
                      oldAddressesCubit.groupVal = x;
                      oldAddressesCubit.setSelectedAddress(index);
                      setState(() {});
                      await shippingCompaniesCubit.getCompanies(addressId: oldAddressesCubit.selectedAddress!.id!, context: context);
                    },
                  )),
              Row(
                children: [
                  if (oldAddressesCubit.customerAddressesModel.nextPageUrl != null)
                    GestureDetector(
                      onTap: () {
                        AppRouter.router.push(AppRouter.allOldAddressesScreen,);
                      },
                      child: Column(
                        children: [
                          Styles.text(Texts.more).tr(),
                          Container(width: 45.w, height: 1, color: Colors.black,)
                        ],
                      ),
                    ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {
                      bottomSheet(context, const AddNewLocation(), rad: 20);
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewLocation()));
                    },
                    icon: const Icon(Icons.add, color: Styles.primary,),
                    label: Styles.text(Texts.addAddress).tr(),
                  )
                ],
              )
            ]);
      }),
    );
  }
}
