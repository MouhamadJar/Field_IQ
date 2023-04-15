import 'package:get/get.dart';

import '../../class/constant/const.dart';
import '../../models/mandoob/sells_man_model.dart';
import 'api_controller.dart';

class UserController extends GetxController with StateMixin<dynamic> {
  Future<dynamic> loadProfileData () async {
    DioHelper().getProfile().then((value) {
      print(value.toString());
      user = SellManModel.fromJson(value.data['data'][0]);
      change(user , status: RxStatus.success());
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadProfileData();
  }
}