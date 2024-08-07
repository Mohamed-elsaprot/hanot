import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/home/view/widgets/home_products_list.dart';
import 'package:hanot/general_widgets/search_text_field.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/widgets.dart';
import '../../manager/home_cubit.dart';
import '../../manager/home_state.dart';
import 'banner_slider.dart';
import 'hor_category_List.dart';

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
     homeCubit.getHomeData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: customAppBar(),
      body: RefreshIndicator(
        color: Styles.primary,
        onRefresh: ()async{
          homeCubit.getHomeData();
        },
        child: BlocBuilder<HomeCubit,HomeState>(builder: (context,state){
          if(state is HomeSuccess){
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Column(
                    children: [
                      const SearchTextField(readOnly: true,),
                      ...List.generate(homeCubit.homeList.length, (index){
                        if(homeCubit.homeList[index].type=="banner"){
                          return SliderContainer(homeModelWithBannerItems: homeCubit.homeList[index]);
                        }else if(homeCubit.homeList[index].type=="categories"){
                          return HorizontalCategoriesList(categoriesList: homeCubit.homeList[index].categoriesList);
                        }else if(homeCubit.homeList[index].type=="slide_products"){
                          return HomeProductsList(homeModelWithProducts: homeCubit.homeList[index]);
                        } else {
                          return const SizedBox();
                        }
                      }),
                      // const NewProducts()
                    ],
                  ),
                ],
              ),
            );
          }else if(state is HomeFailure){
            return Center(child: Styles.text(state.errorMessage),);
          }
          else{
            return loadingIndicator();
          }
        }),
      ),
    );
  }
}
