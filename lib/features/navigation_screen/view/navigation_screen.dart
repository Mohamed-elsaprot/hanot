import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/consts.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/navigation_screen/manager/navigation_screen_manager.dart';
import 'package:hanot/features/navigation_screen/view/widget/cart_tab.dart';
import 'package:hanot/features/navigation_screen/view/widget/tab_item.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var navCubit = BlocProvider.of<NavigationScreenCubit>(context);
    return BlocConsumer<NavigationScreenCubit,NavigationScreenState>(builder: (context,state){
      return Scaffold(
        backgroundColor: Styles.secScaffoldColor,
        body: tabsList[navCubit.index],
        bottomNavigationBar: Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.black26,
            labelColor: Styles.primary,
            labelStyle: const TextStyle(fontFamily: fontFamily,fontWeight: FontWeight.w900,fontSize: 11),
            onTap: (x)async{
              navCubit.setIndex(x);
              await navCubit.checkFun(context);
            },
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 0, color: Colors.transparent),
            ),
            tabs: [
              // Local.changeLang(context);
              TabItem(iconData: Icons.home_filled, title: Texts.home.tr(),),
              TabItem(iconData: Icons.qr_code, title: Texts.categories.tr(),),
              const CartTab(),
              TabItem(iconData: CupertinoIcons.cube_fill, title: Texts.myOrders.tr(),),
              TabItem(iconData: Icons.settings_rounded, title: Texts.settings.tr(),),
            ],
          ),
        ),
      );
    },
      listener: (context,state){
        if(state is NavigationScreenReset){
          _tabController.index=0;
        }
      },
    );
  }
}
