import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/core/shared/presentation/style/palette.dart';
import 'package:task/core/shared/presentation/style/text.dart';
import 'package:task/features/home/presentation/state/slider_provider.dart';

class HomeInfoSide extends StatelessWidget {
  const HomeInfoSide({super.key});

  @override
  Widget build(BuildContext context) {
    int? value = context.watch<SliderProvider>().finalValue;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        80.verticalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Return temperature',
              style: AppTextStyle.button.copyWith(
                color: AppColors.grey,
              ),
            ),
            8.verticalSpace,
            Text(
              '20℃',
              style: AppTextStyle.title.copyWith(
                fontSize: 24.sp,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            40.verticalSpace,
            Text(
              'Current humidity',
              style: AppTextStyle.button.copyWith(
                color: AppColors.grey,
              ),
            ),
            Row(
              children: [
                AnimatedLetter(
                  letter: value.toString()[0],
                ),
                AnimatedLetter(
                  letter: value.toString()[1],
                ),
                4.horizontalSpace,
                SizedBox(
                  child: Text(
                    '%',
                    style: AppTextStyle.button.copyWith(
                      fontSize: 80.sp,
                    ),
                  ),
                )
              ],
            ),
            40.verticalSpace,
            Text(
              'Absolute humidity',
              style: AppTextStyle.button.copyWith(
                color: AppColors.grey,
              ),
            ),
            8.verticalSpace,
            Text(
              '4gr/fg3',
              style: AppTextStyle.medium.copyWith(
                fontSize: 27.sp,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            40.verticalSpace,
            Icon(
              EneftyIcons.warning_2_outline,
              color: AppColors.yellow,
              size: 30.sp,
            ),
            12.verticalSpace,
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Container(
                      width: 5.h,
                      margin: EdgeInsets.only(bottom: 4.h),
                      height: 5.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.yellow,
                      ),
                    ),
                  ),
                  WidgetSpan(
                    child: 8.horizontalSpace,
                  ),
                  TextSpan(
                    text: '- extreme humidity levels.\nUse protection for set-points outside of 20%-55%',
                    style: AppTextStyle.body.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}

class AnimatedLetter extends StatefulWidget {
  const AnimatedLetter({super.key, this.letter});

  final String? letter;

  @override
  State<AnimatedLetter> createState() => _AnimatedLetterState();
}

class _AnimatedLetterState extends State<AnimatedLetter> with SingleTickerProviderStateMixin {
  AnimationController? controller;

  String? currentLetter;
  String? prevLetter;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    currentLetter = widget.letter;
    prevLetter = widget.letter;
    super.initState();
  }

  @override
  void didUpdateWidget(AnimatedLetter oldWidget) {
    if (widget.letter != oldWidget.letter) {
      setState(() {
        prevLetter = oldWidget.letter;
        currentLetter = widget.letter;
        controller!
          ..reset()
          ..forward();
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller!,
      builder: (_, __) {
        if (controller != null) {
          return Stack(
            children: [
              Transform.translate(
                offset: Offset(0, -controller!.value * 50),
                child: Opacity(
                  opacity: 1 - controller!.value,
                  child: Text(
                    prevLetter!,
                    textAlign: TextAlign.right,
                    style: AppTextStyle.appBar.copyWith(
                      fontSize: 80.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, 50 - controller!.value * 50),
                child: Opacity(
                  opacity: controller!.value,
                  child: Text(
                    currentLetter!,
                    style: AppTextStyle.appBar.copyWith(
                      fontSize: 80.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
