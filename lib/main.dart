import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/auth_screen/data/auth_repo_impl.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/cart/data/cart_repo_impl.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/data/all_addresses_repo_impl.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_addresses_cubit.dart';
import 'package:hanot/features/favorites/manager/fav_cubit.dart';
import 'package:hanot/features/navigation_screen/manager/navigation_screen_manager.dart';
import 'core/design/router.dart';
import 'features/check_out/check_out_screen/data/shipping_companies_repo/shipping_companies_repo_impl.dart';
import 'features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_cubit.dart';
import 'features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_cubit.dart';
import 'features/favorites/data/repositories/get_favorites_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // SecureStorage.deleteData();
  // var sec = await SecureStorage.getToken();
  // print(sec);
  runApp(EasyLocalization(
      startLocale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'locales',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411.4, 683.4),
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => NavigationScreenCubit()),
              BlocProvider(
                  create: (context) => AuthCubit(AuthRepoImpl())..checkToken()),
              BlocProvider(
                  create: (context) =>
                      CartCubit(CartRepoImpl())..getCartProducts()),
              BlocProvider(
                  create: (context) =>
                      FavCubit(getFavoritesRepo: GetFavoritesRepo())),
              BlocProvider(
                  create: (context) => AllAddressesCubit(AllAddressesRepoImpl())
                    ..getAllAddresses()),
              BlocProvider(
                  create: (context) =>
                      ShippingCompaniesCubit(ShippingCompaniesRepoImpl())),
              BlocProvider(
                  create: (context) =>
                      ShippingFeesCubit(ShippingCompaniesRepoImpl())),
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.transparent,
                appBarTheme: const AppBarTheme(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  elevation: 3,
                  shadowColor: Colors.black54,
                  iconTheme: IconThemeData(color: Colors.black),
                  toolbarTextStyle: TextStyle(color: Colors.black),
                ),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white12,
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ))),
                textTheme: const TextTheme(
                    // bodyMedium: TextStyle(fontSize: 15.sp,fontFamily: fontFamily),
                    ),
              ),
              routerConfig: AppRouter.router,
            ),
          );
        });
  }
}
