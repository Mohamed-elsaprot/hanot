import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/general_widgets/custom_button.dart';
import 'package:hanot/general_widgets/custom_textField.dart';

import '../../../../../core/design/appTexts.dart';
import '../../../../../core/design/app_styles.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  double height = 250;
  late String cachedNote;
  @override
  void initState() {
    cachedNote = widget.controller.text;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        widget.controller.text=cachedNote;
        Navigator.pop(context);
        return Future(() => false);
        },
      child: SizedBox(
        height: height.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Scaffold(
            appBar: AppBar(title: Styles.text(Texts.addNote.tr(),size: 22,),leading: IconButton(onPressed: (){
              widget.controller.text=cachedNote;
              Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back))),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  CustomTextField(title: Texts.addNote.tr(),onTap: (){height=460;setState(() {});},maxLines: 4,controller: widget.controller),
                  const Spacer(),
                  SizedBox(
                      width: double.infinity,
                      child: CustomButton(fun: () {
                        Navigator.pop(context);
                      }, title:widget.controller.text.isNotEmpty?Texts.edit.tr(): Texts.addNote.tr()))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
