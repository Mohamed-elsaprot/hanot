import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/features/check_out/add_new_location/view/add_new_location.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/radio_button.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/design/fun.dart';
import '../../manager/old_addresses_cubit/old_addresses_cubit.dart';

class OldAddressesOptionTile extends StatefulWidget {
  const OldAddressesOptionTile({Key? key, required this.title, required this.subTitle,}) : super(key: key);
  final String title, subTitle;
  @override
  State<OldAddressesOptionTile> createState() => _OldAddressesOptionTileState();
}

class _OldAddressesOptionTileState extends State<OldAddressesOptionTile> {
  late OldAddressesCubit oldAddressesCubit;
  @override
  void initState() {
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
      child: ExpansionTile(
          leading: Icon(Icons.navigation_outlined, size: 30.w,),
          backgroundColor: Colors.white,
          iconColor: Styles.primary,
          textColor: Styles.primary,
          title: Styles.text(widget.title, fontWeight: FontWeight.w500),
          subtitle: Styles.text(widget.subTitle, fontWeight: FontWeight.w900),
          children: [
            ...List.generate(
                oldAddressesCubit.customerAddressesModel.addressesList!.length,
                (index) => AddressRadioOption(
                  index: index,inAllScreen: false,
                      address: oldAddressesCubit.customerAddressesModel.addressesList![index],
                      fun: (x) {
                        oldAddressesCubit.groupVal = x;
                        oldAddressesCubit.setSelectedAddress(index);
                        setState(() {});

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
          ]),
    );
  }
}
