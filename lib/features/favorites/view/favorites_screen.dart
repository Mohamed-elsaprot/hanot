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

import '../../../core/design/widgets.dart';
import '../../cart/view/widgets/cart_appBar.dart';
import '../../my_orders/view/widgets/search_app_bar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late FavCubit favCubit;
  @override
  void initState() {
    favCubit = BlocProvider.of<FavCubit>(context);
    favCubit.getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const CartAppBar(),
        bottom: PreferredSize(
          preferredSize: Size(0, 50.h),
          child: const SearchAppBar(),
        ),
      ),
      backgroundColor: Styles.scaffoldColor,
      body: BlocBuilder<FavCubit, FavState>(
        builder: (context, state) {
          if (state is FavoritesSuccess) {
            return state.favorites.data == null
                ? const FavEmpty()
                : Column(
                    children: [
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: EdgeInsetsDirectional.all(10.w),
                        child: Styles.text(Texts.favProducts.tr()),
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return FavItemCard(
                                product: favCubit.favList[index]);
                          },
                          itemCount: state.favorites.data!.length,
                        ),
                      ),
                    ],
                  );
          }
          if (state is FavoritesFailure) {
            return Expanded(
              child: Center(
                child: Styles.text(state.errorMessage),
              ),
            );
          } else {
            return Expanded(
              child: Center(
                child: loadingIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
