import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/shared/presentation/style/palette.dart';

abstract class AppShadows {
  AppShadows._();
  static List<BoxShadow> defShadow = [
    BoxShadow(
      color: AppColors.primary.withOpacity(0.12),
      offset: const Offset(0, 4),
      blurRadius: 8.r,
    )
  ];
}
