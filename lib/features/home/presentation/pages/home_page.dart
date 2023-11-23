import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/shared/presentation/style/palette.dart';
import 'package:task/features/home/presentation/pages/home_body.dart';
import 'package:task/features/home/presentation/state/slider_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderProvider(),
      child: const Scaffold(
        backgroundColor: AppColors.darkBlue,
        body: HomeBody(),
      ),
    );
  }
}
