import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandoob/view/doctor/screen/interviews.dart';
import 'package:mandoob/view/doctor/screen/settingsdoctor.dart';
import 'package:mandoob/view/doctor/screen/waitinglistdoctor.dart';
import '../../../class/constant/colors.dart';
import '../../../controller/doctor/homesceencontroller.dart';
import 'finalinterviews.dart';
import 'hompagedoctor.dart';

class HomeScreenDoctor extends StatelessWidget {
  HomeScreenDoctor({Key? key}) : super(key: key);

  List body = const [
    HomePageDoctor(),
    WaitingListDoctor(),
    SettingsDoctor(),
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.secondaryColor,
            onPressed: () {
              Get.to(() => const InterviewsScreen());
            },
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 60,
            backgroundColor: Colors.transparent,
            index: controller.currentPage,
            color: AppColor.primaryColor,
            items: <Widget>[
              SizedBox(
                width: 45,
                height: 45,
                child: FittedBox(
                  child: GetBuilder<HomeScreenController>(builder: (controller) {
                    return Column(
                      children: [
                        const Icon(
                          Icons.home,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text(
                          'Home'.tr,
                          style: const TextStyle(
                              fontSize: 11.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(
                width: 45,
                height: 45,
                child: FittedBox(
                  child: GetBuilder<HomeScreenController>(builder: (controller) {
                    return Column(
                      children: [
                        const Icon(
                          Icons.list_alt_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text(
                          'Waiting List'.tr,
                          style: const TextStyle(
                              fontSize: 11.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(
                width: 45,
                height: 45,
                child: FittedBox(
                  child: GetBuilder<HomeScreenController>(builder: (controller) {
                    return Column(
                      children: [
                        const Icon(
                          Icons.settings,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text(
                          'Setting'.tr,
                          style: const TextStyle(
                              fontSize: 11.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
            onTap: (newIndex) {
              controller.changeScreen(newIndex);
              controller.update();
            },
          ),
          body: body.elementAt(controller.currentPage),
        ),
      ),
    );
  }
}
