import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/favorites/manager/fav_cubit.dart';
import 'package:hanot/features/favorites/manager/fav_state.dart';

import '../../../core/design/appTexts.dart';
import '../../../core/design/app_styles.dart';
import '../../../general_widgets/item_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favCubit = BlocProvider.of<FavCubit>(context);
    return Scaffold(
      appBar: AppBar(title: Styles.text(Texts.favorites,size: 22).tr(),),
      body: BlocBuilder<FavCubit,FavState>(
        builder: (context,state){
          return GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: favCubit.favList.length,
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 290.h
              ),
              itemBuilder: (context,index){
                return ItemCard(product: favCubit.favList[index],);
              });
        },
      ),
    );
  }
}
