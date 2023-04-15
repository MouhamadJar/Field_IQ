
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../class/constant/colors.dart';
import '../../../controller/doctor/finalinterviewscreencontroller.dart';
import '../../../models/doctor/interviewmodel/DataInterview.dart';
import '../screen/interviewdetailsdoctor.dart';

class CustomListDaysFinal extends GetView<FinalInterviewScreenController> {
  const CustomListDaysFinal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FinalInterviewScreenController controller = Get.put(FinalInterviewScreenController());
    return controller.obx(
      (data)=> Expanded(
        child: ListView.separated(
            separatorBuilder: (context, i) =>const  SizedBox(
              height: 10,
            ),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.interviews.length,
            itemBuilder: (context, i) {
              return  DaysList(dataInterview: controller.interviews[i],);
            }),
      ),
    );
  }
}

class DaysList extends StatelessWidget {
  final DataInterview dataInterview;
  const DaysList({Key? key, required this.dataInterview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Get.to(()=> InterviewDetailsDoctorScreen(dataInterview: dataInterview,));},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow:  [
              BoxShadow(
                  color: AppColor.hintText,
                  blurRadius: 5.5,
                  offset: Offset(0, 2)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Container(
                  width: 13,
                  height: 13,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.secondaryColor),
                ),
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    dataInterview.day,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const Spacer(),
                 Text(dataInterview.time,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: AppColor.hintText,
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

