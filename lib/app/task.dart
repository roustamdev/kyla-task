import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/shared/presentation/router/index.dart';
import 'package:task/core/shared/presentation/router/navigation_service.dart';
import 'package:task/core/shared/presentation/style/theme.dart';
import 'package:task/features/home/presentation/pages/home_page.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: false,
      useInheritedMediaQuery: true,
      builder: (context, child) => child ?? const SizedBox(),
      child: MaterialApp(
        title: 'Task App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorKey: NavigationService.key,
        theme: AppThemeData.light,
        home: const HomePage(),
      ),
    );
  }
}
