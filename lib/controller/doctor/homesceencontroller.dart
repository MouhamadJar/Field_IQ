
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:mandoob/class/constant/const.dart';
import 'package:mandoob/class/dio.dart';
import 'package:mandoob/class/services/services.dart';

class HomeScreenController extends GetxController{
  int currentPage = 0;
  MyServices myServices = Get.find();


void changeScreen(int newIndex){
  currentPage = newIndex;
  update();
}

Future initData () async {
  DioHelper.doctorProfile(kDoctorToken).then((value) async {
    String doctorId = value.data['id'].toString();
    await FirebaseMessaging.instance.subscribeToTopic(doctorId).then((value) async {
      print('done');
     await FirebaseMessaging.onMessage.listen((event) {
        print('\nmessage get : ${event.notification!.title}');
        Get.snackbar(
          event.notification!.title.toString(),
          event.notification!.body.toString(),
          onTap: (e) {},
          duration: const Duration(
            seconds: 5,
          ),
          colorText: SchedulerBinding.instance.window.platformBrightness ==
              Brightness.dark
              ? Colors.white
              : Colors.black,
          backgroundColor: SchedulerBinding.instance.window.platformBrightness ==
              Brightness.dark
              ? Colors.black
              : Colors.white,
        );
      });
      await FirebaseMessaging.onMessageOpenedApp.listen((event) {
        print('\nmessage get : ${event.notification!.title}');
      });
       FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
        print('\nmessage get : ${message.notification!.title}');
        Get.snackbar(message.notification!.title!, message.notification!.body!);
      });
    });
  });

}
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
  }
}