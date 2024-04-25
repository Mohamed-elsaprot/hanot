import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/models/customer_addresses_model/Addresses.dart';

import '../../../../../core/design/app_styles.dart';
import '../../manager/old_addresses_cubit/old_addresses_cubit.dart';

class AddressRadioOption extends StatelessWidget {
  const AddressRadioOption({Key? key, required this.address,required this.fun, required this.index, required this.inAllScreen, }) : super(key: key);
  final Address address;
  final void Function(dynamic)? fun;
  final int index;
  final bool inAllScreen;
  @override
  Widget build(BuildContext context) {
    var oldAddressesCubit = BlocProvider.of<OldAddressesCubit>(context);
    var shippingComCubit = BlocProvider.of<ShippingCompaniesCubit>(context);
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            secondary: !inAllScreen?GestureDetector(
              onTap: () async {
                  await oldAddressesCubit.deleteAddress(addressId: address.id.toString(), index: index);
                  if(oldAddressesCubit.customerAddressesModel.addressesList!.isEmpty){
                    shippingComCubit.resetShippingCompanies();
                  }
              },
              child: CircleAvatar(
                radius: 15.sp,
                backgroundColor: Colors.red,
                child: const Icon(Icons.delete_outline,color: Colors.white,size: 20,),
              ),
            ):null,
              title: Styles.text('${address.country??''}${address.country!=null?', ':''}${address.city??''}${address.city!=null?', ':''}${address.neighborhood??''}${address.neighborhood!=null?', ':''}${address.streetName??''}'),
              activeColor: Styles.primary,
              value: address.id!, groupValue: oldAddressesCubit.groupVal, onChanged: fun
          ),
        ),
      ],
    );
  }
}
