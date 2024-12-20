abstract class BaseApiServices {
  //DEV URL
  //static String baseURL =   "http://192.168.18.145:8080/";
  //static String imageURL =  "http://192.168.18.145:8080";

  //Staging URL
  static String baseURL = "http://43.216.145.219:7000/";
  static String imageURL = "https://dealspot.s3.amazonaws.com";
  //LIVE URL
  // static String baseURL = "http://192.168.18.157:8080";
  // static String socketURL = "https://test.captals.com:299/notificationHub";

  // static String imageURL = "https://test.captals.com:299/";

  


  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool isToken = true,
    bool isBaseUrl = true,
  });

  Future<dynamic> post(
    String url,
    dynamic body, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool isToken = true,
    bool isBaseUrl = true,
    bool isJsonEncode = true,
  });

  Future<dynamic> put(
    String url,
    dynamic body, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool isToken = true,
    bool isBaseUrl = true,
    bool isJsonEncode = true,
  });

  Future<dynamic> patch(
    String url,
    dynamic body, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool isToken = true,
    bool isBaseUrl = true,
    bool isJsonEncode = true,
  });

  Future<dynamic> delete(
    String url,
    dynamic body, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool isToken = true,
    bool isBaseUrl = true,
    bool isJsonEncode = true,
  });
}
