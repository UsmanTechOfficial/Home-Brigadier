import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../model/place_autocomplete_model.dart';
import '../../modules/user/dashboard/home/views/location_pick.dart';

class GooglePlacesService extends GetxService {
  Future<List<AutocompletePrediction>> placeAutoComplete(String query) async {
    Uri uri =
        Uri.https("maps.googleapis.com", "maps/api/place/autocomplete/json", {
      "input": query,
      "key": apiKey,
    });
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response.body);
      return result.predictions ?? [];
    } else {
      throw Exception('Failed to load predictions');
    }
  }
}
