import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandoob/controller/doctor/doctorsignupcontroller.dart';
import 'package:mandoob/view/doctor/screen/doctorlogin.dart';
import '../../../class/constant/colors.dart';
import '../../../class/constant/images.dart';
import '../widget/customrowgov.dart';
import '../widget/customrowlang.dart';
import '../widget/customrowlogin.dart';
import 'dart:io';
import '../widget/customrowlogincard.dart';
import '../widget/custoombutton.dart';
import 'package:toast/toast.dart';

class DoctorSignUp extends StatelessWidget {
  DoctorSignUp({Key? key}) : super(key: key);

  final FocusNode passwordFocusNode = FocusNode();
  XFile? imagesID;

  @override
  Widget build(BuildContext context) {

    Get.put(DoctorSignUpController());
    ToastContext().init(context);
    void showToast(String msg, {int? duration, int? gravity}) {
      Toast.show(msg, duration: duration, gravity: gravity);
    }


    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
            body: Stack(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(AppImages.backgroundLogin, fit: BoxFit.fill)),
          GetBuilder<DoctorSignUpController>(
            builder: (controller) => Form(
              key: controller.formState,
              child: ListView(children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 52.0),
                      child: Center(
                        child: Text(
                          'Login'.tr,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    CustomRowLogin(
                      passwordFocusNode: passwordFocusNode,
                      myController: controller.name,
                      text: 'Name'.tr,
                      hintText: 'Name'.tr,
                      isUserName: true,
                    ),
                    CustomRowLogin(
                      passwordFocusNode: passwordFocusNode,
                      myController: controller.password,
                      text: 'Password'.tr,
                      hintText: 'Password'.tr,
                      isIcon: true,
                      iconData: Icons.remove_red_eye,
                      obscureText: controller.isShowPassword,
                      onTap: () {
                        controller.showPassword();
                      },
                    ),
                    CustomRowLogin(
                      myController: controller.phone,
                      text: 'Phone'.tr,
                      hintText: 'Phone'.tr,
                      isNumber: true,
                    ),
                    CustomRowLogin(
                      myController: controller.specialization,
                      text: 'Specialization'.tr,
                      hintText: 'Specialization'.tr,
                    ),
                    const CustomRowGov(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                    imagesID =
                                        await controller.selectMultipleImageID();
                                  },
                                  child: Container(
                                      width: 228,
                                      height: 134,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5),
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
                                    File(controller.imagesID.path),
                                  ))
                        ],
                      ),
                    ),
                    CustomRowLoginCard(
                      text: 'Zain Wallet'.tr,
                      myController: controller.cardNumber,
                    ),
                    const CustomRowLang(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: CustomButton(
                        text: 'Signup'.tr,
                        onTap: () {
                            if (controller.formState.currentState!.validate()) {
                            if (imagesID == null) {
                              showToast("Clinic Certificate is required".tr, gravity: Toast.bottom, duration: 7);
                            }
                            else{
                              controller.signUp();
                            }
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(()=> DoctorLogin());
                        },
                        child: const Text('Or Login',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor,
                        ),),),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ])),
      ),
    );
  }
}
