import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandoob/controller/doctor/editsettingdoctorcontroller.dart';
import 'package:mandoob/view/doctor/screen/homescreen.dart';
import 'package:toast/toast.dart';
import '../../../class/constant/colors.dart';
import '../../../class/constant/const.dart';
import '../../../class/services/services.dart';
import '../../../controller/mandoob/api_controller.dart';
import '../../../models/doctor/doctorprofile/DoctorProfileModel.dart';
import '../../splashscreen.dart';
import '../widget/customrowgoveditsetting.dart';
import '../widget/customrowimageeditsetting.dart';
import '../widget/customrowlang.dart';
import '../widget/customsettingdeleteimage.dart';
import '../widget/custoombutton.dart';
import '../widget/customroweditsetting.dart';
import 'dart:io';

class EditSettingDoctor extends StatelessWidget {
  final DoctorProfileModel doctorProfileModel;

  EditSettingDoctor({Key? key, required this.doctorProfileModel})
      : super(key: key);

  XFile? imagesID;

  @override
  Widget build(BuildContext context) {
    Get.put(EditSettingDoctorController());

    ToastContext().init(context);
    void showToast(String msg, {int? duration, int? gravity}) {
      Toast.show(msg, duration: duration, gravity: gravity);
    }

    bool isDelete = false;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5.0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.primaryColor,
              size: 20.0,
            ),
          ),
          title: Text(
            'Settings'.tr,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<EditSettingDoctorController>(
          builder: (controller) => Form(
            key: controller.formState,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListView(
                children: [
                  CustomRowEditSetting(
                    hintText: doctorProfileModel.fullName,
                    myController: controller.name,
                    text: 'Name'.tr,
                  ),
                  CustomRowEditSetting(
                    hintText: 'Password'.tr,
                    myController: controller.password,
                    text: 'Password'.tr,
                    iconData: Icons.remove_red_eye,
                    obscureText: controller.isShowPassword,
                    onTap: () {
                      controller.showPassword();
                    },
                  ),
                  CustomRowEditSetting(
                    hintText: doctorProfileModel.phone,
                    myController: controller.phone,
                    text: 'Phone'.tr,
                    isNumber: true,
                    isNumberPhone: true,
                  ),
                  CustomRowEditSetting(
                    hintText: doctorProfileModel.specialization,
                    myController: controller.specialization,
                    text: 'Specialization'.tr,
                  ),
                  const CustomRowGovEditSetting(),
                  isDelete == false
                      ? CustomRowImageEditSetting(
                          text: 'Clinic Certificate'.tr,
                          onTap: () {
                            // showToast("Clinic Certificate is required".tr, gravity: Toast.bottom, duration: 7);
                            isDelete = true;
                            controller.update();
                          },
                          urlImage: doctorProfileModel.image,
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 25),
                          child: Row(
                            children: [
                              Container(
                                width: 13,
                                height: 13,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.secondaryColor),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  'Clinic Certificate'.tr,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                              const Spacer(),
                              imagesID == null
                                  ? InkWell(
                                      onTap: () async {
                                        imagesID = await controller
                                            .selectMultipleImageID();
                                        controller.update();
                                      },
                                      child: Container(
                                          width: 228,
                                          height: 134,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: AppColor.hintText)),
                                          child: const Icon(
                                            Icons.add_a_photo,
                                            color: AppColor.primaryColor,
                                            size: 32,
                                          )),
                                    )
                                  : SizedBox(
                                      width: 228,
                                      height: 134,
                                      child: Image.file(
                                        File(controller.imagesID!.path),
                                      ))
                            ],
                          ),
                        ),
                  CustomRowEditSetting(
                    hintText: doctorProfileModel.cvv,
                    myController: controller.cardNumber,
                    text: !isAcceptedByApple ? 'Card number':'Zain Wallet'.tr,
                    isNumber: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 20),
                    child: CustomButton(
                      text: 'Delete Account'.tr,
                      onTap: () {
                        controller.isLoading.value = true;
                        controller.update();
                        try {
                          DioHelper().deleteDoctorAccount().then((value) async {
                            controller.isLoading.value = false;
                            controller.update();
                            Get.snackbar(
                                'Done', 'Account deleted Successfully');
                            Get.offAll(SplashScreen());
                            MyServices service = Get.put(MyServices());
                            kDoctorToken = 'noToken';
                            await service.sharedPreferences.remove('mToken');
                            await FirebaseMessaging.instance
                                .unsubscribeFromTopic(user.name);
                          }, onError: (error) {
                            controller.isLoading.value = false;
                            controller.update();
                            print(error.toString());
                            Get.snackbar(
                              'Ops',
                              'Please Check your connection',
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.5),
                            );
                          });
                        } on DioError catch (error) {
                          print(error.message);
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 20),
                    child: CustomButton(
                      text: 'Save'.tr,
                      onTap: () {
                        controller.updateProfile(
                          doctorProfileModel.fullName,
                          '+964${doctorProfileModel.phone}',
                          doctorProfileModel.specialization,
                          '',
                          doctorProfileModel.cvv,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
