import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/features/home/presentation/widgets/sides/info.dart';
import 'package:task/features/home/presentation/widgets/sides/slider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 170.w,
            child: const HomeSliderSide(),
          ),
          const Flexible(child: HomeInfoSide()),
        ],
      ),
    );
  }
}
