import 'package:flutter/material.dart';
import 'package:futurama_thrive/app/core/extensions/app_extension.dart';

MaterialColor primaryMaterialColor = const MaterialColor(
  0xFF5CC1CA,
  <int, Color>{
    50: Color(0x1F5CC1CA),
    100: Color(0x5F5CC1CA),
    200: Color(0x7F5CC1CA),
    300: Color(0x8F5CC1CA),
    400: Color(0x9F5CC1CA),
    500: Color(0xFF5CC1CA),
    600: Color(0xFF5CC1CA),
    700: Color(0xFF5CC1CA),
    800: Color(0xFF5CC1CA),
    900: Color(0xFF5CC1CA),
  },
);
Color colorPrimary = const Color(0xFF5CC1CA);
Color colorPrimaryDark = const Color(0xFF5CC1CA);
Color colorAccent = const Color(0xFF5CC1CA);
Color tabAppBarColor = const Color(0xFFFFFFFF);
Color tabBarIconColor = const Color(0xFFFFFFFF);
Color tabBarTextColor = const Color(0xFFFFFFFF);

Color colorTextPrimary = const Color(0xff666666);
Color colorTextBoldPrimary = const Color(0xff333333);
Color colorTextSecond = const Color(0xff999999);

TextStyle titleStyle = TextStyle(
  fontFamily: 'Roboto-Medium',
  fontSize: 25.sp,
  color: colorTextPrimary,
  fontWeight: FontWeight.w700,
  height: 1.2,
);

TextStyle textRegularMedium = TextStyle(
  fontFamily: 'Roboto-Medium',
  fontSize: 16.sp,
  color: colorTextPrimary,
  fontWeight: FontWeight.w500,
  height: 1.0,
);

TextStyle bodyTextStyle = TextStyle(
  fontFamily: 'Roboto-Medium',
  fontSize: 14.sp,
  color: colorTextPrimary,
  fontWeight: FontWeight.w500,
  height: 1.2,
);
