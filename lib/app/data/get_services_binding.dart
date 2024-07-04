import 'package:get/get.dart';
import 'package:home_brigadier/app/data/get_services/google_places.dart';

class GetServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GooglePlacesService>(() => GooglePlacesService());
  }
}
