import '../enums/api_path.dart';

class ApiEndpoints {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.getCityWeather:
      return "https://api.openweathermap.org/data/2.5/weather";
      default:
      return "";

    }
  }
}
