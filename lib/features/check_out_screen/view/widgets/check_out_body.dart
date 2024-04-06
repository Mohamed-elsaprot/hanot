import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/check_out_screen/view/widgets/option_tile.dart';
import 'package:hanot/features/check_out_screen/view/widgets/price_row.dart';
import 'package:hanot/general_widgets/custom_button.dart';


class CheckOutBody extends StatelessWidget {
  const CheckOutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      children: [
        OptionTile(title: 'طريقة الدفع',subTitle: 'كاش',iconData: Icons.wallet,groupVal: '1'),
        OptionTile(title: 'طريقة التوصيل',subTitle: 'توصيل لعنولن: البيت',iconData: Icons.navigation_outlined,groupVal: '1'),
        OptionTile(title: 'شركة الشحن',subTitle: 'شركة النسر السريع',iconData: Icons.local_shipping,groupVal: '1'),
        SizedBox(height: 6.h,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.grey.shade200
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles.text('ملاحظة على الطلب',size: 11),
              Styles.text('ملاحظة على الطلب'),
            ],
          ),
        ),
        SizedBox(height: 12.h,),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.grey.shade200
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Styles.text('هل لديك كوبون؟',),
                  Styles.text('EID2024',),
                ],
              ),
              Spacer(),
              CustomButton(fun: (){}, title: 'تطبيق',rad: 6,padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),)
            ],
          ),
        ),
        SizedBox(height: 25.h,),
        Column(
          children: [
            PriceRow(title: 'الاجمالي',price: 625,),
            SizedBox(height: 12.h,),
            PriceRow(title: 'تكلفة التوصيل',price: 75,),
            Divider(height: 20,thickness: .5,color: Colors.black,),
            PriceRow(title: 'تكلفة التوصيل',price: 300,total: true),
          ],
        ),
        SizedBox(height: 50.h,),
        SizedBox(width: double.infinity,
          child: CustomButton(fun: (){}, title: 'ارسال الطلب',rad: 8),
        )

      ],
    );
  }
}
