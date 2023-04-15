import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mandoob/view/doctor/screen/notificationsdoctor.dart';

import '../../../class/constant/colors.dart';
import '../../../class/constant/images.dart';
import '../../../controller/doctor/doctorinterviewscontroller.dart';
import '../widget/customlistwaitingcompany.dart';
import 'finalinterviews.dart';


class WaitingListDoctor extends GetView<DoctorInterviewsController> {
  const WaitingListDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: (){
              Get.to(()=> const FinalInterviewsScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: SvgPicture.asset(
                AppImages.interviewIcon,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(
            'Waiting List'.tr,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // InkWell(
              //   onTap: (){
              //     Get.to(()=> const NotificationsDoctorScreen());
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(20.0),
              //     child: Container(
              //       width: 45,
              //       height: 45,
              //       decoration: const BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: AppColor.secondaryColor),
              //       child: const Icon(Icons.notifications,
              //       color: AppColor.black,size: 30,),
              //     ),
              //   ),
              // ),
              // CustomWaitingList(),
               CustomListWaitingCompany()
            ],
          ),
        ),
      ),
    );
  }
}
