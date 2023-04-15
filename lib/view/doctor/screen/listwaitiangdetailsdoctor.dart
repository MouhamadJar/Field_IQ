import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../class/constant/images.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../class/constant/colors.dart';
import '../../../models/doctor/interviewsalesman/DataInterviewSalesMan.dart';
import '../widget/customwaitinglistdetails.dart';

class ListWaitingDetailsDoctor extends StatelessWidget {
  final DataInterviewSalesMan dataInterviewSalesMan;
  const ListWaitingDetailsDoctor({Key? key, required this.dataInterviewSalesMan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void launchWhatsApp() async {
      final Uri whatsappLaunchUri = Uri(
        scheme: 'https',
        host: 'wa.me',
        path: '/9647822283347/',
        query: 'com.whatsapp',
      );
      await launchUrl(whatsappLaunchUri,mode: LaunchMode.externalApplication);
    }
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
          title: Text(
            'Waiting List Details'.tr,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            CustomWaitingListDetails(
              text: "Name".tr,
              info: dataInterviewSalesMan.salesmanName,
            ),
            CustomWaitingListDetails(
              text: 'Phone'.tr,
              info: dataInterviewSalesMan.phone,
            ),
            CustomWaitingListDetails(
              text: 'Company'.tr,
              info: dataInterviewSalesMan.salesmanCompany,
            ),
            CustomWaitingListDetails(
              text: 'Interview Day'.tr,
              info: dataInterviewSalesMan.day,
            ),
            CustomWaitingListDetails(
              text: 'Interview Time'.tr,
              info: dataInterviewSalesMan.time,
            ),
            CustomWaitingListDetails(
              text: 'Interview Duration'.tr,
              info: dataInterviewSalesMan.duration,
            ),
            CustomWaitingListDetails(
              text: 'Specialization'.tr,
              info: dataInterviewSalesMan.salesmanSpecialization,
            ),
            CustomWaitingListDetails(
              text: 'Price'.tr,
              info: dataInterviewSalesMan.price.toString(),
            ),
            CustomWaitingListDetails(
              text: 'Kind Of Visit'.tr,
              info: dataInterviewSalesMan.price.toString(),
            ),
            CustomWaitingListDetails(
              text: 'Material Names'.tr,
              info: dataInterviewSalesMan.salesmanNames,
            ),
            CustomWaitingListDetails(
              text: 'Office Name'.tr,
              info: dataInterviewSalesMan.officeName,
            ),
            InkWell(
              onTap: (){
                launchWhatsApp();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.whatsapp,
                      width: 37,
                      height: 37,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                      child: Text(
                        'Communication Via Whatsapp'.tr,
                        style: const TextStyle(color: AppColor.black, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
