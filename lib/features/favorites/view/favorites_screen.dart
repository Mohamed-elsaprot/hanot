import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/favorites/manager/fav_cubit.dart';
import 'package:hanot/features/favorites/manager/fav_state.dart';
import 'package:hanot/features/favorites/view/widgets/fav_empty.dart';
import 'package:hanot/features/favorites/view/widgets/fav_item_card.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../core/design/widgets.dart';
import '../../cart/view/widgets/cart_appBar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late FavCubit favCubit;
  late AuthCubit authCubit;
  late Map textsMap;
  late ScrollController scrollController;
  @override
  void initState() {
    authCubit = BlocProvider.of<AuthCubit>(context);
    favCubit = BlocProvider.of<FavCubit>(context);
    textsMap = BlocProvider.of<LangCubit>(context).texts;
    scrollController = ScrollController();
    if(authCubit.isAuth)favCubit.getFavorites();
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
    return PopScope(
      onPopInvoked: (x){
        favCubit.last=false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            favCubit.last=false;
            AppRouter.router.pop();
          }, icon: const Icon(Icons.arrow_back)),
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const CartAppBar(),
          // bottom: PreferredSize(preferredSize: Size(0, 50.h), child: const SearchAppBar(),),
        ),
        backgroundColor: Styles.scaffoldColor,
        body: RefreshIndicator(
          color: Styles.primary,
          onRefresh: ()async{
            favCubit.getFavorites();
          },
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsetsDirectional.all(10.w),
                child: Styles.text(textsMap['mobile_favProducts']),
              ),
              authCubit.isAuth? BlocBuilder<FavCubit, FavState>(
                buildWhen: (previous, current) => current is FavoritesSuccess || current is FavoritesLoading || current is FavoritesFailure,
                builder: (context, state) {
                  if (state is FavoritesSuccess) {
                    return favCubit.favoritesModel.favItemsList!.isEmpty
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
                                            favCubit.favoritesModel.favItemsList!.length,
                                            (index) {
                                              return FavItemCard(favItemModel: favCubit.favoritesModel.favItemsList![index],index: index,);
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                        favCubit.last || favCubit.favoritesModel.favItemsList!.length <= 4
                                            ? const SizedBox() : loadingIndicator(),
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
              ):const Expanded(child: FavEmpty()),
            ],
          ),
        ),
      ),
    );
  }
}
