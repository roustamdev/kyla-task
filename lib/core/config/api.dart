class ApiConfig {
  ApiConfig._();
  static String baseUrl = "base_url";

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Paths paths = Paths();
}

class Paths {
  static const String examplePath = 'ExamplePath';
}
