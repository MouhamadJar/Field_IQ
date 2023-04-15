import 'package:get/get.dart';
import 'package:mandoob/controller/mandoob/search_controller.dart';

import '../../class/constant/const.dart';
import '../../models/mandoob/city.dart';


class SettingController extends GetxController with StateMixin {
  RxBool isLoading = false.obs;
  RxString city = ''.obs;

  void setSelected(City value) {
    user.cityName = value.name;
    for (var element in cities) {
      if (element.name == user.cityName) {
        user.cityId = element.id;
      }
    }
    initCityName();
    update();
  }

  void initCityName() {
    for (var element in cities) {
      if (element.name == user.cityName) {
        city.value = element.name;
      }
    }
  }

  void reInitUserData({
    required String name,
    required String companyName,
    required String specialization,
    required String names,
    required String phone,
    required String exp,
    required String cvv,
  }) {
    user.cityName = city.value;
    user.name = name;
    user.company = companyName;
    user.specialization = specialization;
    user.names = names;
    user.phone = phone;
    user.exp = exp;
    user.cvv = cvv;
    for (var element in cities) {
      if (element.name == city.value) {
        user.cityId = element.id;
        user.cityName = city.value;
      }
    }
  }

  Future<void> loadCities() async {
    SearchController controller = Get.put(SearchController());
    await controller.getSearchData().then((value) {
      print('City done');
      change(value, status: RxStatus.success());
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadCities();
    initCityName();
  }
}
