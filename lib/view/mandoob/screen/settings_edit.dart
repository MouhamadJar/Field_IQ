import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../class/component.dart';
import '../../../class/constant/colors.dart';
import '../../../class/constant/const.dart';
import '../../../controller/mandoob/api_controller.dart';
import '../../../controller/mandoob/setting_controller.dart';
import '../../doctor/widget/custoombutton.dart';
import '../../widget/customrowgovsellsman.dart';

class SettingsEdit extends GetView<SettingController> {
  SettingsEdit({
    Key? key,
  }) : super(key: key);
  final TextEditingController nameController =
      TextEditingController(text: user.name);
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController phoneNumberController =
      TextEditingController(text: user.phone);
  final TextEditingController companyNameController =
      TextEditingController(text: user.company);
  final TextEditingController officeNameController =
      TextEditingController(text: user.officeName);
  final TextEditingController lineController = TextEditingController(text: '');
  final TextEditingController subNameController =
      TextEditingController(text: user.names);
  final TextEditingController cardNumberController =
      TextEditingController(text: user.cvv);
  final TextEditingController expController =
      TextEditingController(text: user.exp);
  final TextEditingController specializationController =
      TextEditingController(text: user.specialization);

  @override
  Widget build(BuildContext context) {
 Get.put(SettingController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5.0,
          actions: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColor.primaryColor,
                  size: 20.0,
                ),
              ),
            ),
          ],
          leading: const SizedBox(),
          title: Text(
            'Settings'.tr,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: AppColor.secondaryColor,
                          ),
                          height: 8,
                          width: 8,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: Get.width * .25, child: Text('Name'.tr)),
                        const Spacer(),
                        Container(
                          width: Get.width * .48,
                          height: Get.height * .05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 3.0,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                              color: const Color(0xffCCCCCC),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            controller: nameController,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: AppColor.secondaryColor,
                          ),
                          height: 8,
                          width: 8,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: Get.width * .25, child: Text('Password'.tr)),
                        const Spacer(),
                        Container(
                          width: Get.width * .48,
                          height: Get.height * .05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 3.0,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                              color: const Color(0xffCCCCCC),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            controller: passwordController,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: AppColor.secondaryColor,
                          ),
                          height: 8,
                          width: 8,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: Get.width * .25,
                            child: Text('Phone Number'.tr)),
                        const Spacer(),
                        Container(
                          width: Get.width * .48,
                          height: Get.height * .05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 3.0,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                              color: const Color(0xffCCCCCC),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            controller: phoneNumberController,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: AppColor.secondaryColor,
                          ),
                          height: 8,
                          width: 8,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: Get.width * .25,
                            child: Text('Company Name'.tr)),
                        const Spacer(),
                        Container(
                          width: Get.width * .48,
                          height: Get.height * .05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 3.0,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                              color: const Color(0xffCCCCCC),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: TextFormField(
                            controller: companyNameController,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: AppColor.secondaryColor,
                          ),
                          height: 8,
                          width: 8,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: Get.width * .25,
                            child: Text('specialization'.tr)),
                        const Spacer(),
                        Container(
                          width: Get.width * .48,
                          height: Get.height * .05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 3.0,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                              color: const Color(0xffCCCCCC),
                            ),
                          ),
                          child: TextFormField(
                            controller: specializationController,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    SettingRowGovSellsman(),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: AppColor.secondaryColor,
                          ),
                          height: 8,
                          width: 8,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('Science Office'.tr),
                        const Spacer(),
                        Container(
                          width: Get.width * .48,
                          height: Get.height * .05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 3.0,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                              color: const Color(0xffCCCCCC),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            controller: officeNameController,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    // Row(
                    //   children: [
                    //     Container(
                    //       decoration: const ShapeDecoration(
                    //         shape: CircleBorder(),
                    //         color: AppColor.secondaryColor,
                    //       ),
                    //       height: 8,
                    //       width: 8,
                    //     ),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //     Text('Line'.tr),
                    //     const Spacer(),
                    //     Container(
                    //       width: Get.width * .48,
                    //       height: Get.height * .05,
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(5.0),
                    //         boxShadow: [
                    //           BoxShadow(
                    //             color: Colors.grey.shade400,
                    //             blurRadius: 3.0,
                    //             offset: const Offset(0, 3),
                    //           ),
                    //         ],
                    //         border: Border.all(
                    //           color: const Color(0xffCCCCCC),
                    //         ),
                    //       ),
                    //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    //       child: TextFormField(
                    //         controller: lineController,
                    //         decoration: const InputDecoration(
                    //           enabledBorder: OutlineInputBorder(
                    //             borderSide: BorderSide.none,
                    //           ),
                    //           focusedBorder: OutlineInputBorder(
                    //             borderSide: BorderSide.none,
                    //           ),
                    //           errorBorder: OutlineInputBorder(
                    //             borderSide: BorderSide.none,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: AppColor.secondaryColor,
                          ),
                          height: 8,
                          width: 8,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('sub\'s name'.tr),
                        const Spacer(),
                        Container(
                          width: Get.width * .48,
                          height: Get.height * .05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 3.0,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                              color: const Color(0xffCCCCCC),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            controller: subNameController,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Obx(
                      () => controller.isLoading.value
                          ? const CustomButtonShimmer()
                          : MyButton(
                              hasShadow: true,
                              title: 'Save Changes',
                              buttonColor: AppColor.secondaryColor,
                              onTap: () {
                                controller.isLoading.value = true;
                                controller.update();
                                try {
                                  if (passwordController.text == '') {
                                    DioHelper()
                                        .updateProfile(
                                      name: nameController.text,
                                      specialization:
                                          specializationController.text,
                                      cityId: user.cityId,
                                      phone: phoneNumberController.text,
                                      companyName: companyNameController.text,
                                      names: subNameController.text,
                                      officeName: officeNameController.text,
                                    )
                                        .then((value) {
                                      controller.isLoading.value = false;
                                      controller.update();
                                      Get.snackbar('Done',
                                          'Profile Updated Successfully');
                                    }, onError: (error) {
                                      controller.isLoading.value = false;
                                      controller.update();
                                      controller.reInitUserData(
                                        names: nameController.text,
                                        phone: phoneNumberController.text,
                                        specialization:
                                            specializationController.text,
                                        name: nameController.text,
                                        cvv: cardNumberController.text,
                                        companyName: companyNameController.text,
                                        exp: expController.text,
                                      );
                                      print(error.toString());
                                      Get.snackbar(
                                        'Ops',
                                        'Please Check your connection',
                                        backgroundColor:
                                            Colors.redAccent.withOpacity(0.5),
                                      );
                                    });
                                  } else {
                                    DioHelper()
                                        .updateProfile(
                                      name: nameController.text,
                                      specialization:
                                          specializationController.text,
                                      cityId: user.cityId,
                                      phone: phoneNumberController.text,
                                      companyName: companyNameController.text,
                                      names: subNameController.text,
                                      officeName: officeNameController.text,
                                      password: passwordController.text,
                                    )
                                        .then((value) {
                                      controller.isLoading.value = false;
                                      controller.update();
                                      controller.reInitUserData(
                                        names: nameController.text,
                                        phone: phoneNumberController.text,
                                        specialization:
                                            specializationController.text,
                                        name: nameController.text,
                                        cvv: cardNumberController.text,
                                        companyName: companyNameController.text,
                                        exp: expController.text,
                                      );
                                      Get.snackbar('Done',
                                          'Profile Updated Successfully');
                                    }, onError: (error) {
                                      controller.isLoading.value = false;
                                      controller.update();
                                      Get.snackbar(
                                        'Ops',
                                        'Please Check your connection',
                                        backgroundColor:
                                            Colors.redAccent.withOpacity(0.5),
                                      );
                                    });
                                  }
                                } on DioError catch (error) {
                                  print(error.message);
                                }
                              }),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
