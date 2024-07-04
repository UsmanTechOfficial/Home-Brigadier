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
class SofaCleaningBookingView extends GetView<BookingController> {
  const SofaCleaningBookingView({super.key});

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
                  "Sofa Cleaning",
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
                          // CText(
                          //   text: LocaleKeys
                          //       .house_cleaning_items_how_many_hours.tr,
                          //   fontsize: titlelarge,
                          //   fontWeight: bold4,
                          // ),
                          // SizedBox(
                          //   height: height * 0.01,
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(bottom: height * 0.02),
                          //   child: Container(
                          //     width: widht,
                          //     height: height * 0.075,
                          //     decoration: BoxDecoration(
                          //         color: const Color(0xffF5F5F5),
                          //         borderRadius: BorderRadius.circular(8)),
                          //     child: Padding(
                          //       padding:
                          //           const EdgeInsets.only(left: 12, right: 12),
                          //       child: Row(
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: [
                          //           CText(
                          //             text: LocaleKeys
                          //                 .house_cleaning_items_hours.tr,
                          //             fontWeight: bold6,
                          //             fontsize: 16,
                          //           ),
                          //           const Spacer(),
                          //           InkWell(
                          //             onTap: () {
                          //               controller.hours_decrese();
                          //               controller.claculateBill();
                          //             },
                          //             child: Container(
                          //               width: widht * 0.1,
                          //               height: height * 0.055,
                          //               decoration: const BoxDecoration(
                          //                   color: Color(0xffF1E7FF),
                          //                   shape: BoxShape.circle),
                          //               child: const Center(
                          //                 child: Icon(
                          //                   Icons.remove,
                          //                   size: 16,
                          //                   color: AppColor.primary,
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             width: widht * 0.04,
                          //           ),
                          //           CText(
                          //             text: controller.hours.value.toString(),
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //           SizedBox(
                          //             width: widht * 0.04,
                          //           ),
                          //           InkWell(
                          //             onTap: () {
                          //               controller.hours.value++;
                          //               controller.claculateBill();
                          //             },
                          //             child: Container(
                          //               width: widht * 0.1,
                          //               height: height * 0.055,
                          //               decoration: const BoxDecoration(
                          //                   color: Color(0xffF1E7FF),
                          //                   shape: BoxShape.circle),
                          //               child: const Center(
                          //                 child: Icon(
                          //                   Icons.add,
                          //                   size: 16,
                          //                   color: AppColor.primary,
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: height * 0.01,
                          // ),
                          // CText(
                          //   text: LocaleKeys
                          //       .house_cleaning_items_how_many_cleaner.tr,
                          //   fontsize: titlelarge,
                          //   fontWeight: bold4,
                          // ),
                          // SizedBox(
                          //   height: height * 0.01,
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(bottom: height * 0.02),
                          //   child: Container(
                          //     width: widht,
                          //     height: height * 0.075,
                          //     decoration: BoxDecoration(
                          //         color: const Color(0xffF5F5F5),
                          //         borderRadius: BorderRadius.circular(8)),
                          //     child: Padding(
                          //       padding:
                          //           const EdgeInsets.only(left: 12, right: 12),
                          //       child: Row(
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: [
                          //           CText(
                          //             text: LocaleKeys
                          //                 .house_cleaning_items_cleaners.tr,
                          //             fontWeight: bold6,
                          //             fontsize: 16,
                          //           ),
                          //           const Spacer(),
                          //           InkWell(
                          //             onTap: () {
                          //               controller.cleaner_decrese();
                          //               controller.claculateBill();
                          //             },
                          //             child: Container(
                          //               width: widht * 0.1,
                          //               height: height * 0.055,
                          //               decoration: const BoxDecoration(
                          //                   color: Color(0xffF1E7FF),
                          //                   shape: BoxShape.circle),
                          //               child: const Center(
                          //                 child: Icon(
                          //                   Icons.remove,
                          //                   size: 16,
                          //                   color: AppColor.primary,
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             width: widht * 0.04,
                          //           ),
                          //           CText(
                          //             text: controller.cleaner.value.toString(),
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //           SizedBox(
                          //             width: widht * 0.04,
                          //           ),
                          //           InkWell(
                          //             onTap: () {
                          //               controller.cleaner.value++;
                          //               controller.claculateBill();
                          //             },
                          //             child: Container(
                          //               width: widht * 0.1,
                          //               height: height * 0.055,
                          //               decoration: const BoxDecoration(
                          //                   color: Color(0xffF1E7FF),
                          //                   shape: BoxShape.circle),
                          //               child: const Center(
                          //                 child: Icon(
                          //                   Icons.add,
                          //                   size: 16,
                          //                   color: AppColor.primary,
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // //
                          // SizedBox(
                          //   height: height * 0.01,
                          // ),

                          // SizedBox(
                          //   height: height * 0.01,
                          // ),

                          // SizedBox(
                          //   height: height * 0.01,
                          // ),
                          // CText(
                          //   text: 'Is your appartment furnished?',
                          //   fontsize: titlelarge,
                          //   fontWeight: bold4,
                          // ),
                          // SizedBox(
                          //   height: height * 0.01,
                          // ),

                          // SizedBox(
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       ChoiceChip(
                          //         label: CText(
                          //             color:
                          //                 controller.selectedmaterial.value ==
                          //                         'Yes'
                          //                     ? AppColor.white
                          //                     : AppColor.black,
                          //             text: LocaleKeys
                          //                 .house_cleaning_items_yes.tr),
                          //         selected: controller.selectedmaterial.value ==
                          //             'Yes',
                          //         onSelected: (bool selected) {
                          //           controller.selectMaterials('Yes');
                          //           // controller.claculateBill();
                          //         },
                          //         labelPadding: const EdgeInsets.symmetric(
                          //             horizontal: 20, vertical: 3),
                          //         backgroundColor: AppColor.white,
                          //         selectedColor: AppColor.secondary,
                          //         shape: StadiumBorder(
                          //             side: BorderSide(
                          //                 color: controller
                          //                             .selectedmaterial.value ==
                          //                         'Yes'
                          //                     ? AppColor.secondary
                          //                     : AppColor.secondary)),
                          //       ),
                          //       SizedBox(
                          //         width: widht * 0.05,
                          //       ),
                          //       ChoiceChip(
                          //         labelPadding: const EdgeInsets.symmetric(
                          //             horizontal: 20, vertical: 3),
                          //         backgroundColor: AppColor.white,
                          //         selectedColor: AppColor.secondary,
                          //         shape: StadiumBorder(
                          //             side: BorderSide(
                          //                 color: controller
                          //                             .selectedmaterial.value ==
                          //                         'No'
                          //                     ? AppColor.secondary
                          //                     : AppColor.secondary)),
                          //         label: CText(
                          //             color:
                          //                 controller.selectedmaterial.value ==
                          //                         'No'
                          //                     ? AppColor.white
                          //                     : AppColor.black,
                          //             text: LocaleKeys
                          //                 .house_cleaning_items_no.tr),
                          //         selected:
                          //             controller.selectedmaterial.value == 'No',
                          //         onSelected: (bool selected) {
                          //           controller.selectMaterials('No');
                          //           // controller.claculateBill();
                          //         },
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          // SizedBox(
                          //   height: height * 0.01,
                          // ),
                          CText(
                            text: "Which type of cleaning do you need?",
                            fontsize: titlelarge,
                            fontWeight: bold4,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Wrap(
                            spacing: 10,
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
                                    color: controller.sofacleaningtype.value ==
                                            'Shampoo Cleaning'
                                        ? AppColor.white
                                        : AppColor.black,
                                    text: "Shampoo Cleaning"),
                                selected: controller.sofacleaningtype.value ==
                                    'Shampoo Cleaning',
                                onSelected: (bool selected) {
                                  controller.selectSofacleaningCata(
                                      'Shampoo Cleaning');
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
                                    color: controller.sofacleaningtype.value ==
                                            'Steam Cleaning'
                                        ? AppColor.white
                                        : AppColor.black,
                                    text: "Steam Cleaning"),
                                selected: controller.sofacleaningtype.value ==
                                    'Steam Cleaning',
                                onSelected: (bool selected) {
                                  controller
                                      .selectSofacleaningCata('Steam Cleaning');
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
                            text: "What is the size of sofa?",
                            fontsize: titlelarge,
                            fontWeight: bold4,
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
                                    color: controller.sofasize.value ==
                                            'Single seat'
                                        ? AppColor.white
                                        : AppColor.black,
                                    text: "Single seat"),
                                selected:
                                    controller.sofasize.value == 'Single seat',
                                onSelected: (bool selected) {
                                  controller.selectSofasize('Single seat');
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
                                    color:
                                        controller.sofasize.value == '2 Seats'
                                            ? AppColor.white
                                            : AppColor.black,
                                    text: "2 Seats"),
                                selected:
                                    controller.sofasize.value == '2 Seats',
                                onSelected: (bool selected) {
                                  controller.selectSofasize('2 Seats');
                                },
                              ),
                              ChoiceChip(
                                labelPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                backgroundColor: AppColor.white,
                                selectedColor: AppColor.secondary,
                                shape: StadiumBorder(
                                    side: BorderSide(
                                        color: controller.sofasize.value ==
                                                '3 Seats'
                                            ? AppColor.secondary
                                            : AppColor.secondary)),
                                label: CText(
                                    color:
                                        controller.sofasize.value == '3 Seats'
                                            ? AppColor.white
                                            : AppColor.black,
                                    text: "3 Seats"),
                                selected:
                                    controller.sofasize.value == '3 Seats',
                                onSelected: (bool selected) {
                                  controller.selectSofasize('3 Seats');
                                },
                              ),
                              ChoiceChip(
                                labelPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                backgroundColor: AppColor.white,
                                selectedColor: AppColor.secondary,
                                shape: StadiumBorder(
                                    side: BorderSide(
                                        color: controller.sofasize.value ==
                                                '4 Seats or more'
                                            ? AppColor.secondary
                                            : AppColor.secondary)),
                                label: CText(
                                    color: controller.sofasize.value ==
                                            '4 Seats or more'
                                        ? AppColor.white
                                        : AppColor.black,
                                    text: "4 Seats or more"),
                                selected: controller.sofasize.value ==
                                    '4 Seats or more',
                                onSelected: (bool selected) {
                                  controller.selectSofasize('4 Seats or more');
                                },
                              ),
                            ],
                          ),

                          // SizedBox(
                          //   child: CText(
                          //       textAlign: TextAlign.start,
                          //       fontsize: titleSmall,
                          //       text: LocaleKeys
                          //           .house_cleaning_items_addditional_charges_aed
                          //           .tr),
                          // ),
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
    } else if (controller.sofacleaningtype.isEmpty) {
      showSnackBar("Please select cleaning type", true);
    } else if (controller.sofasize.value.isEmpty) {
      showSnackBar("Please select sofa size", true);
    } else if (controller.selectedmaterial.isEmpty) {
      showSnackBar("Please select service ", true);
    } else {
      Get.to(() => BookingDetailsView(
            model: BookingController.to.servicemodel,
          ));
    }
  }
}
