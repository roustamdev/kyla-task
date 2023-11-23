import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/app/di/index.dart';
import 'package:task/app/task.dart';
import 'package:task/core/shared/presentation/style/palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DependencyInjection.setup();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: AppColors.background,
    systemNavigationBarColor: AppColors.background,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(const TaskApp());
}
