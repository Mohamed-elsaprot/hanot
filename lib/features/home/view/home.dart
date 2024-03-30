import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/home/manager/home_cubit.dart';
import 'package:hanot/features/home/manager/home_state.dart';
import 'package:hanot/features/home/view/widgets/banner_slider.dart';
import 'package:hanot/features/home/view/widgets/category_List.dart';
import 'package:hanot/features/home/view/widgets/products_list.dart';

import '../../../core/design/widgets.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit,HomeState>(builder: (context,state){
      if(state is HomeSuccess){
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(homeCubit.homeList.length, (index){
              if(homeCubit.homeList[index].type=="slide_products"){
                return ProductsList(homeModelWithProducts: homeCubit.homeList[index]);
              }else if(homeCubit.homeList[index].type=="banner"){
                return SliderStack(homeModelWithBannerItems: homeCubit.homeList[index]);
              }else{
                return HorizontalCategoriesList(categoriesList: homeCubit.homeList[index].categoriesList);
              }
            }),
          ),
        );
      }else if(state is HomeFailure){
        return Center(child: Styles.text(state.errorMessage),);
      }
      else{
        return loadingIndicator();
      }
    });
  }
}


