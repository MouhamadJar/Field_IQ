import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../class/constant/colors.dart';
import '../../../controller/doctor/doctorinterviewscontroller.dart';

class CustomRowInterviewType extends StatelessWidget {
  const CustomRowInterviewType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctorInterviewsController controller = Get.put(DoctorInterviewsController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Interview Type'.tr,
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
                        controller.typeSelected.value ?? "",
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down,
                      color: AppColor.primaryColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
              items: controller.interviewsItems.map((item) {
                return DropdownMenuItem(
                  value: item,
                  alignment: Alignment.center,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                controller.setSelected(value.toString());
              },
            ),
          ))
        ],
      ),
    );
  }
}
