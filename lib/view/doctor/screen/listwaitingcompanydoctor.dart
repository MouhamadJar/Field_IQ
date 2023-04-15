import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mandoob/view/doctor/screen/finalinterviews.dart';
import 'package:mandoob/view/doctor/screen/notificationsdoctor.dart';

import '../../../class/constant/colors.dart';
import '../../../class/constant/images.dart';
import '../widget/customlistwaitingcompany.dart';


class ListWaitingCompanyDoctor extends StatelessWidget {
  const ListWaitingCompanyDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: (){
              Get.to(()=> const  FinalInterviewsScreen());
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
          actions: [
            InkWell(
              onTap: (){
                Get.back();
              },
                child: const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(Icons.arrow_forward_ios,color: AppColor.primaryColor,size: 20,),
                ))
          ],
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Get.to(()=> const NotificationsDoctorScreen());
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.secondaryColor),
                  child: const Icon(Icons.notifications,
                    color: AppColor.black,size: 30,),
                ),
              ),
            ),
            const CustomListWaitingCompany(),
            Padding(
              padding: const EdgeInsets.symmetric( vertical: 20),
              child: Center(child: Container(
                width: 297,
                height: 45,
                decoration: BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: Text(
                      'Start Interview'.tr,
                      style:
                      const TextStyle(fontSize: 18, color: AppColor.black,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
