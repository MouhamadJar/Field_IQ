import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:mandoob/class/constant/const.dart';
import 'package:mandoob/class/dio.dart';
import 'package:mandoob/class/services/services.dart';
import 'package:mandoob/controller/doctor/settingpagedoctorcontroller.dart';
import 'package:mandoob/view/doctor/screen/editsettingdoctor.dart';
import '../../../class/constant/colors.dart';
import '../../../class/constant/images.dart';
import '../../../models/doctor/doctorprofile/DoctorProfileModel.dart';
import '../../chooseuser.dart';
import '../widget/customimagesetting.dart';
import '../widget/customrowlang.dart';
import '../widget/customwaitinglistdetails.dart';
import 'finalinterviews.dart';

class SettingsDoctor extends GetView<SettingPageDoctorController> {
  const SettingsDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingPageDoctorController controller =
        Get.put(SettingPageDoctorController());
    MyServices myServices = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: () async {
                await myServices.sharedPreferences.remove('token');
                await FirebaseMessaging.instance.unsubscribeFromTopic(
                    controller.doctorID.toString());
                kDoctorToken = 'noToken';
                Get.offAll(ChooseUser());
              },
            )
          ],
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Get.to(() => const FinalInterviewsScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: SvgPicture.asset(
                AppImages.interviewIcon,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(
            'Settings'.tr,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: controller.obx(
          (data) => ListView(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => EditSettingDoctor(
                            doctorProfileModel: controller.profileModel,
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.secondaryColor),
                        child: const Icon(
                          Icons.edit,
                          color: AppColor.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        controller.textAvailable.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FlutterSwitch(
                        activeColor: AppColor.secondaryColor,
                        width: 75.0,
                        height: 30.0,
                        valueFontSize: 12.0,
                        toggleSize: 18.0,
                        value: controller.statusAvailable.value,
                        borderRadius: 20.0,
                        padding: 8.0,
                        showOnOff: true,
                        onToggle: (val) {
                          controller.setSelect(val);
                          print("++++++" + val.toString());
                          controller.changeAvailable();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              CustomWaitingListDetails(
                  text: 'Name'.tr, info: controller.profileModel.fullName),
              CustomWaitingListDetails(
                  text: 'Phone'.tr, info: controller.profileModel.phone),
              CustomWaitingListDetails(
                  text: 'Specialization'.tr,
                  info: controller.profileModel.specialization),
              CustomWaitingListDetails(
                  text: 'Governorate'.tr,
                  info: controller.profileModel.city.name),
              CustomImageSetting(
                text: 'Clinic Certificate'.tr,
                urlImage: controller.profileModel.image,
              ),
              CustomWaitingListDetails(
                  text: !isAcceptedByApple ? 'Card number' :'Zain Wallet'.tr, info: controller.profileModel.cvv),
              const SettingsLanguageChanger(),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
