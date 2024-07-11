import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/favorites/data/models/get_favorites_model.dart';
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
  late ScrollController scrollController;
  @override
  void initState() {
    favCubit = BlocProvider.of<FavCubit>(context);
    scrollController = ScrollController();
    favCubit.getFavorites();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        favCubit.getNextPageFavorites(context);
      }
    });
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
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: EdgeInsetsDirectional.all(10.w),
            child: Styles.text(Texts.favProducts.tr()),
          ),
          BlocBuilder<FavCubit, FavState>(
            builder: (context, state) {
              if (state is FavoritesSuccess) {
                List<Data?> data = state.favorites.data!;
                return state.favorites.data == null
                    ? const FavEmpty()
                    : Expanded(
                        child: ListView(
                          controller: scrollController,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Column(
                                      children: List.generate(
                                        state.favorites.data!.length,
                                        (index) {
                                          return FavItemCard(
                                            product: favCubit.favList[index],
                                            availableQuantity: data[index]!
                                                .availableQuantity
                                                .toString(),
                                            costPrice: data[index]!
                                                .costPrice
                                                .toString(),
                                            discountPrice: data[index]!
                                                .discountPrice
                                                .toString(),
                                            image:
                                                data[index]!.image.toString(),
                                            productName:
                                                data[index]!.name.toString(),
                                            salePrice: data[index]!
                                                .salePrice
                                                .toString(),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    favCubit.last || data.length <= 4
                                        ? const SizedBox()
                                        : loadingIndicator(),
                                  ],
                                )),
                          ],
                        ),
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
        ],
      ),
    );
  }
}
