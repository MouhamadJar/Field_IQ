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
  Get.put(DoctorInterviewsController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Get.to(() => const FinalInterviewsScreen());
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
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
          actions: [
            Center(
              child: GetBuilder<DoctorInterviewsController>(
                builder: (control) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.interviewSalesMan.length.toString(),
                      style: TextStyle(color: AppColor.black,fontSize: 20),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [CustomListWaitingCompany()],
          ),
        ),
      ),
    );
  }
}
