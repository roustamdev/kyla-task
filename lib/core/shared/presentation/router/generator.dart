part of 'index.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map<String, MaterialPageRoute Function(dynamic)> routes = {
      // Routes.login: (arguments) => RouteGenerator.route(LoginPage()),
    };

    final MaterialPageRoute Function(dynamic)? pageBuilder = routes[settings.name];
    if (pageBuilder != null) {
      return pageBuilder(settings.arguments);
    } else {
      return MaterialPageRoute(builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text("404"),
          ),
        );
      });
    }
  }

  static MaterialPageRoute route(Widget widget, {dynamic arguments}) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(arguments: arguments),
    );
  }
}
