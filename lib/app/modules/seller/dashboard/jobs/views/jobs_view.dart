import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_brigadier/consts/media_query.dart';
import 'package:home_brigadier/generated/locales.g.dart';
import 'package:home_brigadier/widget/cText.dart';

import '../completed_jobs.dart';
import '../controllers/jobs_controller.dart';
import '../upcoming_jobs.dart';

class JobsView extends GetView<JobsController> {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(JobsController());
    final txtTheme = Theme.of(context).textTheme.titleMedium!.color;
    return GetBuilder<JobsController>(
        init: Get.put(JobsController()),
        builder: (builderContext) {
          return DefaultTabController(
              length: 2,
              child: Scaffold(
                  appBar: AppBar(
                      leading: Image.asset(
                        "assets/icons/ic_launcher_icon.png",
                      ),
                      title: CText(
                          text: LocaleKeys.dashboard_items_my_jobs.tr,
                          fontWeight: FontWeight.bold,
                          color: txtTheme,
                          fontsize: mediaQueryHeight(context) * 0.025),
                      bottom: TabBar(
                          physics: const ClampingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQueryWidth(context) * 0.05),
                          automaticIndicatorColorAdjustment: true,
                          indicatorWeight: 2,
                          tabs: const [
                            Tab(text: 'Upcoming'),
                            Tab(text: 'Completed'),
                          ])),
                  body: const TabBarView(children: [
                    UpcomingJobs(),
                    CompletedJobs(),
                  ])));
        });
  }
}
