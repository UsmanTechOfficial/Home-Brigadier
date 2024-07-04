import 'package:dio/dio.dart' as deo;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_brigadier/consts/global_variable.dart';
import 'package:home_brigadier/generated/locales.g.dart';

import '../../../../../consts/static_data.dart';
import '../../../../../services/apis/api_endpoints.dart';
import '../../../../../utils/isolate_manager.dart';
import '../../../user/dashboard/home/controllers/home_controller.dart';
import '../jobs/views/jobs_view.dart';
import '../profile/views/profile_view.dart';
import '../services/views/services_view.dart';
import '../start_earning/views/start_earning_view.dart';

class SellerDashboardController extends GetxController {
  var a = Get.put(HomeController());
  deo.Dio dio = deo.Dio();

  /// bottomNavigationBar Index
  var currentIndex = 0.obs;
  IsolateManager isolateManager = IsolateManager();

  /// change bottomNavigationBar item
  void changePage(int index) {
    currentIndex.value = index;
    update();
  }

  @override
  void onInit() {
    isolateManager.isolateEntryPoint();
    IsolateManager.refreshToken();
    fetchServices();
    super.onInit();
  }

  void fetchServices() async {
    Dio dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer ${StaticData.accessToken}';

    try {
      var response = await dio.get(ApiEndpoints.BASEURL + ApiEndpoints.SERVICE);
      if (response.data.isNotEmpty) {
        GlobalVariable.label.value =
            LocaleKeys.dashboard_items_add_new_service;
        ;
      } else {
        GlobalVariable.label.value =
            LocaleKeys.dashboard_items_start_earning;
      }
    } catch (e) {
      // Handle error
      GlobalVariable.label.value = LocaleKeys.dashboard_items_start_earning;
    }
  }

  final List<Widget> pages = [
    const JobsView(),
    const StartEarningView(),
    const MyServicesView(),
    const SellerProfileView(),
  ];
}
