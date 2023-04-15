import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandoob/view/doctor/widget/customlistdays.dart';

import '../../../class/constant/colors.dart';
import '../../../controller/doctor/interviewscreencontroller.dart';



class InterviewsScreen extends GetView<InterviewScreenController> {
  const InterviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          title: Text(
            'Interviews'.tr,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
          child: Column(
            children: const [
               CustomListDays(),
            ],
          ),
        ),
      ),
    );
  }
}
