import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_address_state.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/old_addresses_cubit/old_addresses_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/old_addresses_cubit/old_addresses_state.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_cubit.dart';

import '../../../../../core/design/appTexts.dart';
import '../../../../../core/design/app_styles.dart';
import '../../../../../general_widgets/custom_button.dart';
import '../../../check_out_screen/view/widgets/old_address_radio_button.dart';
import '../../manager/all_addresses_cubit.dart';

class AllAddressesSuccessBody extends StatefulWidget {
  const AllAddressesSuccessBody({Key? key}) : super(key: key);

  @override
  State<AllAddressesSuccessBody> createState() =>
      _AllAddressesSuccessBodyState();
}

class _AllAddressesSuccessBodyState extends State<AllAddressesSuccessBody> {
  late AllAddressesCubit allAddressesCubit;
  late OldAddressesCubit oldAddressesCubit;
  late ShippingCompaniesCubit shippingComCubit;
  late int cacheIndex, cacheListLen;
  late num cacheVal;

  @override
  void initState() {
    allAddressesCubit = BlocProvider.of<AllAddressesCubit>(context);
    oldAddressesCubit = BlocProvider.of<OldAddressesCubit>(context);
    shippingComCubit = BlocProvider.of<ShippingCompaniesCubit>(context);
    cacheIndex = oldAddressesCubit.selectedAddressIndex;
    cacheVal = (oldAddressesCubit.groupVal ?? 0)!;
    cacheListLen = allAddressesCubit.allAddressesList.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        backFun(context);
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Styles.text(Texts.allAddresses, size: 22).tr(),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () async => backFun(context)),
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: allAddressesCubit.allAddressesList.length,
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                ),
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Row(
                  children: [
                    Expanded(
                      child: AddressRadioOption(
                          index: index,
                          inAllScreen: true,
                          address: allAddressesCubit.allAddressesList[index],
                          fun: (x) async {
                            oldAddressesCubit.groupVal = x;
                            oldAddressesCubit.selectedAddressIndex = index;
                            setState(() {});
                          }),
                    ),
                    BlocListener<AllAddressesCubit,AllAddressesState>(listener: (context,state){
                      if(state is AllAddressesSuccess){

                      }
                    },child: GestureDetector(
                      onTap: () async {
                        if (allAddressesCubit.allAddressesList[index].id == oldAddressesCubit.groupVal) {
                          oldAddressesCubit.groupVal = null;
                        }
                        String id = allAddressesCubit.allAddressesList[index].id.toString();
                        allAddressesCubit.allAddressesList.removeAt(index);
                        setState(() {});
                        await allAddressesCubit.deleteAddress(addressId: id, context: context,);
                        if(allAddressesCubit.allAddressesList.isEmpty){
                          shippingComCubit.resetShippingCompanies();
                        }
                      },
                      child: CircleAvatar(
                        radius: 15.sp,
                        backgroundColor: Colors.red,
                        child: const Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),),

                  ],
                ));
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: CustomButton(
            fun: () {
              if (oldAddressesCubit.groupVal != null) {
                oldAddressesCubit.selectedAddress = allAddressesCubit.allAddressesList[oldAddressesCubit.selectedAddressIndex];
                oldAddressesCubit.emit(OldAddressesSuccess());
                if (oldAddressesCubit.selectedAddressIndex >= oldAddressesCubit.customerAddressesModel.addressesList!.length) {
                  oldAddressesCubit.customerAddressesModel.addressesList!.insert(0, oldAddressesCubit.selectedAddress!);
                }
                Navigator.pop(context);
              } else {
                errorDialog(context: context, message: Texts.pleaseChooseATitle.tr());
              }
            },
            title: Texts.useTheSpecifiedAddress.tr(),
          ),
        ),
      ),
    );
  }

  backFun(BuildContext context)  {
    if (allAddressesCubit.allAddressesList.isEmpty) {
      oldAddressesCubit.selectedAddress = null;
      oldAddressesCubit.emit(OldAddressesSuccess());
    }
    if (allAddressesCubit.allAddressesList.length == cacheListLen) {
      oldAddressesCubit.selectedAddressIndex = cacheIndex;
      oldAddressesCubit.groupVal = cacheVal;
    } else {
       oldAddressesCubit.getCustomerFirsAddresses(context: context);
    }
    Navigator.pop(context);
  }
}
