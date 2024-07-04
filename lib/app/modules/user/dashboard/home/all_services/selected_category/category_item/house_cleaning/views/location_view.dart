import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_brigadier/app/payment/stripe.dart';
import 'package:home_brigadier/consts/app_color.dart';
import 'package:home_brigadier/consts/static_data.dart';
import 'package:home_brigadier/generated/locales.g.dart';
import 'package:home_brigadier/model/post_booking_model.dart';
import 'package:home_brigadier/services/apis/toast.dart';
import 'package:home_brigadier/utils/style.dart';
import 'package:home_brigadier/widget/cText.dart';
import 'package:home_brigadier/widget/c_text_field.dart';

import '../../../../../../../../../../widget/c_filled_btn.dart';
import '../../../../../../../../email_login/views/email_login_view.dart';
import '../controllers/booking_controller.dart';

class LocationView extends GetView<BookingController> {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Get.put(PaymentController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text(LocaleKeys.location_view_items_Location_address_view.tr,
              style: appbar)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.025),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.20,
                child: Obx(() {
                  return GoogleMap(
                    myLocationEnabled: true,
                    markers: Set<Marker>.of(controller.mapMarker),
                    onMapCreated: (googleMapController) {
                      controller.mapController = googleMapController;
                    },
                    initialCameraPosition: CameraPosition(
                      target: controller.latLng.value,
                      zoom: 10.0,
                    ),
                    onTap: (LatLng location) {
                      print("Tapped location: $location");
                    },
                  );
                }),
              ),
              SizedBox(height: height * 0.02),
              Container(
                width: width / 6,
                height: height * 0.0075,
                decoration: BoxDecoration(
                    color: AppColor.greylight,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(height: height * 0.01),
              CText(
                text: LocaleKeys.location_view_items_location_details.tr,
                fontWeight: FontWeight.w600,
                fontsize: width * 0.05,
              ),
              SizedBox(height: height * 0.015),
              Align(
                alignment: Alignment.topLeft,
                child: CText(
                  text: LocaleKeys.location_view_items_address.tr,
                  fontWeight: FontWeight.w600,
                  fontsize: width * 0.04,
                ),
              ),
              SizedBox(height: height * 0.015),
              CTextField(
                hint: "Enter address",
                controller: controller.addressController,
                borderColor: Colors.transparent,
                borderRadius: 12,
                filled: true,
                suffix:
                    const Icon(Icons.location_pin, color: AppColor.secondary),
                onChanged: (newQuery) =>
                    controller.onPlaceQueryChanged(newQuery),
                keyboardType: TextInputType.text,
                fillColor: Colors.grey.withOpacity(0.1),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.required_field.tr;
                  }

                  return null;
                },
              ),
              Obx(() {
                if (controller.placePredictions.isEmpty) {
                  return const SizedBox.shrink();
                } else {
                  return Container(
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.placePredictions.length,
                      itemBuilder: (context, index) {
                        final prediction = controller.placePredictions[index];
                        return ListTile(
                          title: Text(
                              prediction.structuredFormatting?.mainText ??
                                  prediction.description ??
                                  ''),
                          subtitle: Text(
                              prediction.structuredFormatting?.secondaryText ??
                                  ''),
                          onTap: () async {
                            controller.addressController.text =
                                prediction.description ?? '';
                            controller.placePredictions.clear();
                            FocusScope.of(context).unfocus();
                          },
                        );
                      },
                    ),
                  );
                }
              }),
              SizedBox(height: height * 0.015),
              Align(
                alignment: Alignment.topLeft,
                child: CText(
                  text: LocaleKeys.flat_number.tr,
                  fontWeight: FontWeight.w600,
                  fontsize: width * 0.04,
                ),
              ),
              SizedBox(height: height * 0.015),
              CTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.required_field.tr;
                  }
                  return null;
                },
                contentPadding: 15,
                hint: LocaleKeys.start_earning_item_villa_number.tr,
                controller: controller.flat,
                borderColor: Colors.transparent,
                borderRadius: 12,
                filled: true,
                keyboardType: TextInputType.text,
                fillColor: Colors.grey.withOpacity(0.1),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          border: Border(
            top: BorderSide(
              color: AppColor.greylight,
            ),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
          child: CButton(
            fontsize: 16,
            text:
                "${LocaleKeys.location_view_items_continue_button.tr} ${controller.total.value} AED",
            shadow: true,
            borderradius: width * 0.075,
            fontWeight: bold6,
            ontab: () {
              if (controller.formKey.currentState!.validate()) {
                if (StaticData.refreshToken.isNotEmpty) {
                  PostBookingModel model = PostBookingModel(
                    price: controller.total.toString(),
                    startAt: controller.stardatetime,
                    endAt: controller.enddatetime,
                    address:
                        "${controller.addressController.text} ${controller.flat.text} ",
                    location: controller.currentPosition.toString(),
                    description: controller.instruction.text.isEmpty
                        ? ""
                        : controller.instruction.text,
                    serviceId: controller.servicemodel!.id!,
                    extraInfo: ExtraInfo(
                        cleaningFrequency:
                            controller.selectedweekplan.toString(),
                        isCheckedMaterialsNeeded:
                            controller.selectedmaterial.value,
                        noOfCleaners: controller.cleaner.string,
                        noOfHours: controller.hours.toString(),
                        selectedDaysOfWeek: []),
                  );

                  controller.postBooking(model, context);
                } else {
                  showSnackBar(LocaleKeys.snack_bars_login_then_booking.tr);
                  Get.to(() => const EmailLoginView());
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
