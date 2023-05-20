import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/doctor/doctorinterviewscontroller.dart';
import '../../../class/constant/colors.dart';
import '../../../models/doctor/Days.dart';
import '../widget/customrowinterview.dart';
import '../widget/customrowinterviewtype.dart';
import '../widget/customrowtime.dart';
import '../widget/custoombutton.dart';


class AddInterviewDoctor extends StatelessWidget {
  final Days days;
  const AddInterviewDoctor({Key? key, required this.days}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorInterviewsController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5.0,
          leading:  InkWell(
            onTap: (){Get.back();},
            child: const Icon(Icons.arrow_back_ios_new_rounded,
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
                GetBuilder<DoctorInterviewsController>(
                  builder: (controller) =>Form(
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

                        CustomRowTime(hintText: 'Start Time'.tr, myController: controller.startTime, text: 'Start Time'.tr,
                          iconData: Icons.access_time_rounded, iconColor: AppColor.primaryColor,
                          onTap: ()async{
                            TimeOfDay? pickedTime = await showTimePicker(context: Get.context!, initialTime: controller.timeSelected.value, helpText: 'Start Time'.tr,
                                confirmText: 'CONFIRM'.tr);
                            if(pickedTime != null && pickedTime != controller.timeSelected)
                            {
                              controller.timeSelected.value = pickedTime;
                              controller.startTime .text= pickedTime.toString().substring(10,15);
                              print(controller.timeSelected.value.toString());
                            }
                          },
                        ),
                        CustomRowInterview(hintText: 'Duration'.tr, myController: controller.duration, text: 'Duration'.tr,isDuration: true,isNumber: true,),
                        const CustomRowInterviewType(),
                        CustomRowInterview(hintText: 'Charges'.tr, myController: controller.charges, text: 'Charges'.tr, isNumber: true,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                          child: CustomButton(text: 'Save'.tr, onTap: (){
                            if (controller.formState.currentState!.validate()){
                              controller.addInterview(days.id);
                            }

                          },),
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
