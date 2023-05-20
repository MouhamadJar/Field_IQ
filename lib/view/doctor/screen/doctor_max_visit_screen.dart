import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/doctor/doctorinterviewscontroller.dart';
import '../../../class/constant/colors.dart';
import '../../../controller/doctor/max_visit_controller.dart';
import '../../../models/doctor/Days.dart';
import '../widget/customrowinterview.dart';
import '../widget/customrowinterviewtype.dart';
import '../widget/customrowtime.dart';
import '../widget/custoombutton.dart';

class DoctorMaxVisitScreen extends StatelessWidget {
  final Days days;

  const DoctorMaxVisitScreen({Key? key, required this.days}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MaxVisitController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5.0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.primaryColor,
              size: 20.0,
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                GetBuilder<MaxVisitController>(
                  builder: (controller) => Form(
                    key: controller.formState,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 52.0),
                          child: Center(
                            child: Text(
                              days.name.tr,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        CustomRowInterview(
                          hintText: 'Max Visit'.tr,
                          myController: controller.maxVisitController,
                          text: 'Max Visit'.tr,
                          isNumber: true,
                        ),
                        controller.isLoading ? CircularProgressIndicator():
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 20.0),
                          child: CustomButton(
                            text: 'Save'.tr,
                            onTap: () {
                              if (controller.formState.currentState!
                                  .validate()) {
                                controller.editMaxVisit(
                                    dayId: days.maxVisitID,
                                    );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
