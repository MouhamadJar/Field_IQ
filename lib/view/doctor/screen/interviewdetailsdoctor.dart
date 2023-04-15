import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../class/constant/colors.dart';
import '../../../models/doctor/interviewmodel/DataInterview.dart';
import '../widget/customrowinterviewdetails.dart';
import 'editinterviewdetailsdoctorscreen.dart';
class InterviewDetailsDoctorScreen extends StatelessWidget {
  final DataInterview dataInterview;
  const InterviewDetailsDoctorScreen({Key? key, required this.dataInterview}) : super(key: key);

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
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:52.0 , left:150 , top:40 ),
                  child: Center(
                    child: Text(dataInterview.day,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0
                      ),),
                  ),
                ),
                const SizedBox(
                  width: 90,
                ),
                // Spacer(),
                InkWell(
                  onTap: (){
                    Get.off(()=>  EditInterviewDetailsDoctorScreen(dataInterview: dataInterview,));

                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.secondaryColor),
                    child: const Icon(Icons.edit,
                      color: AppColor.black,size: 30,),
                  ),
                ),

              ],),
            CustomInterviewDetails(text: 'Start Time'.tr, info: dataInterview.time,),
            CustomInterviewDetails(text: 'Duration'.tr, info: dataInterview.duration,),
            CustomInterviewDetails(text: 'Interview Type'.tr, info: dataInterview.kindOfVisite,),
            CustomInterviewDetails(text: 'Charges'.tr, info: dataInterview.price.toString(),),
            CustomInterviewDetails(text: 'Sellsmen Number'.tr, info: dataInterview.maxVisitsInThisDay,),



          ],
        ),
      ),
    );
  }
}
