import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/core/shared/presentation/style/palette.dart';
import 'package:task/features/home/presentation/const/slider_configs.dart';
import 'package:task/features/home/presentation/state/slider_provider.dart';
import 'package:task/features/home/presentation/widgets/curved_line.dart';
import 'package:task/features/home/presentation/widgets/number_list.dart';
import 'package:task/features/home/presentation/widgets/slider_ball.dart';

class HomeSliderSide extends StatelessWidget {
  const HomeSliderSide({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraintes) {
      double maxHeight = constraintes.maxHeight;
      double oneUnit = maxHeight / 50.h;
      double? value = context.watch<SliderProvider>().transitionalValue;
      return Row(
        children: [
          NumberListWidget(oneUnit, value),
          SliderHandle(oneUnit),
        ],
      );
    });
  }
}

class SliderHandle extends StatefulWidget {
  const SliderHandle(
    this.oneUnit, {
    super.key,
  });
  final double oneUnit;

  @override
  State<SliderHandle> createState() => _SliderHandleState();
}

class _SliderHandleState extends State<SliderHandle> {
  double? dy = 1.sh - kToolbarHeight - kBottomNavigationBarHeight - 300.h;
  double diameter = 44.r;

  late double _min;
  double? _max;

  void handleDrag(details) {
    double? newDy = (details.globalPosition.dy - diameter).clamp(_min, _max);

    if (dy != newDy) {
      setState(() {
        context.read<SliderProvider>().updateTrasitionalValue(_calculateHumidity(newDy));
        dy = newDy;
      });
    }
  }

  late double Function(double?) _calculateHumidity;

  @override
  void initState() {
    super.initState();

    double fontSizeShift = 9.sp;

    double paddingTop = widget.oneUnit * SliderConfigs.topPadding + fontSizeShift;
    double paddingBottom = widget.oneUnit * SliderConfigs.bottomPadding + fontSizeShift;
    double height = widget.oneUnit * 72.h;
    double body = height - paddingTop - paddingBottom;
    int stepsCount = SliderConfigs.list.length;
    double stepHeight = body / (stepsCount - 1);
    var disacitvatedTopPart = stepHeight * (stepsCount - SliderConfigs.lastIndex - 1);

    _calculateHumidity = (newDy) {
      final double percentage = 1 - (newDy! - _min) / (stepHeight * 5);

      int activeCapacity = SliderConfigs.list[SliderConfigs.lastIndex] - SliderConfigs.list[SliderConfigs.firstIndex];

      return percentage * activeCapacity + SliderConfigs.list[SliderConfigs.firstIndex];
    };

    _min = disacitvatedTopPart + paddingTop;
    _max = 1.sh - kToolbarHeight - kBottomNavigationBarHeight - 120.h;
    log('min: $_min, max: $_max');
  }

  @override
  Widget build(BuildContext context) {
    var centerY = dy! - diameter;
    return SizedBox(
      width: 96.w,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 16.w,
            right: 42.w,
            child: CustomPaint(
              painter: LinesPainter(centerY),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 24.w,
            child: CurevedLine(
              y: centerY,
            ),
          ),
          Positioned(
            right: 0,
            left: 40.w,
            top: centerY,
            child: GestureDetector(
              onVerticalDragStart: handleDrag,
              onVerticalDragUpdate: handleDrag,
              onVerticalDragEnd: (_) => context.read<SliderProvider>().updateFinalValue(),
              child: const SliderBall(),
            ),
          ),
        ],
      ),
    );
  }
}

class LinesPainter extends CustomPainter {
  LinesPainter(this.centerY);
  final double centerY;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final linesCount = (SliderConfigs.list.length - 1) * 5 + 1;

    final paddingTop = SliderConfigs.topPadding * height / 100 + 9;
    final paddingBottom = SliderConfigs.bottomPadding * height / 100 + 9;

    final oneLineStep = (height - paddingTop - paddingBottom) / (linesCount - 1);
    var y = paddingTop;
    var path = Path();

    for (var i = 0; i < linesCount; i++) {
      bool isLong = i % 5 == 0;
      double startX = isLong ? 22.0 : 29.0;
      double endX = width;
      var fix = 23;
      var distanceTillCenter = (y - centerY - fix).abs();
      if (distanceTillCenter < 50) {
        double sin = distanceTillCenter / 50;
        double angle = math.asin(sin);
        double cos = math.cos(angle);
        double delta = 30 * cos * cos * 1.05;
        startX -= delta;
        endX -= delta;
      }

      path
        ..moveTo(startX, y)
        ..lineTo(endX, y);
      y += oneLineStep;
    }

    Paint paint = Paint()
      ..color = AppColors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5.r;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
