import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hanot/core/design/app_styles.dart';

class TermsWidget extends StatelessWidget {
  const TermsWidget({Key? key, required this.fromSheet}) : super(key: key);
  final bool fromSheet;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.scaffoldColor,
      appBar: AppBar(
        leading: fromSheet? const SizedBox():null,
        actions: [
          if(fromSheet)GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: const CircleAvatar(
              radius: 12,
              backgroundColor: Colors.black12,
              child: Icon(Icons.close_rounded,color: Colors.white,size: 14,),
            ),
          ),
          const SizedBox(width: 10,),
        ],
        title: Styles.text('terms and Conditions'.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Styles.text('terms Quote'.tr(),size: 11.5),
      )
    );
  }
}
