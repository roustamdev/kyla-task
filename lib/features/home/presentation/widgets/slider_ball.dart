import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/shared/presentation/style/palette.dart';

class SliderBall extends StatelessWidget {
  const SliderBall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.lightGrey,
      ),
      height: 40.r,
      width: 40.r,
      alignment: Alignment.center,
      child: Icon(
        EneftyIcons.arrow_3_outline,
        color: AppColors.darkBlue,
        size: 20.sp,
      ),
    );
  }
}
