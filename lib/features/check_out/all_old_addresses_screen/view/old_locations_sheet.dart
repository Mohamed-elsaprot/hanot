import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_addresses_cubit.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/view/widgets/add_new_location_container.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/view/widgets/confirm_location_button.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/custom_shipping_company_tile.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';


class AddNewLocationSheet extends StatefulWidget {
  const AddNewLocationSheet({Key? key}) : super(key: key);

  @override
  State<AddNewLocationSheet> createState() => _AddNewLocationSheetState();
}

class _AddNewLocationSheetState extends State<AddNewLocationSheet> {
  late AllAddressesCubit addressCubit;
  late Map texts;
  late num selectedId;
  int selectedIndex=0;
  @override
  void initState() {
    addressCubit = BlocProvider.of<AllAddressesCubit>(context);
    texts = BlocProvider.of<LangCubit>(context).texts;
    selectedId = addressCubit.selectedAddressId??0;
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
            appBar: sheetAppBar(title: texts['mobile_select_delivery_address_label'],context: context),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ...List.generate(addressCubit.allAddressesList.length, (index) {
                    if(addressCubit.allAddressesList[index].id==selectedId) selectedIndex = index;
                    return CustomRadioTiles(
                    title: '${addressCubit.allAddressesList[index].country}, ${addressCubit.allAddressesList[index].city}',
                    subTitle: '${addressCubit.allAddressesList[index].neighborhood}''${addressCubit.allAddressesList[index].homeAddress!=null? ', ${addressCubit.allAddressesList[index].homeAddress}':''}',
                    horPadding: 14, val: addressCubit.allAddressesList[index].id!,
                    gVal: selectedId!,
                    fun: (x){
                      selectedId = x!;
                      setState(() {});
                    },
                    );
                  }
                  ),
                  const AddNewLocationContainer(),
                ],
              ),
            ),
            bottomNavigationBar: ConfirmLocationButton(index: selectedIndex,selectedId: selectedId),
          ),
        )
    );
  }
}
