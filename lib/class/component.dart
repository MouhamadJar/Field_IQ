import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../models/mandoob/mandoob_model.dart';
import '../models/mandoob/reservation_model.dart';
import '../view/mandoob/screen/doctor_details.dart';
import '../view/mandoob/screen/reservation_details.dart';
import 'constant/colors.dart';


class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.doctorDetails,
  });

  final DoctorModel doctorDetails;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
              () => DoctorDetails( doctorDetails: doctorDetails),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 5.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 8,
                  width: 8,
                  margin: const EdgeInsets.only(right: 5.0),
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: Color(0xffFFA672),
                  ),
                ),
                Text('Name'.tr),
                const Text(' : '),
                Text(doctorDetails.fullName),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Specialization'.tr),
                      const Text(' : '),
                      Text(doctorDetails.specialization),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(doctorDetails.phone),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(doctorDetails.paymentMethod),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(doctorDetails.isAvailable == '1' ? 'Doctor is Available'.tr :'Doctor is not Available'.tr),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReservationDetailsRow extends StatelessWidget {
  const ReservationDetailsRow({
    super.key,
    required this.value,
    required this.title,
    this.circleColor = AppColor.primaryColor,
  });
  final String value;
  final String title;
  final Color circleColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration:  ShapeDecoration(
                  shape: const CircleBorder(),
                  color: circleColor,
                ),
                height: 8,
                width: 8,
              ),
              const SizedBox(width: 10,),
              Text(title.tr),
              const Spacer(),
              SizedBox(
                width: Get.width * .4,
                child: Text(value),
              ),
            ],
          ),
          const Divider(
            indent: 16.0,
            thickness: 3,
            endIndent: 16.0,
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.title,
    required this.buttonColor,
    required this.onTap,
    required this.hasShadow,

  });
  final VoidCallback onTap;
  final Color buttonColor;
  final bool hasShadow ;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height * .075,
        width: Get.width,
        margin: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
        decoration:  BoxDecoration(
          color: buttonColor,
          boxShadow:hasShadow?  [
            BoxShadow(
              color: AppColor.hintText,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ] : [],
        ),
        child: Center(
          child: Text(
            title.tr,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: AppColor.black,
            ),
          ),
        ),
      ),
    );
  }
}

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.arrow_forward_ios_sharp,
        color: AppColor.primaryColor,
      ),
    );
  }
}

class DoctorReservationDetailsRow extends StatelessWidget {
  const DoctorReservationDetailsRow({
    super.key,
    required this.reservation,
  });
  final ReservationModel reservation;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> ReservationDetails(reservation: reservation,));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: AppColor.secondaryColor,
                  ),
                  height: 8,
                  width: 8,
                ),
                const SizedBox(width: 10,),
                Text(reservation.doctorName.tr),
                const Spacer(),
                SizedBox(
                  width: Get.width * .15,
                  child: Text(reservation.day.tr),
                ),
                const Spacer(),
                SizedBox(
                  width: Get.width * .25,
                  child: Text(reservation.time),
                ),
              ],
            ),
            const Divider(
              indent: 12.0,
              thickness: 2,
              endIndent: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .1,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: Get.height * .075,
              width: Get.width * .2,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: Get.height * .03,
                  width: Get.width * .6,
                  color: Colors.white,
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: Get.height * .015,
                  width: Get.width * .4,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class DoctorReservationDetailsRowShimmer extends StatelessWidget {
  const DoctorReservationDetailsRowShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .1,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: AppColor.secondaryColor,
                ),
                height: 8,
                width: 8,
              ),
              const SizedBox(width: 10,),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 75.0,
                  height: 15,
                  color: Colors.white,
                ),),
              const Spacer(),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 75.0,
                  height: 15,
                  color: Colors.white,
                ),),
              const Spacer(),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 75.0,
                  height: 15,
                  color: Colors.white,
                ),),
            ],
          ),
          const Divider(
            indent: 12.0,
            thickness: 2,
            endIndent: 12.0,
          ),
        ],
      ),
    );
  }
}

class DoctorCardShimmer extends StatelessWidget {
  const DoctorCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,),
      width: Get.width,
      height: Get.height * .15,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 5.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade100,
            child:  Container(
              width: 200,
              height: 10,
              color: Colors.white,),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade100,
            child:  Container(
              width: 150,
              height: 10,
              color: Colors.white,),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade100,
            child:  Container(
              width: 150,
              height: 10,
              color: Colors.white,),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade100,
            child:  Container(
              width: 150,
              height: 10,
              color: Colors.white,),
          ),
        ],
      ),
    );
  }
}


class ReserveButton extends StatelessWidget {
  const ReserveButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child : Container(
        width: Get.width*.2,
        height: Get.height*.05,
        decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: const Center(child: Text('Reserve')),
      ),
    );
  }
}


class ReserveButtonShimmer extends StatelessWidget {
  const ReserveButtonShimmer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:  AppColor.secondaryColor,
      highlightColor: Colors.white,
      child: Container(
        width: Get.width*.15,
        height: Get.height*.05,
        decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: const Center(child: Text('Reserve')),
      ),
    );
  }
}

