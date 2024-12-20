import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../services/shared_preferences.dart';

// import '../../utils/helper.dart';
import 'api_exceptions.dart';
import 'base_api_services.dart';

class HttpClient extends BaseApiServices {
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;
  @override
  Future delete(
    String url,
    body, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool isToken = true,
    bool isBaseUrl = true,
    bool isJsonEncode = true,
  }) async {
    dynamic responseJson;

    var customUrl = isBaseUrl ? BaseApiServices.baseURL : "";
    var uri =
        customUrl + url + ((params != null) ? queryParameters(params) : "");
    var parsedUrl = Uri.parse(uri);
    if (kDebugMode) {
      print(parsedUrl);
    }

    try {
      final response = await http
          .delete(
            parsedUrl,
            body: isJsonEncode ? jsonEncode(body) : body,
            headers: this.headers(headers, isToken),
          )
          .timeout(
            const Duration(seconds: 35),
          );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw _socketError();
    }
    return responseJson;
  }

  @override
  Future get(
    String url, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool isToken = true,
    bool isBaseUrl = true,
    bool isCustomUrl = false,
  }) async {
    dynamic responseJson;
    String uri;
    if (isCustomUrl) {
      uri = url + ((params != null) ? queryParameters(params) : "");
    } else {
      var customUrl = isBaseUrl ? BaseApiServices.baseURL : "";
      uri = customUrl + url + ((params != null) ? queryParameters(params) : "");
    }
    var parsedUrl = Uri.parse(uri);
    if (kDebugMode) {
      print(parsedUrl);
    }

    try {
      final response = await http
          .get(
            parsedUrl,
            headers: this.headers(headers, isToken),
          )
          .timeout(
            const Duration(seconds: 35),
            // onTimeout: (){
            //   responseJson = null;
            //   return  responseJson;
            // }
          );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw _socketError();
    }

    return responseJson;
  }

  @override
  Future post(
    String url,
    body, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool isToken = true,
    bool isBaseUrl = true,
    bool isJsonEncode = true,
  }) async {
    dynamic responseJson;

    var customUrl = isBaseUrl ? BaseApiServices.baseURL : "";
    var uri =
        customUrl + url + ((params != null) ? queryParameters(params) : "");
    var parsedUrl = Uri.parse(uri);
    if (kDebugMode) {
      print(parsedUrl);
    }

    try {
      final response = await http
          .post(
            parsedUrl,
            body: isJsonEncode ? jsonEncode(body) : body,
            headers: this.headers(headers, isToken),
          )
          .timeout(
            const Duration(seconds: 35),
          );

      responseJson = _returnResponse(response);
      if (kDebugMode) {
        print(response);
      }
    } on SocketException {
      throw _socketError();
    }

    return responseJson;
  }

  @override
  Future put(
    String url,
    body, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool isToken = true,
    bool isBaseUrl = true,
    bool isJsonEncode = true,
  }) async {
    dynamic responseJson;

    var customUrl = isBaseUrl ? BaseApiServices.baseURL : "";
    var uri =
        customUrl + url + ((params != null) ? queryParameters(params) : "");
    var parsedUrl = Uri.parse(uri);
    if (kDebugMode) {
      print(parsedUrl);
    }

    try {
      final response = await http
          .put(
            parsedUrl,
            body: isJsonEncode ? jsonEncode(body) : body,
            headers: this.headers(headers, isToken),
          )
          .timeout(
            const Duration(seconds: 35),
          );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw _socketError();
    }
    return responseJson;
  }

  @override
  Future patch(
    String url,
    body, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool isToken = true,
    bool isBaseUrl = true,
    bool isJsonEncode = true,
  }) async {
    dynamic responseJson;

    var customUrl = isBaseUrl ? BaseApiServices.baseURL : "";
    var uri =
        customUrl + url + ((params != null) ? queryParameters(params) : "");
    var parsedUrl = Uri.parse(uri);
    if (kDebugMode) {
      print(parsedUrl);
    }

    try {
      final response = await http
          .patch(
            parsedUrl,
            body: isJsonEncode ? jsonEncode(body) : body,
            headers: this.headers(headers, isToken),
          )
          .timeout(
            const Duration(seconds: 35),
          );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw _socketError();
    }
    return responseJson;
  }

  // Customs headers would append here or return the default values
  Map<String, String> headers(Map<String, String>? headers, bool isToken) {
    var header = {
      HttpHeaders.contentTypeHeader: 'application/json ',
      HttpHeaders.acceptHeader: 'application/json',
    };

    if (isToken) {
      if (SharedPreferenceManager.sharedInstance.hasToken()) {
        header.putIfAbsent(
          "Authorization",
          () => "${SharedPreferenceManager.sharedInstance.getToken()}",
        );
      }
    }

    if (headers != null) {
      header.addAll(headers);
    }
    return header;
  }

  // Query Parameters
  String queryParameters(Map<String, dynamic>? params) {
    if (params != null) {
      final jsonString = Uri(
          queryParameters:
              params.map((key, value) => MapEntry(key, value.toString())));
      return '?${jsonString.query}';
    }
    return '';
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 203:
        var utf8Format = utf8.decode(response.bodyBytes);
        var responseJson = jsonDecode(utf8Format);
        return responseJson;
      case 400:
        // Helper.showMessage(json.decode(response.body.toString())['error'] ??
        //     "Something went wrong!");
        throw BadRequestException(
            response.statusCode, response.body.toString());
      case 401:
        String msg = json.decode(response.body.toString())['error'] ??
            "Something went wrong!";
        // Helper.showMessage(msg);
        if (msg.toLowerCase().contains("invalid token")) {
          SharedPreferenceManager.instance.clear();
          
        } else if (SharedPreferenceManager.sharedInstance.getRefreshToken() !=
                null &&
            SharedPreferenceManager.sharedInstance.getRefreshToken() != "" &&
            !(msg.toLowerCase().contains("invalid token"))) {
          SharedPreferenceManager.sharedInstance.storeToken(
              SharedPreferenceManager.sharedInstance.getRefreshToken()!);
        
        }
        throw BadRequestException(
            response.statusCode, response.body.toString());
      case 403:
        // Helper.showMessage(json.decode(response.body.toString())['error'] ??
        //     "Something went wrong!");
        throw UnauthorisedException(
            response.statusCode, response.body.toString());
      case 404:
        // Helper.showMessage(json.decode(response.body.toString())['error'] ??
        //     "Something went wrong!");

        throw NotFoundRequestException(
            response.statusCode, response.body.toString());
      case 408:
        // Helper.showMessage(json.decode(response.body.toString())['error'] ??
        //     "Something went wrong!");
        throw RequestTimeOutException(
            response.statusCode, response.body.toString());
      case 422:
        // Helper.showMessage(json.decode(response.body.toString())['error'] ??
        //     "Something went wrong!");
        throw UnprocessableContent(
            response.statusCode, response.body.toString());
      case 423:
        // Helper.showMessage(json.decode(response.body.toString())['error'] ??
        //     "Something went wrong!");
        throw UnauthorisedException(
            response.statusCode, response.body.toString());
      case 500:
        // Helper.showMessage("Something went wrong!");
        throw ServerException(response.statusCode, "Server Error");
      default:
        // Helper.showMessage("Something went wrong!");
        throw FetchDataException(response.statusCode, response.body.toString());
    }
  }

  SocketConnectionError _socketError() {
    // Helper.showMessage("No Internet Connection");
    return SocketConnectionError(
      800,
      json.encode({
        "message": "No Internet Connection",
      }),
    );
  }
}
