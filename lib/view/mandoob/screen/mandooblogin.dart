import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/constant/end_points.dart';
import '../../../class/constant/images.dart';
import '../../../class/services/services.dart';
import '../../../controller/mandoob/api_controller.dart';
import '../../../controller/mandoob/mandooblogincontroller.dart';
import '../../doctor/widget/customrowlogin.dart';
import '../../doctor/widget/custoombutton.dart';
import 'home_screen.dart';

class MandoobLogin extends StatelessWidget {
  MandoobLogin({Key? key}) : super(key: key);
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Get.put(MandoobLoginController());
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
                  child: Image.asset(AppImages.backGroundLoginSellsman,
                      fit: BoxFit.fill)),
              GetBuilder<MandoobLoginController>(
                  builder: (controller) => Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 52.0),
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0),
                                child: Obx(() {
                                  return controller.isLoading.value
                                      ? const CustomButtonShimmer()
                                      : CustomButton(
                                    text: 'Login'.tr,
                                    onTap: () {
                                      controller.isLoading.value =
                                      !controller.isLoading.value;
                                      controller.update();
                                      DioHelper().login(data: {
                                        'phone': controller.phone.text,
                                        'password':
                                        controller.password.text
                                      }).then((value) {
                                        Get.snackbar(
                                          'Done',
                                          'Login Successfully',
                                        );
                                        controller.isLoading.value =
                                        !controller.isLoading.value;
                                        controller.update();
                                        kToken = value.data['token'];
                                        MyServices services =
                                        Get.find();
                                        services.sharedPreferences
                                            .setString('mToken',
                                            value.data['token']);
                                        Get.offAll(
                                                () =>  HomeScreen());
                                      }, onError: (error) {
                                        Get.snackbar(
                                          'ops',
                                          'phone or password is incorrect',
                                          backgroundColor: Colors
                                              .redAccent
                                              .withOpacity(0.5),
                                        );
                                        controller.isLoading.value =
                                        !controller.isLoading.value;
                                        controller.update();
                                      });
                                    },
                                  );
                                }),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
