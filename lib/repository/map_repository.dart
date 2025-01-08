import '../data/enums/api_path.dart';
import '../data/network/api_endpoints.dart';
import '../data/network/http_client.dart';
import '../models/place_detail_model.dart';
import '../models/place_listing_model.dart';

class MapsRepository {

  Future<PlaceListingModel?> getPlaceListing(String input) async {
    try {
      var jsonData = await HttpClient.instance.get(
        "${ApiEndpoints.getValue(APIPath.googleMapApi)}place/autocomplete/json",
        params: {
          "input":input,
          "key": "AIzaSyCUrF7t8LjdeDSx8t94CIS_6xEwSE145hA",
          
        },
        isCustomUrl: true,
        isToken: false,
      
    );

    PlaceListingModel result = PlaceListingModel.fromJson(jsonData);

    return result;
    } catch (e) {
     return null;
    }
  }

  Future<PlaceDetailModel?> getPlaceDetails(String placeId) async {
    try {
        var jsonData = await HttpClient.instance.get(
        "${ApiEndpoints.getValue(APIPath.googleMapApi)}place/details/json",
        params: {
          "place_id" :placeId,
           "key": "AIzaSyCUrF7t8LjdeDSx8t94CIS_6xEwSE145hA",
          
        },
        isCustomUrl: true,
        isToken: false,
        
      );

      PlaceDetailModel result = PlaceDetailModel.fromJson(jsonData);

      return result;
    } catch (e) {
      return null;
    }
      
  }
}
