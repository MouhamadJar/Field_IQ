import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/constant/colors.dart';
import '../../../class/constant/end_points.dart';
import '../../../class/constant/images.dart';
import '../../../class/services/services.dart';
import '../../../controller/mandoob/api_controller.dart';
import '../../../controller/mandoob/mandoobsignupcontroller.dart';
import '../../doctor/widget/customrowlang.dart';
import '../widget/customrowcomp.dart';
import '../widget/customrowgovsellsman.dart';
import '../../doctor/widget/customrowlogin.dart';
import '../../doctor/widget/customrowlogincard.dart';
import '../../doctor/widget/custoombutton.dart';
import 'home_screen.dart';
import 'mandooblogin.dart';

class MandoobSignUp extends StatelessWidget {
  MandoobSignUp({Key? key}) : super(key: key);
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Get.put(MandoobSignUPController());
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
              GetBuilder<MandoobSignUPController>(
                builder: (controller) => Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
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
                            myController: controller.name,
                            text: 'Name'.tr,
                            hintText: 'Name'.tr,
                            isUserName: true,
                            passwordFocusNode: passwordFocusNode,
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
                          CustomRowGovSellsman(),
                          CustomRowLogin(
                            myController: controller.companyName,
                            text: 'Company'.tr,
                            hintText: 'company name'.tr,
                          ),
                          CustomRowLogin(
                            myController: controller.officename,
                            text: 'Office Name'.tr,
                            hintText: 'Office Name'.tr,
                          ),
                          CustomRowLogin(
                            myController: controller.substancesnames,
                            text: 'Substances Names'.tr,
                            hintText: 'Substances Names'.tr,
                          ),
                          const CustomRowLang(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Obx(() {
                              return controller.isLoading.value
                                  ? const CustomButtonShimmer()
                                  : CustomButton(
                                text: 'Signup'.tr,
                                onTap: () {
                                  controller.isLoading.value = !controller.isLoading.value;
                                  controller.update();
                                  DioHelper().signup(
                                    data: {
                                      'city_id':
                                      controller.typeSelected.value.id,
                                      'company':
                                      controller.companyName.text,
                                      'name': controller.name.text,
                                      'phone': controller.phone.text,
                                      'office_name':
                                      controller.officename.text,
                                      'specialization': 'specialization',
                                      'names':
                                      controller.substancesnames.text,
                                      'password': controller.password.text,
                                    },
                                  ).then((value) {
                                    Get.snackbar(
                                      'Done',
                                      'Signup Successfully',
                                    );
                                    MyServices services = Get.find();
                                    services.sharedPreferences.setString('mToken',value.data['accessToken']);
                                    kToken = value.data['accessToken'];
                                    controller.isLoading.value = !controller.isLoading.value;
                                    controller.update();
                                    Get.offAll(() => HomeScreen());
                                  }, onError: (error) {
                                    Get.snackbar(
                                      'ops',
                                      'please pass valid data',
                                      backgroundColor: Colors.redAccent.withOpacity(0.5),
                                    );
                                    print(error.toString());
                                    controller.isLoading.value = !controller.isLoading.value;
                                    controller.update();
                                  });
                                },
                              );
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                Get.to(()=> MandoobLogin());
                              },
                              child: const Text('Or Login',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColor.primaryColor,
                              ),),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
