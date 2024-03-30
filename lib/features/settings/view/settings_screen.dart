import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/design/appTexts.dart';
import '../../../core/design/app_styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Styles.text(Texts.settings,size: 22).tr(),),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 3.h),
              color: Colors.white, child: ListTile(
              title: Styles.text(Texts.whoAreWe).tr(),
              onTap: (){},
          )),
          Container(
              margin: EdgeInsets.only(bottom: 3.h),
              color: Colors.white, child: ListTile(
              title: Styles.text(Texts.termsOfUse).tr(),
              onTap: (){},
          )),
          Container(
              margin: EdgeInsets.only(bottom: 3.h),
              color: Colors.white, child: ListTile(
              trailing: const Icon(Icons.phone),
              title: Styles.text(Texts.contactUs).tr(),
              onTap: (){},
          )),
          Container(
              margin: EdgeInsets.only(bottom: 3.h),
              color: Colors.white, child: ListTile(
              trailing: const Icon(Icons.chat_outlined),
              title: Styles.text(Texts.whatsApp).tr(),
              onTap: (){},
          )),
          Container(
              margin: EdgeInsets.only(bottom: 3.h),
              color: Colors.white, child: ListTile(
              trailing: const Icon(Icons.logout_rounded),
              title: Styles.text(Texts.logOut).tr(),
              onTap: (){},
          )),
        ],
      ),
    );
  }
}
