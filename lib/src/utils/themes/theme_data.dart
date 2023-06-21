import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class AppTheme {
  final light = ThemeData(
    primaryColor: AppColors.kPrimaryColor,
    primarySwatch: AppColors.kPrimarySwatch,
    scaffoldBackgroundColor: AppColors.kPrimaryColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: AppColors.kTitleTextColor,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.kTitleTextColor,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        color: AppColors.kWhiteColor,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        color: AppColors.kTitleTextColor,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.kWhiteColor,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    // fontFamily: 'Poppins',
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.kAccentColor,
    ),
  );

  static const textHeaderBoldBlack18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const textHeaderMediumBlack16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const textHeaderMediumBlack14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const textHeaderRegularBlack14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const textHeaderMediumBlack12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const textHeaderSemiBoldBlack14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const textHeaderSemiBoldBlack16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const textHeaderBoldBlack16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const textHeaderNonBoldBlack18 = TextStyle(
    fontSize: 18,
  );
  static const textNormalBlack16 = TextStyle(
    fontSize: 16,
  );
  static const textNormalBlack12 = TextStyle(
    fontSize: 12,
  );
  static const textBoldBlack14 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
}
