import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mandoob/class/constant/colors.dart';
import 'package:mandoob/class/constant/const.dart';
import 'package:mandoob/class/services/services.dart';
import 'package:mandoob/view/doctor/screen/doctorlogin.dart';
import 'package:mandoob/view/doctor/screen/doctorsignup.dart';
import 'package:mandoob/view/mandoob/screen/mandoobsignup.dart';
import 'package:mandoob/view/widget/customcontainer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../class/constant/end_points.dart';
import '../class/constant/images.dart';
import 'doctor/screen/homescreen.dart';
import 'mandoob/screen/home_screen.dart';

class ChooseUser extends StatelessWidget {
  const ChooseUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri istagramLaunchUri = Uri(
      scheme: 'https',
      host: 'instagram.com',
      path: '/field_iq/',
    );
    final Uri facebookLaunchUri = Uri(
      scheme: 'https',
      host: 'facebook.com',
      path: '/Field-IQ-114608521573024/',
      query: 'com.facebook.katana',
    );
    final Uri auroraLaunchUri = Uri(
      scheme: 'https',
      host: 'facebook.com',
      path: '/100088333208255/',
      query: 'com.facebook.katana',
    );

    MyServices myServices = Get.find();
    return SafeArea(

      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                AppImages.backGround,
                fit: BoxFit.fill,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Image.asset(AppImages.logo),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 70),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomContainer(
                          backGround: AppColor.primaryColor,
                          text: 'SellsMan'.tr,
                          color: Colors.white,
                          iconData: Icons.person,
                          onTap: () {
                            kToken == 'noToken'
                                ? Get.offAll(() => MandoobSignUp())
                                : Get.offAll(() => HomeScreen());
                          },
                        ),
                        const Spacer(),
                        CustomContainer(
                          backGround: AppColor.secondaryColor,
                          text: 'Doctor'.tr,
                          color: AppColor.black,
                          iconData: Icons.medical_services,
                          onTap: () {
                            kDoctorToken != 'noToken'
                                ? Get.offAll(() => HomeScreenDoctor())
                                    : Get.offAll(() => DoctorSignUp());
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await launchUrl(istagramLaunchUri,
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.5),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/insta.png'),
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await launchUrl(facebookLaunchUri,
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.5),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/facebook.png'),
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 5,
              child: GestureDetector(
                onTap: ()async{
                  await launchUrl(auroraLaunchUri,
                      mode: LaunchMode.externalApplication);
                },
                child: Image.asset(
                    'assets/images/aurora logo.png',
                width: 190,
                  height: 100,
                ),
              ),
            ),
            Positioned(
              left: Get.width*.4,
              bottom: Get.width*.17,
              child:GestureDetector(
                onTap: ()async{
                  await launchUrl(auroraLaunchUri,
                      mode: LaunchMode.externalApplication,);
                },
                child: Text("Powered By :",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.75,
                    fontSize: 13.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
