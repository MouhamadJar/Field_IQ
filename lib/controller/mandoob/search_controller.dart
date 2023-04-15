import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../class/constant/const.dart';
import '../../models/mandoob/city.dart';
import 'api_controller.dart';

class SearchController extends GetxController {
  DioHelper apiController = DioHelper();

  Future<dynamic> getSearchData() async {
    if(cities.isEmpty) {
      await apiController.getCities().then((value) {
      value.data.forEach((city) {
        cities.add(City.fromJson(city));
      });
      debugPrint('Cities add successfully');
      update();
    }, onError: (error) {});
    }
  }
}
