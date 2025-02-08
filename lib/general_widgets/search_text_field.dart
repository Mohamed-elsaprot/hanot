import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../consts.dart';
import '../core/design/app_styles.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key, this.icon=true, required this.readOnly, this.onSubmit}) : super(key: key);
  final bool? icon;
  final bool readOnly;
  final void Function(String)? onSubmit;
  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late LangCubit langCubit;

  @override
  void initState() {
    langCubit = BlocProvider.of<LangCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.readOnly?'h':'',
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            child: TextFormField(
              readOnly: widget.readOnly,
              onTap: (){
                if(widget.readOnly)AppRouter.router.push(AppRouter.search);
              },
              onFieldSubmitted: widget.onSubmit,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 12),
                  hintText: langCubit.texts['mobile_search_input_label'],
                  hintStyle: const TextStyle(fontWeight: FontWeight.w600,fontFamily: fontFamily,fontSize: 13),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  prefixIcon: const Icon(Icons.search,color: Colors.black45),
                  suffixIcon:widget.icon!? const Icon(Icons.qr_code,color: Styles.primary,):null
              ),
            ),
          ),
        ),
      ),
    );
  }
}
