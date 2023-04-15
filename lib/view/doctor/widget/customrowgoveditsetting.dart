import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandoob/controller/doctor/editsettingdoctorcontroller.dart';

import '../../../class/constant/colors.dart';

class CustomRowGovEditSetting extends StatelessWidget {
  const CustomRowGovEditSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditSettingDoctorController controller = Get.put(EditSettingDoctorController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25),
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Governorate'.tr,
              style: const TextStyle(
                  fontSize: 14, color: Colors.black),
            ),
          ),
          const Spacer(),

          GetBuilder<EditSettingDoctorController>(
            initState: (state){
              controller.getCity();
            },
            builder : (controller){
              return controller.isLoading.value
                  ? Container(
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
                child: const Icon(
                  Icons.arrow_drop_down,
                  color: AppColor.primaryColor,
                  size: 16,
                ),
              )
                  : DropdownButtonHideUnderline(
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
                            controller.cityTypeSelected.value.name ?? "",
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down,
                          color: AppColor.primaryColor,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  items: controller.cityList.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      alignment: Alignment.center,
                      child: Text(item.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.setSelected(value);
                  },
                ),
              );
            }
          ),
          // Obx(() => DropdownButtonHideUnderline(
          //   child: DropdownButton2(
          //     isExpanded: true,
          //     style: const TextStyle(
          //       color: AppColor.black,
          //       fontSize: 12,
          //       fontWeight: FontWeight.w500,
          //     ),
          //     customButton: Container(
          //       height: 40,
          //       width: 228,
          //       decoration: BoxDecoration(
          //         border: Border.all(
          //           color: AppColor.primaryColor,
          //           width: 1,
          //         ),
          //         borderRadius: const BorderRadius.all(
          //           Radius.circular(5),
          //         ),
          //       ),
          //       child: Row(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //             child: Text(
          //               controller.typeSelected.value ?? "",
          //             ),
          //           ),
          //           const Icon(Icons.arrow_drop_down,
          //             color: AppColor.primaryColor,
          //             size: 16,
          //           ),
          //         ],
          //       ),
          //     ),
          //     items: controller.items.map((item) {
          //       return DropdownMenuItem(
          //         value: item,
          //         alignment: Alignment.center,
          //         child: Text(item),
          //       );
          //     }).toList(),
          //     onChanged: (value) {
          //       controller.setSelected(value.toString());
          //     },
          //   ),
          // ))
        ],
      ),
    );
  }
}
