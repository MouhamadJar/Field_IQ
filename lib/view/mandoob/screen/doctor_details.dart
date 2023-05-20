import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../class/component.dart';
import '../../../class/constant/colors.dart';
import '../../../controller/mandoob/doctor_controller.dart';
import '../../../models/mandoob/mandoob_model.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({
    Key? key,
    required this.doctorDetails,
  }) : super(key: key);
  final DoctorModel doctorDetails;

  @override
  Widget build(BuildContext context) {
    ReserveController controller = Get.put(ReserveController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          actions: const [
            Padding(padding: EdgeInsets.all(8.0), child: MyBackButton())
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width,
                  child: Text(
                    'Meeting Reservation'.tr,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                ReservationDetailsRow(
                  title: 'Name',
                  value: doctorDetails.fullName,
                  circleColor: AppColor.primaryColor,
                ),
                ReservationDetailsRow(
                  title: 'Phone Number',
                  value: doctorDetails.fullName,
                  circleColor: AppColor.primaryColor,
                ),
                ReservationDetailsRow(
                  title: 'Specialization',
                  value: doctorDetails.specialization,
                  circleColor: AppColor.primaryColor,
                ),
                ReservationDetailsRow(
                  title: 'Receiving Method',
                  value: doctorDetails.paymentMethod,
                  circleColor: AppColor.primaryColor,
                ),
                ReservationDetailsRow(
                  title: 'CVV',
                  value: doctorDetails.cvv,
                  circleColor: AppColor.primaryColor,
                ),
                Row(
                  children: [
                    Container(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: AppColor.primaryColor,
                      ),
                      height: 8,
                      width: 8,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('Meeting times'.tr),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: (Get.height * .15) *
                        doctorDetails.doctorAppointments.length,
                    width: Get.width * .85,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: doctorDetails.doctorAppointments.length,
                      itemBuilder: (context, index) => SizedBox(
                        height: Get.height * .15,
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * .2,
                              height: Get.height * .05,
                              child: Center(
                                child: Text(doctorDetails
                                    .doctorAppointments[index].day.tr),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: Get.width * .2,
                                  height: Get.height * .05,
                                  child: Center(
                                    child: Text(doctorDetails
                                        .doctorAppointments[index].time),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * .2,
                                  height: Get.height * .05,
                                  child: Center(
                                    child: Text(doctorDetails
                                        .doctorAppointments[index].duration.tr),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * .15,
                                  height: Get.height * .05,
                                  child: Center(
                                    child: Text(
                                        "${doctorDetails.doctorAppointments[index].price}\$"),
                                  ),
                                ),
                                controller.obx(
                                  (state) {
                                    return ReserveButton(
                                      onTap: () {
                                        controller.reserve(
                                          dayId: doctorDetails
                                              .doctorAppointments[index].dayId,
                                          amount: doctorDetails
                                              .doctorAppointments[index].price,
                                          appointmentId: doctorDetails
                                              .doctorAppointments[index]
                                              .appointmentId,
                                          doctorName: doctorDetails.fullName,
                                          doctorId: doctorDetails.id,
                                          appointmentTimeId: doctorDetails
                                              .doctorAppointments[index]
                                              .appointmentId,
                                          reserveDay: doctorDetails
                                              .doctorAppointments[index].day,
                                          reserveTime: doctorDetails
                                              .doctorAppointments[index].time,
                                        );
                                      },
                                    );
                                  },
                                  onLoading: const ReserveButtonShimmer(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
