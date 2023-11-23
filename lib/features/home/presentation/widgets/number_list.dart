import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/shared/presentation/style/palette.dart';
import 'package:task/features/home/presentation/const/slider_configs.dart';

class NumberListWidget extends StatefulWidget {
  const NumberListWidget(
    this.oneUnit,
    this.value, {
    super.key,
  });

  final double oneUnit;
  final double? value;

  @override
  State<NumberListWidget> createState() => _NumberListWidgetState();
}

class _NumberListWidgetState extends State<NumberListWidget> {
  int? activeIndex;
  static final List<int> numbers = List.generate(10, (index) => index * 10 + 10);

  @override
  Widget build(BuildContext context) {
    List<int> list = numbers;
    int firstIndex = SliderConfigs.firstIndex;
    int lastIndex = SliderConfigs.lastIndex;

    return Container(
      width: 74.w,
      padding: EdgeInsets.only(left: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          18.verticalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: list.reversed
                .toList()
                .asMap()
                .map(
                  (i, n) => MapEntry(
                    i,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 5.h,
                          height: 5.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: n <= list[firstIndex] || n >= list[lastIndex] ? AppColors.yellow : Colors.transparent,
                          ),
                        ),
                        SizedBox(
                          height: 57.8.h,
                          child: Center(
                            child: Text(
                              "$n%",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w900,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        ],
      ),
    );
  }
}
