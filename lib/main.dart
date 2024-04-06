import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/auth_screen/data/auth_repo_impl.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/cart/data/cart_repo_impl.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/favorites/manager/fav_cubit.dart';
import 'core/design/router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(
        startLocale: const Locale('ar'),
      supportedLocales: const[
        Locale('ar'),
        Locale('en'),
      ], path: 'locales',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411.4, 683.4),
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context)=>AuthCubit(AuthRepoImpl())..checkToken()),
              BlocProvider(create: (context)=>CartCubit(CartRepoImpl())..getCartProducts()),
              BlocProvider(create: (context)=>FavCubit()),
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.transparent,
                appBarTheme: AppBarTheme(
                  centerTitle: true,
                  backgroundColor: Colors.grey.shade100,
                  elevation: 3,
                  shadowColor: Colors.black54,
                  iconTheme: const IconThemeData(
                      color: Colors.black
                  ),
                  toolbarTextStyle: const TextStyle(color: Colors.black),
                ),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white12,
                        textStyle: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,)
                    )
                ),
                textTheme: TextTheme(
                  // bodyMedium: TextStyle(fontSize: 15.sp,fontFamily: fontFamily),
                ),
              ),
              routerConfig: AppRouter.router,
            ),
          );
        });
  }
}



