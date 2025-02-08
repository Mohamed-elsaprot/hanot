import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/consts.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/design/widgets_fun.dart';
import 'package:hanot/core/local_storage/secure_storage.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/features/lang/manager/lang_states.dart';
import 'package:hanot/features/navigation_screen/manager/navigation_screen_manager.dart';
import 'package:hanot/features/navigation_screen/view/widget/cart_item.dart';
import 'package:hanot/features/navigation_screen/view/widget/nav_item.dart';
import 'package:hanot/features/navigation_screen/view/widget/nav_screen_shimmer.dart';

import '../../../core/services/version_handler.dart';
import '../../check_out/check_out_screen/models/shipping_company/ShippingCompany.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  late Map textsMap;
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
    return BlocConsumer<LangCubit,LangState>(
        buildWhen: (context,state)=> state is LangSuccess ||state is LangLoading ||state is LangFailure,
        builder: (context,state){
      if(state is LangSuccess && SecureStorage.deviceId!=null){
        return BlocConsumer<NavigationScreenCubit,NavigationScreenState>(
          builder: (context,state){
            return Scaffold(
              appBar: customAppBar(context,withCartIcon: navCubit.index==2?false:true),
              backgroundColor: Styles.scaffoldColor,
              body: tabsList[navCubit.index],
              bottomNavigationBar: Container(
                color: Styles.primary,
                padding: EdgeInsets.only(bottom: 14.h,top: 4.h),
                child: CustomNavigationBar(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  currentIndex: navCubit.index,
                  onTap: (x)async{
                    navCubit.setIndex(x);
                    await navCubit.checkFun(context);
                  },
                  iconSize: 55.sp,
                  selectedColor: Colors.white,
                  strokeColor: Colors.transparent,
                  items: [
                    NavigationItem.item(icon: Icons.home_filled, title: textsMap['mobile_Home']),
                    NavigationItem.item(icon: Icons.qr_code, title: textsMap['mobile_categories']),
                    CartItemNav.cartTab(context),
                    NavigationItem.item(icon: CupertinoIcons.cube_fill, title: textsMap['mobile_myOrders']),
                    NavigationItem.item(icon: Icons.settings_rounded, title: textsMap['mobile_settings']),
                  ],
                ),
              ),
            );
        },
          listener: (context,state){
            if(state is NavigationScreenReset){
              _tabController.index= navCubit.index;
            }
          },
        );
      }else{
        return NavScreenShimmer();
      }
    }, listener: (context,state) async {
          if(state is LangPreSuccess) {
            var langCubit = BlocProvider.of<LangCubit>(context);
            textsMap = langCubit.texts;
            var direction = await SecureStorage.getAppDirection();
            EasyLocalization.of(context)!.setLocale(Locale(direction=='rtl'?'ar':'en'));
            constComList.add(ShippingCompany(name: textsMap['mobile_selfPickUp'], id: 0, cost: '0', duration: textsMap['mobile_selfPickUp'], priceId: 0, supportedCities: []));
            VersionHandler.checkVersion(context);
            langCubit.emit(LangSuccess());
            // context.setLocale(Locale(lang));
          }
    });
  }
}

//TabBar(
//                 controller: _tabController,
//                 // unselectedLabelColor: Colors.black26,
//                 unselectedLabelColor: Colors.white30,
//                 // labelColor: Styles.primary,
//                 labelColor: Colors.white,
//                 labelStyle: const TextStyle(fontFamily: fontFamily,fontWeight: FontWeight.w900,fontSize: 11),
//                 onTap: (x)async{
//                   navCubit.setIndex(x);
//                   await navCubit.checkFun(context);
//                 },
//                 indicatorPadding: EdgeInsets.zero,
//                 indicator: const UnderlineTabIndicator(
//                   borderSide: BorderSide(width: 0, color: Colors.transparent),
//                 ),
//                 tabs: [
//                   TabItem(iconData: Icons.home_filled, title: textsMap['mobile_Home'],),
//                   TabItem(iconData: Icons.qr_code, title: textsMap['mobile_categories'],),
//                   const CartTab(),
//                   TabItem(iconData: CupertinoIcons.cube_fill, title: textsMap['mobile_myOrders'],),
//                   TabItem(iconData: Icons.settings_rounded, title: textsMap['mobile_settings'],),
//                 ],
//               )