import 'package:flutter/material.dart';
import 'package:task/app/di/index.dart';

NavigationService navigator = injection.get<NavigationService>();

abstract class NavigationService {
  static final key = GlobalKey<NavigatorState>();
  static args(BuildContext context) => ModalRoute.of(context)?.settings.arguments;

  Future<void> to(String routeName, {dynamic arguments});
  Future<void> toAndReplace(String routeName, {dynamic arguments});
  void back();
}
