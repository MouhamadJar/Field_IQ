import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../class/constant/colors.dart';
import '../../class/constant/const.dart';
import '../../controller/mandoob/mandoobsignupcontroller.dart';
import '../../controller/mandoob/setting_controller.dart';

class CustomRowGovSellsman extends GetView<MandoobSignUPController> {
   CustomRowGovSellsman({Key? key,width}) : super(key: key);
 double width = 228;
  @override
  Widget build(BuildContext context) {
    MandoobSignUPController mandoobController = Get.put(MandoobSignUPController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Governorate'.tr,
              style: const TextStyle(
                  fontSize: 14, color: Colors.black),
            ),
          ),
          const Spacer(),
          controller.obx((state) {
            return DropdownButtonHideUnderline(
              child: DropdownButton2(

                isExpanded: true,
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                customButton: Container(
                  height: 40,
                  width: width,
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
                          controller.typeSelected.value.name ?? "",
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down,
                        color: AppColor.secondaryColor,
                        size: 16,
                      ),
                    ],
                  ),
                ),
                items:cities .map((item) {
                  return DropdownMenuItem(
                    value: item,
                    alignment: Alignment.center,
                    child: Text(item.name),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.setSelected(value!);
                },
              ),
            );
          },),
        ],
      ),
    );
  }
}


class SettingRowGovSellsman extends GetView<SettingController> {
  SettingRowGovSellsman({Key? key,width}) : super(key: key);
  double width = 228;
  @override
  Widget build(BuildContext context) {
    SettingController myController = Get.put(SettingController());
    return Row(
      children: [
        Container(
          decoration: const ShapeDecoration(
            shape:  CircleBorder(),
            color: AppColor.secondaryColor,
          ),
          height: 8,
          width: 8,
        ),
        const SizedBox(width: 10,),
        Text('Governorate'.tr),
        const Spacer(),
        controller.obx((state) {
          return DropdownButtonHideUnderline(
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
                        controller.city.value ?? "",
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down,
                      color: AppColor.secondaryColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
              items:cities .map((item) {
                return DropdownMenuItem(
                  value: item,
                  alignment: Alignment.center,
                  child: Text(item.name),
                );
              }).toList(),
              onChanged: (value) {
                controller.setSelected(value!);
              },
            ),
          );
        },),
      ],
    );
  }
}
