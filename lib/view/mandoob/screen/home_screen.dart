import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../class/constant/colors.dart';
import '../../../controller/mandoob/home_screen_controller.dart';
import 'homepages/home_mian_page.dart';
import 'homepages/home_reservation_page.dart';
import 'homepages/home_settings_page.dart';


class HomeScreen extends StatelessWidget {

  List body = const [
    HomeMainPage(),
    HomeReservationPage(),
    HomeSettingsPage(),

  ];

  @override
  Widget build(BuildContext context) {
     Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            height: 60,
            backgroundColor: Colors.transparent,
            index: controller.pageIndex.value,
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
                          Icons.settings,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text(
                          'Settings'.tr,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                          child: SvgPicture.asset('assets/images/file.svg', color: Colors.white,),
                        ),
                        Text(
                          'list'.tr,
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
            ],
            onTap: (newIndex) {
              controller.changePage(newIndex);
            },
          ),
          body: controller.pages[controller.pageIndex.value],
        ),
      ),
    );
  }
}

