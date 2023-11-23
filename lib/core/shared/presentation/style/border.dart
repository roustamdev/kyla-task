import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/shared/presentation/style/palette.dart';

class AppBorder {
  static RoundedRectangleBorder get alertBorder => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
        side: BorderSide(
          width: 1.w,
          color: AppColors.background,
        ),
      );
}
