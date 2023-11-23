import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/shared/presentation/const/assets.dart';
import 'package:task/core/shared/presentation/style/palette.dart';

abstract final class AppTextStyle {
  AppTextStyle._();
  static TextStyle appBar = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontFamily: AppAssets.fonts.worksans,
  );
  static TextStyle title = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppAssets.fonts.worksans,
  );
  static TextStyle subtitle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppAssets.fonts.worksans,
  );
  static TextStyle medium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppAssets.fonts.worksans,
  );
  static TextStyle paragraph = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppAssets.fonts.worksans,
  );
  static TextStyle body = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppAssets.fonts.worksans,
  );
  static TextStyle chipButton = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppAssets.fonts.worksans,
  );
  static TextStyle button = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontFamily: AppAssets.fonts.worksans,
  );
}
