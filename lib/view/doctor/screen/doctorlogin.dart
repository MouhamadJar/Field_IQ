import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandoob/controller/doctor/doctorlogincontroller.dart';

import '../../../class/constant/images.dart';
import '../widget/customrowlogin.dart';
import '../widget/custoombutton.dart';
import 'homescreen.dart';

class DoctorLogin extends StatelessWidget {
   DoctorLogin({Key? key}) : super(key: key);
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorLoginController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(AppImages.backgroundLogin, fit: BoxFit.fill)),
              GetBuilder<DoctorLoginController>
                (builder: (controller)=> Form(
                key: controller.formState,
                child: ListView(
                  children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 24.0),
                     child: Column(
                       children: [ Padding(
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
                           myController: controller.phone,
                           text: 'Phone'.tr,
                           hintText: 'Phone'.tr,
                           isNumber: true,
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
                         const SizedBox(
                           height: 100,
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 16.0),
                           child: CustomButton(
                             text: 'Login'.tr,
                             onTap: () {
                               if (controller.formState.currentState!.validate()){
                                 controller.login();
                               }
                             },
                           ),
                         ),],
                     ),
                   )
                  ],
                ),

              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
