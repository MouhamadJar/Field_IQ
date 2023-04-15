import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../class/component.dart';
import '../../../../controller/mandoob/doctor_reservations_controller.dart';

class HomeReservationPage extends GetView<ReservationsController> {
  const HomeReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReservationsController reservationsController =
    Get.put(ReservationsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Reservations'.tr,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        centerTitle: true,
      ),
      body:controller.obx((reservations) {
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: reservations.length,
            itemBuilder: (context, index) => DoctorReservationDetailsRow(
              reservation:  reservations[index],
            ),
          ),
        );
      },
          onLoading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: const[
                  DoctorReservationDetailsRowShimmer(),
                  DoctorReservationDetailsRowShimmer(),
                  DoctorReservationDetailsRowShimmer(),
                  DoctorReservationDetailsRowShimmer(),
                  DoctorReservationDetailsRowShimmer(),
                ],
              ),
            ),
          )),
    );
  }
}
