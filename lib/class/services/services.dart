import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/const.dart';
import '../constant/end_points.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {

    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }


}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
  MyServices service = Get.find();
  kToken = service.sharedPreferences.getString('mToken') ?? 'noToken';
  kDoctorToken = service.sharedPreferences.getString('token') ?? 'noToken';
  kLanguage = service.sharedPreferences.getString('language') ?? 'English';
  if (kLanguage == 'Arabic') {
    Get.updateLocale(const Locale('ar'));
  } else if (kLanguage == 'English') {
    Get.updateLocale(const Locale('en'));
  } else {
    Get.updateLocale(const Locale('ku'));
  }
}
initFireBase () async {
  await Firebase.initializeApp();

  FirebaseMessaging.onMessage.listen((event) {
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
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('\nmessage get : ${event.notification!.title}');
  });
  FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
    print('\nmessage get : ${message.notification!.title}');
    Get.snackbar(message.notification!.title!, message.notification!.body!);
  });
}
