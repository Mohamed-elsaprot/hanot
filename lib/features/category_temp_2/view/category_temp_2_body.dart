import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/core/design/widgets_fun.dart';
import 'package:hanot/features/category_temp_2/view/widgets/cat_temp_2_filter_row.dart';
import 'package:hanot/general_widgets/cart_appbar_icon.dart';

import '../../../general_widgets/item_card.dart';
import '../../categories/model/SmallCategoryModel.dart';
import '../manager/category_temp_2_cubit.dart';
import '../manager/category__temp_2_state.dart';

class CategoryTemp2Body extends StatelessWidget {
  const CategoryTemp2Body({Key? key, required this.smallCategoryModel}) : super(key: key);
  final SmallCategoryModel smallCategoryModel;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CategoryTemp2Cubit>(context);
    return BlocConsumer<CategoryTemp2Cubit,CategoryTemp2State>(
        builder: (context,state){
          if(state is CategoryTemp2Success){
            return Scaffold(
              backgroundColor: Styles.secScaffoldColor ,
              appBar: catAppBar(context: context,title: smallCategoryModel.name??'',
                  bottom: !cubit.isCat?PreferredSize(preferredSize: Size(0,40.h), child: CatTemp2FilterRow(categoryModel: smallCategoryModel,)):null,
                action: CartAppbarIcon()
              ),
              body: cubit.isCat?ListView.separated(
                itemCount: cubit.catList.length,
                padding: const EdgeInsets.only(bottom: 20),
                itemBuilder: (context,index){
                  return ListTile(
                    leading: cachedImage(cubit.catList[index].image??'',height: 30,width: 30),
                    title: Styles.text(cubit.catList[index].name??'---'),
                    onTap: (){
                      AppRouter.router.push(AppRouter.catTemp2,extra: cubit.catList[index]);
                    },
                  );
                },
                separatorBuilder: (context,index)=>Divider(indent: 20,endIndent: 20,color: Colors.grey.shade300,),
              ):GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                itemCount: cubit.productsList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,mainAxisSpacing: 20,
                    childAspectRatio: 1/1.85
                ),
                itemBuilder: (context,index)=>ItemCard(product: cubit.productsList[index]),
              ),
            );
          } else {
            return Scaffold(
                backgroundColor: Styles.secScaffoldColor ,
                appBar: catAppBar(context: context,title: smallCategoryModel.name??'',),
                body: Center(child: loadingIndicator(),)
            );
          }
        },
        listener: (context,state){
          if(state is CategoryTemp2Failure) errorDialog(context: context, message: state.errorMessage);
        }
    );
  }
}



