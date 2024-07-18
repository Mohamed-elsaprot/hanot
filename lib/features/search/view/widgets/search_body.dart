import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/features/search/manager/search_result_state.dart';
import 'package:hanot/features/search/manager/search_results_cubit.dart';
import 'package:hanot/general_widgets/item_card.dart';
import 'package:hanot/general_widgets/search_text_field.dart';
import 'package:lottie/lottie.dart';

import '../../../categories/category_products_screen/view/widgets/category_products_screen_shimmer.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchCubit = BlocProvider.of<SearchResultsCubit>(context);
    var textsMap = BlocProvider.of<LangCubit>(context).texts;
    return Scaffold(
      backgroundColor: Styles.scaffoldColor,
      appBar: AppBar(
        elevation: 0,scrolledUnderElevation: 0,
        title: Styles.text(textsMap['mobile_search'],color: Styles.primary,size: 22),
        bottom: PreferredSize(
          preferredSize: Size(0, 55.h),
          child: SearchTextField(readOnly: false,onSubmit: (x)=> searchCubit.getResults(keyWord: x),),
        ),
      ),
      body: BlocBuilder<SearchResultsCubit,SearchResultState>(builder: (context,state){
        if(state is SearchResultsInitial){
          return Center(child: Hero(tag: 'h', child: Lottie.asset('assets/images/search_animation.json',)));
        }else if(state is SearchResultsSuccess){
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            itemCount: searchCubit.resultsList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,mainAxisSpacing: 20,
                childAspectRatio: 1/1.75
            ),
            itemBuilder: (context,index)=>ItemCard(product: searchCubit.resultsList[index]),
          );
        }else if(state is SearchResultsFailure){
          return Center(child: Styles.text(state.errorMessage),);
        }else{
          return const CategoryProductsScreenShimmer(padding: 20,);
        }
      })
    );
  }
}
