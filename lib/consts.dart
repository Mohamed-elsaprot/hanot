import 'package:flutter/cupertino.dart';
import 'package:hanot/features/cart/view/cart_screen.dart';
import 'package:hanot/features/home/view/home.dart';
import 'package:hanot/features/my_orders/view/my_orders.dart';
import 'package:hanot/features/settings/view/settings_screen.dart';

import 'features/categories/categories_screen/view/categories.dart';

import 'features/check_out/check_out_screen/models/shipping_company/ShippingCompany.dart';


List<Widget> tabsList = [
  const Home(),
  const Categories(),
  const CartScreen(),
  const MyOrders(),
  const SettingsScreen(),
];
const String fontFamily = 'Noto Kufi Arabic';

List<ShippingCompany> constComList = [];

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}