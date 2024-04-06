import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hanot/consts.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/navigation_screen/manager/navigation_screen_manager.dart';
import 'package:hanot/features/navigation_screen/view/widget/cart_tab.dart';
import 'package:hanot/features/navigation_screen/view/widget/tab_item.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int index=0;

  @override
  Widget build(BuildContext context) {
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
            onTap: (x)async{
              index=x;setState(() {});
              await NavigationManager.checkFun(index, context);
            },
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 0, color: Colors.transparent),
            ),
            tabs: const [
              // Local.changeLang(context);
              TabItem(iconData: Icons.home, title: Texts.home,),
              TabItem(iconData: CupertinoIcons.calendar_today, title: Texts.categories,),
              CartTab(),
              TabItem(iconData: Icons.favorite, title: Texts.fav,),
              TabItem(iconData: Icons.person, title: Texts.settings,),
            ],
          ),
        ),
      ),
    );
  }
}
