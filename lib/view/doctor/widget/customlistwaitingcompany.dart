import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/constant/colors.dart';
import '../../../controller/doctor/doctorinterviewscontroller.dart';
import '../../../models/doctor/interviewsalesman/DataInterviewSalesMan.dart';
import '../screen/listwaitiangdetailsdoctor.dart';

class CustomListWaitingCompany extends GetView<DoctorInterviewsController> {
  const CustomListWaitingCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctorInterviewsController controller =
        Get.put(DoctorInterviewsController());
    return controller.obx(
      (data) => Expanded(
        child: ListView.separated(
            separatorBuilder: (context, i) => const SizedBox(
                  height: 10,
                ),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.interviewSalesMan.length,
            itemBuilder: (context, i) {
              return WaitingListCompany(
                dataInterviewSalesMan: controller.interviewSalesMan[i],
              );
            }),
      ),
    );
  }
}

class WaitingListCompany extends StatelessWidget {
  final DataInterviewSalesMan dataInterviewSalesMan;

  const WaitingListCompany({Key? key, required this.dataInterviewSalesMan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ListWaitingDetailsDoctor(
              dataInterviewSalesMan: dataInterviewSalesMan,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 88,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColor.hintText,
                  blurRadius: 5.5,
                  offset: Offset(2, 2)),
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
                      shape: BoxShape.circle, color: AppColor.secondaryColor),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              'Customer Name'.tr,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              dataInterviewSalesMan.salesmanName,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              'Company Name'.tr,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              dataInterviewSalesMan.salesmanCompany,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  dataInterviewSalesMan.day,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
