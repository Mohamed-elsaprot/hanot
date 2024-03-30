import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/core/design/widgets.dart';

import '../../manager/small_category_cubit/small_category_cubit.dart';
import '../../manager/small_category_cubit/small_category_state.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var smallCategoryCubit = BlocProvider.of<SmallCategoryCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Styles.text(Texts.categories,size: 22).tr(),
      ),
      body: BlocBuilder<SmallCategoryCubit,SmallCategoryState>(builder: (context,state){
        if(state is SmallCategorySuccess){
          return ListView(
              physics: const BouncingScrollPhysics(),
              children: List.generate(smallCategoryCubit.smallCategoryList.length, (index) => Column(
                children: [
                  ListTile(
                    title: Styles.text(smallCategoryCubit.smallCategoryList[index].name!),
                    onTap: (){
                      AppRouter.router.push(AppRouter.categoryProducts,extra: smallCategoryCubit.smallCategoryList[index]);
                    },
                  ),
                  const Divider(color: Colors.black54,)
                ],
              ))
          );
        }else if(state is SmallCategoryFailure){
          return Center(child: Styles.text(state.errorMessage),);
        }else{
          return loadingIndicator();
        }
      }),
    );
  }
}
