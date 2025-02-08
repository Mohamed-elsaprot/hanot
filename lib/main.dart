import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hanot/core/services/version_handler.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/data/currency_repo/currency_repo.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/features/auth_screen/data/auth_repo_impl.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/cart/data/cart_repo/cart_repo_impl.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/data/all_addresses_repo_impl.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/manager/all_addresses_cubit.dart';
import 'package:hanot/features/favorites/manager/fav_cubit.dart';
import 'package:hanot/features/lang/data/lang_repo.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/features/navigation_screen/manager/navigation_screen_manager.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'core/design/router.dart';
import 'core/general_managers/currency_cubit/currency_cubit.dart';
import 'core/local_storage/secure_storage.dart';
import 'features/check_out/check_out_screen/data/shipping_companies_repo/shipping_companies_repo_impl.dart';
import 'features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_cubit.dart';
import 'features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_cubit.dart';
import 'features/favorites/data/repositories/get_favorites_repo.dart';
import 'features/home/data/home_data_repo_impl.dart';
import 'features/home/manager/home_cubit.dart';

// 33:D1:E1:B1:CA:18:08:A9:B3:44:0D:D9:D4:C8:C8:00:0C:B2:CF:30:77:5A:BD:60:20:E5:37:46:A4:A7:27:7A
// 6D:D8:10:A6:EC:4A:1B:B3:7C:04:60:9B:63:F8:13:85:24:ED:E5:FE:9A:46:AE:9F:C3:9A:7A:B7:D0:07:DF:9E
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SecureStorage.getVersion();
  await SecureStorage.getDeviceId();
  if(SecureStorage.deviceId==null){
    final devId = await MobileDeviceIdentifier().getDeviceId();
    SecureStorage.deviceId =  devId;
    devId==null? null : await SecureStorage.setDeviceId(devId);
  }

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
              BlocProvider(create: (context) => LangCubit(LangRepo())..checkUserLang()),
              BlocProvider(create: (context) => NavigationScreenCubit()),
              BlocProvider(create: (context) => AuthCubit(AuthRepoImpl())..checkToken()),
              BlocProvider(create: (context) => CartCubit(CartRepoImpl())..getCartProducts()),
              BlocProvider(create: (context) => FavCubit(getFavoritesRepo: GetFavoritesRepo())),
              BlocProvider(create: (context) => AllAddressesCubit(AllAddressesRepoImpl())),
              BlocProvider(create: (context) => ShippingCompaniesCubit(ShippingCompaniesRepoImpl())),
              BlocProvider(create: (context) => ShippingFeesCubit(ShippingCompaniesRepoImpl())),
              //------------
              BlocProvider(create: (context) => HomeCubit(HomeDataRepoImpl())),
              BlocProvider(create: (context) => CurrencyCubit(CurrencyRepo())..getDefaultCurrency()),

            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: ThemeData(
                scaffoldBackgroundColor: Styles.scaffoldColor,
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
              ),
              routerConfig: AppRouter.router,
            ),
          );
        });
  }
}
