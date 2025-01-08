import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcm/models/place_detail_model.dart';
import 'package:tcm/models/place_listing_model.dart';
import 'package:tcm/repository/map_repository.dart';

import '../data/network/api_response.dart';
import '../utils/helper.dart';

class GoogleMapAPIProvider extends ChangeNotifier {
  late ApiResponse<PlaceListingModel> placeListApiResponse = ApiResponse();
  late ApiResponse<PlaceDetailModel> placeDetailApiResponse = ApiResponse();
  final MapsRepository mapRepo = MapsRepository();

  Future searchPlace(String keyword) async {
    try {
      placeListApiResponse = ApiResponse.loading('loading... ');
      notifyListeners();
      final response = await mapRepo.getPlaceListing(keyword);
      if (response != null) {
        placeListApiResponse = ApiResponse.completed(response);
      } else {
        placeListApiResponse = ApiResponse.error("Something went wrong!");
      }
      notifyListeners();
    } catch (e) {
      placeListApiResponse =
          ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
      notifyListeners();
    }
  }

  Future<PlaceDetailModel?> getPlaceDetail(String placeId) async {
    try {
      placeDetailApiResponse = ApiResponse.loading('loading... ');
      // notifyListeners();
      final response = await mapRepo.getPlaceDetails(placeId);
      if (response != null) {
        placeDetailApiResponse = ApiResponse.completed(response);
        return placeDetailApiResponse.data;
      } else {
        placeDetailApiResponse = ApiResponse.error("Something went wrong!");
        return null;
      }
      // notifyListeners();
    } catch (e) {
      placeDetailApiResponse =
          ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
      return null;
      // notifyListeners();
    }
  }
}

final googleMapApiProvider = ChangeNotifierProvider<GoogleMapAPIProvider>(
  (ref) => GoogleMapAPIProvider(),
);
