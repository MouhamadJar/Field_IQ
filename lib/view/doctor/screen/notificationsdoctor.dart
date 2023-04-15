import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandoob/view/doctor/widget/customlistnotifications.dart';

import '../../../class/constant/colors.dart';

class NotificationsDoctorScreen extends StatelessWidget {
  const NotificationsDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.white,
          elevation: 2.0,
          leading:  InkWell(
            onTap: (){Get.back();},
            child: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColor.primaryColor,
              size: 20.0,
            ),
          ),
          title:
          Text('Notifications'.tr,  style: const TextStyle(
            fontSize: 24.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: const [
              CustomListNotifications(),

            ],
          ),
        ),
      ),
    );
  }
}
