import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/constant/colors.dart';
import '../../../class/constant/const.dart';
import '../../../class/services/services.dart';
import '../../../controller/doctor/doctorsignupcontroller.dart';
import '../../../controller/mandoob/doctor_reservations_controller.dart';

class CustomRowLang extends StatelessWidget {
  const CustomRowLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctorSignUpController controller = Get.put(DoctorSignUpController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Language'.tr,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          const Spacer(),
          Obx(() => DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  customButton: Container(
                    height: 40,
                    width: 228,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.primaryColor,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            controller.typeSelectedLang.value ?? "",
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: AppColor.primaryColor,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  items: controller.lang.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      alignment: Alignment.center,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.setSelectedLang(value.toString());
                  },
                ),
              ))
        ],
      ),
    );
  }
}

class SettingsLanguageChanger extends StatelessWidget {
  const SettingsLanguageChanger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReservationsController controller = Get.put(ReservationsController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
      child: Row(
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
          Text('Language'.tr),
          const Spacer(),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              style: const TextStyle(
                color: AppColor.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              customButton: Container(
                height: Get.width * .09,
                width: Get.width * .48,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.secondaryColor,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        kLanguage,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: AppColor.secondaryColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
              items: controller.languages.map((item) {
                return DropdownMenuItem(
                  value: item,
                  alignment: Alignment.center,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                controller.changeLanguage(value.toString());
                kLanguage = value.toString();
                MyServices services = Get.find();
                services.sharedPreferences.setString('language', kLanguage);
                print(kLanguage);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsStartMeets extends StatelessWidget {
  const SettingsStartMeets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReservationsController controller = Get.put(ReservationsController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
      child: Row(
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
          Text('Start Meets'.tr),
          const Spacer(),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColor.secondaryColor)
            ),
            onPressed: () {},
            child: Text('Start'),
          ),
        ],
      ),
    );
  }
}
