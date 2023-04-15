
import 'package:firebase_messaging/firebase_messaging.dart';
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
    await FirebaseMessaging.instance.subscribeToTopic(doctorId).then((value) {
      print('done');
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