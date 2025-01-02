import '../data/enums/api_path.dart';
import '../data/network/api_endpoints.dart';
import '../data/network/base_api_services.dart';
import '../data/network/http_client.dart';
import '../models/weather_data_model.dart';
import '../utils/app_logger.dart';

class GetWeatherRepo {
  Future<WeatherDataModel?>? getWeatherData(String city) async {
    try {
      final response = await HttpClient.instance.get(
        ApiEndpoints.getValue(APIPath.getCityWeather),
        params: {
          "appid": BaseApiServices.weatherAppId,
          "units": "metric",
          "q": city
        },
        isCustomUrl: true,
        isToken: false,
      );
      appLog("Response - $response");

      return WeatherDataModel.fromJson(response);
    } catch (e) {
      return null;
    }
  }
}