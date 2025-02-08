import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hanot/core/design/app_styles.dart';

class SettingsTextsScaffold extends StatelessWidget {
  const SettingsTextsScaffold({Key? key, required this.fromSheet, required this.title, required this.body}) : super(key: key);
  final bool fromSheet;
  final String title, body;
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
        title: Styles.text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Styles.text(body,size: 11.5),
      )
    );
  }
}
