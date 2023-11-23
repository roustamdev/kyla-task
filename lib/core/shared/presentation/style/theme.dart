import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/core/shared/presentation/const/assets.dart';
import 'package:task/core/shared/presentation/style/palette.dart';

class AppThemeData {
  static SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: AppColors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.primarySwatch,
    systemNavigationBarDividerColor: AppColors.primarySwatch,
  );
  static SystemUiOverlayStyle systemUiOverlayStyleLight = SystemUiOverlayStyle.light.copyWith(
    statusBarColor: AppColors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.primary,
    systemNavigationBarDividerColor: AppColors.transparent,
  );
  static ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: AppAssets.fonts.worksans,
    scaffoldBackgroundColor: AppColors.background,
    dialogBackgroundColor: AppColors.background,
    applyElevationOverlayColor: true,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.background,
      indicatorColor: AppColors.primary,
      surfaceTintColor: AppColors.background,
      labelTextStyle: MaterialStateProperty.all(const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColors.primary),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        overlayColor: MaterialStateProperty.all(AppColors.primarySwatch.withOpacity(0.1)),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      surfaceTintColor: AppColors.background,
      color: AppColors.background,
      iconTheme: IconThemeData(color: AppColors.primary),
      toolbarTextStyle: TextStyle(
        color: AppColors.primary,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primarySwatch,
    )
        .copyWith(
          background: AppColors.background,
        )
        .copyWith(background: AppColors.background),
  );
}
