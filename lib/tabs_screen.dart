import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/consts.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hanot/features/cart/manager/cart_cubit.dart';
import 'package:hanot/features/cart/manager/cart_state.dart';

import 'core/services/localization.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
      backgroundColor: Colors.white.withOpacity(.95),
        body:
        tabsList[index],
        bottomNavigationBar: Container(
          color: Colors.white,
          child: TabBar(
            unselectedLabelColor: Colors.black26,
            labelColor: Styles.primary,
            onTap: (x){
              index=x;setState(() {});
            },
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 0, color: Colors.transparent),
            ),
            tabs: [
              // Local.changeLang(context);
              Tab(icon: const Icon(Icons.home),child: Styles.text(Texts.home,size: 11.w).tr(),),
              Tab(icon: const Icon(CupertinoIcons.calendar_today),child: Styles.text(Texts.categories,size: 11.w).tr()),
              BlocBuilder<CartCubit,CartState>(builder: (context,state){
                return Tab(icon:
                cartCubit.cartList.isNotEmpty? badges.Badge(
                    badgeContent: Text(
                      cartCubit.cartList.length.toString(),
                      style: const TextStyle(color: Colors.white,fontSize: 14),
                    ),
                    position: badges.BadgePosition.custom(end: 14, bottom: 7,),
                    badgeStyle: badges.BadgeStyle(
                      padding: EdgeInsets.all(4.4.sp),
                      badgeColor: Colors.red,
                    ),
                    child: const Icon(Icons.shopping_cart)
                ):const Icon(Icons.shopping_cart),child: Styles.text(Texts.cart,size: 11.w).tr());
              }),
              Tab(icon: const Icon(Icons.favorite),child: Styles.text(Texts.fav,size: 11.w).tr()),
              Tab(icon: const Icon(Icons.person),child: Styles.text(Texts.settings,size: 11.w).tr()),
            ],
          ),
        ),
      ),
    );
  }
}
