import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_brigadier/app/modules/user/dashboard/home/all_services/selected_category/category_item/house_cleaning/controllers/booking_controller.dart';
import 'package:home_brigadier/consts/app_color.dart';
import 'package:home_brigadier/generated/locales.g.dart';
import 'package:home_brigadier/services/apis/toast.dart';
import 'package:home_brigadier/utils/logger.dart';
import 'package:home_brigadier/utils/style.dart';
import 'package:home_brigadier/widget/cText.dart';
import 'package:home_brigadier/widget/c_filled_btn.dart';

import 'booking_details_view.dart';

// ignore: must_be_immutable
class DeepCleaningBookingView extends GetView<BookingController> {
  const DeepCleaningBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    // BookingController.to.claculateBill();

    final widht = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final titleSmall = Theme.of(context).textTheme.titleSmall!.fontSize;
    final titlelarge = Theme.of(context).textTheme.titleLarge!.fontSize;

    return PopScope(
      canPop: true,
      onPopInvoked: (val) {
        BookingController.to.clearONCleaningPageRemove();
      },
      child: GetBuilder(
        init: BookingController(),
        builder: (_) {
          return Scaffold(
              bottomNavigationBar: InkWell(
                child: Obx(
                  () => Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        border: Border(
                            top: BorderSide(
                          color: AppColor.greylight,
                        ))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30, bottom: 20, left: 20, right: 20),
                      child: CButton(
                          borderradius: widht * 0.075,
                          text:
                              "${LocaleKeys.house_cleaning_items_cont_button.tr} ${controller.total.value} AED ",
                          fontWeight: FontWeight.bold,
                          ontab: () {
                            _onContinue();
                          }),
                    ),
                  ),
                ),
              ),
              appBar: AppBar(
                title: Text(
                  "Deep Cleaning",
                  style: appbar,
                ),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  width: widht,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widht * 0.05, vertical: height * 0.025),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CText(
                            text: 'Is your appartment furnished?',
                            fontsize: titlelarge,
                            fontWeight: bold4,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ChoiceChip(
                                  label: CText(
                                      color:
                                          controller.selectedmaterial.value ==
                                                  'Yes'
                                              ? AppColor.white
                                              : AppColor.black,
                                      text: LocaleKeys
                                          .house_cleaning_items_yes.tr),
                                  selected: controller.selectedmaterial.value ==
                                      'Yes',
                                  onSelected: (bool selected) {
                                    controller.selectMaterials('Yes');
                                    // controller.claculateBill();
                                  },
                                  labelPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 3),
                                  backgroundColor: AppColor.white,
                                  selectedColor: AppColor.secondary,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: controller
                                                      .selectedmaterial.value ==
                                                  'Yes'
                                              ? AppColor.secondary
                                              : AppColor.secondary)),
                                ),
                                SizedBox(
                                  width: widht * 0.05,
                                ),
                                ChoiceChip(
                                  labelPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 3),
                                  backgroundColor: AppColor.white,
                                  selectedColor: AppColor.secondary,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: controller
                                                      .selectedmaterial.value ==
                                                  'No'
                                              ? AppColor.secondary
                                              : AppColor.secondary)),
                                  label: CText(
                                      color:
                                          controller.selectedmaterial.value ==
                                                  'No'
                                              ? AppColor.white
                                              : AppColor.black,
                                      text: LocaleKeys
                                          .house_cleaning_items_no.tr),
                                  selected:
                                      controller.selectedmaterial.value == 'No',
                                  onSelected: (bool selected) {
                                    controller.selectMaterials('No');
                                    // controller.claculateBill();
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          CText(
                            text: " Select Categories",
                            fontsize: titlelarge,
                            fontWeight: bold4,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Wrap(
                            children: [
                              ChoiceChip(
                                labelPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                backgroundColor: AppColor.white,
                                selectedColor: AppColor.secondary,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: AppColor.secondary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                label: CText(
                                    color: controller.deepcleaningtype.value ==
                                            'Simple Deep Cleaing'
                                        ? AppColor.white
                                        : AppColor.black,
                                    text: "Simple Deep Cleaing"),
                                selected: controller.deepcleaningtype.value ==
                                    'Simple Deep Cleaing',
                                onSelected: (bool selected) {
                                  controller.selectDeepcleaningCata(
                                      'Simple Deep Cleaing');
                                },
                              ),
                              ChoiceChip(
                                labelPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                backgroundColor: AppColor.white,
                                selectedColor: AppColor.secondary,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: AppColor.secondary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                label: CText(
                                    color: controller.deepcleaningtype.value ==
                                            'Steam Deep Cleaning'
                                        ? AppColor.white
                                        : AppColor.black,
                                    text: "Steam Deep Cleaning"),
                                selected: controller.deepcleaningtype.value ==
                                    'Steam Deep Cleaning',
                                onSelected: (bool selected) {
                                  controller.selectDeepcleaningCata(
                                      'Steam Deep Cleaning');
                                },
                              ),
                              SizedBox(
                                width: widht * 0.05,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          CText(
                            text: " Select Appartment & Villa",
                            fontsize: titlelarge,
                            fontWeight: bold4,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Wrap(
                            spacing: 12,
                            children: [
                              ChoiceChip(
                                labelPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                backgroundColor: AppColor.white,
                                selectedColor: AppColor.secondary,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: AppColor.secondary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                label: CText(
                                    color: controller.selectedweekplan.value ==
                                            'Studio'
                                        ? AppColor.white
                                        : AppColor.black,
                                    text: "Studio"),
                                selected: controller.selectedweekplan.value ==
                                    'Studio',
                                onSelected: (bool selected) {
                                  controller.selectWeekplan('Studio');
                                },
                              ),
                              ChoiceChip(
                                labelPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                backgroundColor: AppColor.white,
                                selectedColor: AppColor.secondary,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: AppColor.secondary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                label: CText(
                                    color: controller.selectedweekplan.value ==
                                            'Appartment'
                                        ? AppColor.white
                                        : AppColor.black,
                                    text: "Appartment"),
                                selected: controller.selectedweekplan.value ==
                                    'Appartment',
                                onSelected: (bool selected) {
                                  controller.selectWeekplan('Appartment');
                                },
                              ),
                              ChoiceChip(
                                labelPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                backgroundColor: AppColor.white,
                                selectedColor: AppColor.secondary,
                                shape: StadiumBorder(
                                    side: BorderSide(
                                        color:
                                            controller.selectedmaterial.value ==
                                                    'Villa'
                                                ? AppColor.secondary
                                                : AppColor.secondary)),
                                label: CText(
                                    color: controller.selectedweekplan.value ==
                                            'Villa'
                                        ? AppColor.white
                                        : AppColor.black,
                                    text: "Villa"),
                                selected: controller.selectedweekplan.value ==
                                    'Villa',
                                onSelected: (bool selected) {
                                  controller.selectWeekplan('Villa');
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          CText(
                            text: LocaleKeys
                                .house_cleaning_items_special_insutuction.tr,
                            textAlign: TextAlign.start,
                            fontsize: titlelarge,
                            fontWeight: bold4,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SizedBox(
                            height: height * 0.2,
                            width: widht,
                            child: TextField(
                                textInputAction: TextInputAction.done,
                                controller: controller.instruction,
                                maxLines: 10,
                                decoration: InputDecoration(
                                    hintText: LocaleKeys
                                        .house_cleaning_items_example_insutruction
                                        .tr,
                                    hintStyle: TextStyle(fontSize: titleSmall),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: const BorderSide(
                                            color: AppColor.secondary)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0)))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

  _onContinue() {
    if (controller.hours.value == 0) {
      logger.d(controller.hours.value);
      showSnackBar(LocaleKeys.snack_bars_select_hours.tr, true);
    } else if (controller.deepcleaningtype.isEmpty) {
      showSnackBar("Please select category", true);
    } else if (controller.selectedweekplan.value.isEmpty) {
      showSnackBar("Please select size", true);
    } else if (controller.selectedmaterial.isEmpty) {
      showSnackBar("Please select furnished category", true);
    } else {
      Get.to(() => BookingDetailsView(
            model: BookingController.to.servicemodel,
          ));
    }
  }
}
