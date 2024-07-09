import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../features/favorites/manager/fav_cubit.dart';
import '../../../../features/favorites/manager/fav_state.dart';
import '../../../fav_icon.dart';

class SheetAppBar extends StatelessWidget {
  const SheetAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 4.h),
      child: Row(
        children: [
          IconButton(onPressed: ()=>Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios,size: 20,)),
          const Spacer(),
          // CircleAvatar(radius: 18.w,backgroundColor: Styles.primary.withOpacity(.05), child: const Icon(Icons.share_rounded,color: Styles.primary,size: 20,)),
          // const SizedBox(width: 10,),
          // CircleAvatar(radius: 18.w,backgroundColor: Styles.primary.withOpacity(.05), child: const Icon(CupertinoIcons.delete_simple,color: Styles.primary,size: 20,)),
          // const SizedBox(width: 10,),
          BlocBuilder<FavCubit,FavState>(builder: (context,state){
            return CircleAvatar(radius: 18.w,backgroundColor:Styles.primary.withOpacity(.05), child: const FavIcon());
          }),
        ],
      ),
    );
  }
}
