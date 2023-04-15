import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../class/component.dart';
import '../../../../class/constant/colors.dart';
import '../../../../class/services/services.dart';
import '../../../../controller/mandoob/user_controller.dart';
import '../../../doctor/widget/customrowlang.dart';
import '../mandooblogin.dart';
import '../settings_edit.dart';

class HomeSettingsPage extends GetView<UserController> {
  const HomeSettingsPage({Key? key}) : super(key: key);
  void launchWhatsApp() async {
    final Uri whatsappLaunchUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: '/9647822283347/',
      query: 'com.whatsapp',
    );
    await launchUrl(whatsappLaunchUri,mode: LaunchMode.externalApplication);
  }
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () async {
              MyServices service = Get.put(MyServices());
              await service.sharedPreferences.remove('mToken');
              Get.offAll(MandoobLogin());
            },
          )
        ],
        title: Text(
          'Settings'.tr,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: controller.obx(
        (user) {
          return Container(
            padding: EdgeInsets.all(Get.width * .02),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    width: Get.width,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => SettingsEdit());
                          },
                          child: Container(
                            height: 38,
                            width: 38,
                            decoration: const ShapeDecoration(
                                shape: CircleBorder(),
                                color: AppColor.secondaryColor),
                            child: SvgPicture.asset(
                                'assets/images/edit-text (1).svg',
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * .25,
                        ),
                      ],
                    ),
                  ),
                  ReservationDetailsRow(
                    value: user?.name ?? '',
                    title: 'Name',
                    circleColor: AppColor.secondaryColor,
                  ),
                  ReservationDetailsRow(
                    value: user?.phone ?? '',
                    title: 'Phone Number',
                    circleColor: AppColor.secondaryColor,
                  ),
                  ReservationDetailsRow(
                    value: user?.company ?? '',
                    title: 'Company Name',
                    circleColor: AppColor.secondaryColor,
                  ),
                  ReservationDetailsRow(
                    value: user?.balance.toString() ?? '',
                    title: 'Wallet Balance',
                    circleColor: AppColor.secondaryColor,
                  ),
                  ReservationDetailsRow(
                    value: user?.cityName ?? '',
                    title: 'Governorate',
                    circleColor: AppColor.secondaryColor,
                  ),
                  ReservationDetailsRow(
                    value: user?.officeName ?? '',
                    title: 'Science Office Name',
                    circleColor: AppColor.secondaryColor,
                  ),
                  ReservationDetailsRow(
                    value: user?.names ?? '',
                    title: 'sub\'s name',
                    circleColor: AppColor.secondaryColor,
                  ),
                  const SettingsLanguageChanger(),
                  GestureDetector(
                    onTap: () {
                      launchWhatsApp();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/whatsapp.svg'),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Text('Contact us in whatsapp'.tr),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0,),
                ],
              ),
            ),
          );
        },
        onLoading: SingleChildScrollView(
          child: Column(
            children: const [
              DoctorReservationDetailsRowShimmer(),
              DoctorReservationDetailsRowShimmer(),
              DoctorReservationDetailsRowShimmer(),
              DoctorReservationDetailsRowShimmer(),
              DoctorReservationDetailsRowShimmer(),
              DoctorReservationDetailsRowShimmer(),
            ],
          ),
        ),
      ),
    );
  }
}
