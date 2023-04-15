import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../class/constant/colors.dart';
import '../../../controller/doctor/editsettingdoctorcontroller.dart';

class CustomSettingDeleteImage extends StatelessWidget {
  CustomSettingDeleteImage({
    Key? key,
  }) : super(key: key);
  XFile? imagesID;

  @override
  Widget build(BuildContext context) {
    Get.put(EditSettingDoctorController());
    return GetBuilder<EditSettingDoctorController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
        child: Row(
          children: [
            Container(
              width: 13,
              height: 13,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.secondaryColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Clinic Certificate'.tr,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            const Spacer(),
            imagesID == null
                ? InkWell(
                    onTap: () async {
                      imagesID = await controller.selectMultipleImageID();
                    },
                    child: Container(
                        width: 228,
                        height: 134,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColor.hintText)),
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
                      File(controller.imagesID!.path),
                    ))
          ],
        ),
      ),
    );
  }
}
