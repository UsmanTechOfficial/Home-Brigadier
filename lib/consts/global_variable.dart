import 'package:get/get.dart';

import '../generated/locales.g.dart';
import '../model/user_services_models/my_services_resp_model.dart';

class GlobalVariable {
  static MyServicesRespModel serviceModel = MyServicesRespModel();
  static var label = LocaleKeys.dashboard_items_start_earning.obs;
}
