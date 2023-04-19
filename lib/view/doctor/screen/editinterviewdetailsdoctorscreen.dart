import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../class/constant/colors.dart';
import '../../../controller/doctor/doctorinterviewdetailseditcontroller.dart';
import '../../../models/doctor/interviewmodel/DataInterview.dart';
import '../widget/customrowinterview.dart';
import '../widget/customrowinterviewtype.dart';
import '../widget/customrowtime.dart';
import '../widget/custoombutton.dart';

class EditInterviewDetailsDoctorScreen
    extends GetView<DoctorInterviewDetailsEditController> {
  final DataInterview dataInterview;

  const EditInterviewDetailsDoctorScreen(
      {Key? key, required this.dataInterview})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorInterviewDetailsEditController());
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<DoctorInterviewDetailsEditController>(
                builder: (controller) => Form(
                  key: controller.formState,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 52.0),
                        child: Center(
                          child: Text(
                            dataInterview.day.tr,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      CustomRowTime(
                        hintText: dataInterview.time,
                        myController: controller.startTime,
                        text: 'Start Time'.tr,
                        iconData: Icons.access_time_rounded,
                        iconColor: AppColor.primaryColor,
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                              context: Get.context!,
                              initialTime: controller.timeSelected.value,
                              helpText: 'Start Time'.tr,
                              confirmText: 'CONFIRM'.tr);
                          if (pickedTime != null &&
                              pickedTime != controller.timeSelected) {
                            controller.timeSelected.value = pickedTime;
                            controller.startTime.text =
                                pickedTime.toString().substring(10, 15);
                            print(controller.timeSelected.value.toString());
                          }
                        },
                      ),
                      CustomRowInterview(
                        hintText: dataInterview.duration,
                        myController: controller.duration,
                        text: 'Duration'.tr,
                        isDuration: true,
                        isNumber: true,
                      ),
                      const CustomRowInterviewType(),
                      CustomRowInterview(
                        hintText: dataInterview.price.toString(),
                        myController: controller.charges,
                        text: 'Charges'.tr,
                        isNumber: true,
                      ),
                      // CustomRowInterview(hintText: 'Sellsmen Number'.tr, myController: controller.sellsmenNumber, text: 'Sellsmen Number'.tr, isNumber: true,),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50.0, horizontal: 20.0),
                        child: CustomButton(
                          text: 'Save Changes'.tr,
                          onTap: () {
                            controller.startTime.text = dataInterview.time;
                            controller.editInterview(
                                dataInterview.dayId,
                                dataInterview.appointmentId,
                                dataInterview.time,
                                dataInterview.duration,
                                dataInterview.price.toString());
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
    );
  }
}
