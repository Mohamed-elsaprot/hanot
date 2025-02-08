import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/home/view/widgets/banner_slider.dart';
import 'package:hanot/features/home/view/widgets/categories_grid_view.dart';
import 'package:hanot/features/home/view/widgets/home_products_list.dart';
import 'package:hanot/features/home/view/widgets/hor_categories_list_2.dart';
import 'package:hanot/features/navigation_screen/view/widget/nav_screen_shimmer.dart';

import '../../../core/design/app_styles.dart';
import '../../../core/general_managers/currency_cubit/currency_cubit.dart';
import '../../../core/general_managers/currency_cubit/currency_state.dart';
import '../manager/home_cubit.dart';
import '../manager/home_state.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late HomeCubit homeCubit;
  @override
  void initState() {
     homeCubit = BlocProvider.of<HomeCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Styles.primary,
        onRefresh: ()async{
          homeCubit.getHomeData();
        },
        child: BlocConsumer<CurrencyCubit,CurrencyState>(builder: (context,currencyState){
          if(currencyState is CurrencySuccess){
            return BlocBuilder<HomeCubit,HomeState>(builder: (context,state){
              if(state is HomeSuccess){
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                     // SearchTextField(readOnly: true),
                      Column(
                        children: [
                          for(var x in homeCubit.homeList)
                            if(x.type=='categories' && x.temp==1)
                              HorCategoriesList2(categoriesList: x.categoriesList)
                          else if(x.type=='banner') BannerSlider(homeModelWithBannerItems: x)
                          else if(x.type=='slide_products') HomeProductsList(homeModelWithProducts: x)
                          else if(x.type=='categories' && x.temp==2) CategoriesGridView(list: x.categoriesList),
                        ],
                      ),
                    ],
                  ),
                );
              }else if(state is HomeFailure){
                return Center(child: Styles.text(state.errorMessage),);
              }
              else{
                return  NavScreenShimmer(isHome: true,);
              }
            });
          }else{
            return NavScreenShimmer(isHome: true,);
          }
        }, listener: (context,currencyState){
          if(currencyState is CurrencyFailure) errorDialog(context: context, message: currencyState.errorMessage);
          if(currencyState is CurrencySuccess) {
            homeCubit.getHomeData();
          }
        }),
      ),
    );
  }
}

