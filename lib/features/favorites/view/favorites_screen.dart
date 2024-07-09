import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/favorites/manager/fav_cubit.dart';
import 'package:hanot/features/favorites/manager/fav_state.dart';
import 'package:hanot/features/favorites/view/widgets/fav_empty.dart';
import 'package:hanot/features/favorites/view/widgets/fav_item_card.dart';
import 'package:hanot/general_widgets/search_text_field.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favCubit = BlocProvider.of<FavCubit>(context);
    return Scaffold(
      backgroundColor: Styles.scaffoldColor,
      body: BlocBuilder<FavCubit, FavState>(
        builder: (context, state) {
          return favCubit.favList.isNotEmpty
              ? Column(
                  children: [
                    const SearchTextField(icon: false),
                    SizedBox(height: 10.h,),
                    Container(
                        color:Colors.white,width: double.infinity, padding: EdgeInsetsDirectional.all(10.w),
                        child: Styles.text(Texts.favProducts.tr()),
                    ),
                    Expanded(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return FavItemCard(product: favCubit.favList[index]);
                          },
                          itemCount: favCubit.favList.length),
                    ),
                  ],
                )
              : const FavEmpty();
        },
      ),
    );
  }
}
