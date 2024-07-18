import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/categories/categories_screen/view/shimmer_categories.dart';

import '../../../../core/design/fun.dart';
import '../../manager/small_category_cubit/small_category_cubit.dart';
import '../../manager/small_category_cubit/small_category_state.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var smallCategoryCubit = BlocProvider.of<SmallCategoryCubit>(context);
    return Scaffold(
      appBar: customAppBar(),
      body: RefreshIndicator(
        color: Styles.primary,
        onRefresh: ()async{
          smallCategoryCubit.getSmallCategories();
        },
        child: BlocBuilder<SmallCategoryCubit,SmallCategoryState>(builder: (context,state){
          if(state is SmallCategorySuccess){
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              physics: const BouncingScrollPhysics(),
                itemCount: smallCategoryCubit.smallCategoryList.length,
                gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 140.w,
                        mainAxisExtent: 130.h,
                    mainAxisSpacing: 18,
                  crossAxisSpacing: 10
                ),
                itemBuilder: (context,index){
              return GestureDetector(
                onTap: ()=>AppRouter.router.push(AppRouter.categoryProducts,extra: smallCategoryCubit.smallCategoryList[index]),
                child: Column(
                  children: [
                    cachedImage(height: 100,smallCategoryCubit.smallCategoryList[index].image??'',rad: 8),
                    SizedBox(height: 6.h,),
                    Styles.text(smallCategoryCubit.smallCategoryList[index].name??'',size: 12,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis)
                  ],
                ),
              );
            });
          }else if(state is SmallCategoryFailure){
            return Center(child: Styles.text(state.errorMessage),);
          }else{
            return const ShimmerCategories();
          }
        }),
      ),
    );
  }
}