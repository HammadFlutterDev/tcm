// Location provider that fetches the current location
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:tcm/models/location_data_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tcm/models/weather_data_model.dart';
import 'package:tcm/repository/get_weather_repo.dart';


import '../data/network/api_response.dart';
import '../utils/helper.dart';

class GetCurrentLocation extends ChangeNotifier {
   LocationData currentLocation = LocationData(latitude: 0.0, longitude: 0.0, placeName: "-----------", cityName: "-------");
 final GetWeatherRepo weatherRepo = GetWeatherRepo();
 late ApiResponse<WeatherDataModel> apiResponse = ApiResponse();
  

  Future<void> checkLocationPermission() async {
    try {
      var status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        final position = await _getLocation();
        if (position != null) {
          final place = await getAddressFromLatLong(
              position.latitude, position.longitude);
          if (place != null) {
            currentLocation = LocationData(
                latitude: position.latitude,
                longitude: position.longitude,
                placeName:"${place.name  ?? ""}, ${ place.subLocality}",
                cityName: place.locality ?? "");
            if(currentLocation.placeName != ""){
              fetchWeatherOfCity(currentLocation.cityName);
            }
            
          }
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Position?> _getLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return await Geolocator.getCurrentPosition();
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.unableToDetermine) {
          return null;
        }
      }

      return await Geolocator.getCurrentPosition();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Placemark?> getAddressFromLatLong(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        return place;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  Future fetchWeatherOfCity(String city) async {
    try {
      apiResponse = ApiResponse.loading('loading... ');
      notifyListeners();
      final response = await weatherRepo.getWeatherData(city);
      if (response != null) {
        apiResponse = ApiResponse.completed(response);
      } else {
        apiResponse = ApiResponse.error("Something went wrong!");
      }
      notifyListeners();
    } catch (e) {
      apiResponse =
          ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
      notifyListeners();
     
    }
  }
}

final currentLocationProvider =
    ChangeNotifierProvider<GetCurrentLocation>((ref) => GetCurrentLocation());
