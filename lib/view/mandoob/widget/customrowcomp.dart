import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/constant/colors.dart';
import '../../../controller/mandoob/mandoobsignupcontroller.dart';



class CustomRowComp extends StatelessWidget {
  const CustomRowComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MandoobSignUPController controller = Get.put(MandoobSignUPController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Company'.tr,
              style: const TextStyle(
                  fontSize: 14, color: Colors.black),
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
                        controller.typeSelectedComp.value ?? "",
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down,
                      color: AppColor.secondaryColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
              items: controller.compItems.map((item) {
                return DropdownMenuItem(
                  value: item,
                  alignment: Alignment.center,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                controller.setSelectedComp(value.toString());
              },
            ),
          ))
        ],
      ),
    );
  }
}
