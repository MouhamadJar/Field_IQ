
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/constant/colors.dart';
import '../../../controller/doctor/interviewscreencontroller.dart';
import '../../../models/doctor/Days.dart';
import '../screen/addinterviewdoctor.dart';


class CustomListDays extends GetView<InterviewScreenController> {
  const CustomListDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InterviewScreenController controller = Get.put(InterviewScreenController());
    return controller.obx(
      (data)=> Expanded(
        child: ListView.separated(
            separatorBuilder: (context, i) =>const  SizedBox(
              height: 10,
            ),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.days.length,
            itemBuilder: (context, i) {
              return  DaysList(days: controller.days[i],);
            }),
      ),
    );
  }
}

class DaysList extends StatelessWidget {
  final Days days;
  const DaysList({Key? key, required this.days}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Get.off(()=>  AddInterviewDoctor(days: days,));},
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
                  days.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.add,
                color: Colors.black,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

