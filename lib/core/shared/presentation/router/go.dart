part of 'index.dart';

class GO implements NavigationService {
  static final key = GlobalKey<NavigatorState>();

  static final BuildContext context = NavigationService.key.currentState!.context;
  static args(BuildContext context) => ModalRoute.of(context)?.settings.arguments;

  @override
  Future<void> to(String routeName, {dynamic arguments}) async {
    HapticFeedback.lightImpact();
    await NavigationService.key.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  @override
  toAndReplace(String routeName, {dynamic arguments}) async {
    HapticFeedback.lightImpact();

    await NavigationService.key.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  @override
  void back() async {
    HapticFeedback.lightImpact();

    NavigationService.key.currentState?.pop();
  }
}
