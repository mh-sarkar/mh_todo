import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimaryColor = Color(0xff3d439d);
  static const Color kAccentColor = Color(0xffff00f7);
  static const Color kBoxColor = Color(0xff110754);
  static const Color kTitleTextColor = Color(0xff9aacfb);
  static const Color kTextColor = Color(0xFF172331);
  static const Color kTextColorLite = Color(0xFF8C8FA5);
  static MaterialColor kPrimarySwatch = MaterialColor(0xff006747, swatch);

  static Map<int, Color> swatch = {
    50: kPrimaryColor.withOpacity(.1),
    100: kPrimaryColor.withOpacity(.2),
    200: kPrimaryColor.withOpacity(.3),
    300: kPrimaryColor.withOpacity(.4),
    400: kPrimaryColor.withOpacity(.5),
    500: kPrimaryColor.withOpacity(.6),
    600: kPrimaryColor.withOpacity(.7),
    700: kPrimaryColor.withOpacity(.8),
    800: kPrimaryColor.withOpacity(.9),
    900: kPrimaryColor.withOpacity(1),
  };

  static const Color kWhiteColor = Color(0xffffffff);
  static const Color kDarkBlueColor = Color(0xff1B253F);
  static const Color kRedColor = Color(0xffff0000);
  static const Color kVioletColor = Color(0xff5B82FD);
  static const Color kBluePasteColor = Color(0xff4FBCF5);
  static const Color kGreyColor = Colors.grey;
  static const Color kBlackColor = Colors.black;
  static const Color kMenuBgColor = Color(0xffCFE2DD);
  static const Color kAshColor = Color(0xffEBEBEB);
  static const Color kGreyDarkColor = Color(0xff737373);
  static const Color kMenuAdminColor = Color(0xff54D487);
  static const Color kCardBodyColor = Color(0xffE6F0ED);
  static const Color kTransparent = Colors.transparent;

  static Color kPrimaryWithOpacityColor2P =
  kPrimaryColor.withOpacity(0.02);
  static Color kPrimaryWithOpacityColor4P =
  kPrimaryColor.withOpacity(0.04);
  static Color kPrimaryWithOpacityColor5P =
  kPrimaryColor.withOpacity(0.05);
  static Color kPrimaryWithOpacityColor10P =
  kPrimaryColor.withOpacity(0.1);
  static Color kPrimaryWithOpacityColor20P =
  kPrimaryColor.withOpacity(0.2);

  static const Color kLightSilver = Color(0xffD9D9D9);
}