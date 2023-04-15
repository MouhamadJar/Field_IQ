import 'package:get/get.dart';
import 'package:mandoob/class/services/services.dart';

import '../../class/dio.dart';
import '../../models/doctor/salesmancompany/SalesManByCompany.dart';

class SalesManForCompanyController extends GetxController  with StateMixin<dynamic>{
  MyServices myServices = Get.find();
  List<SalesManByCompany> salesMan = [];
  late String company;

  Future<void> getSalesMan(String company) async{
    print('company');
    print(company);
    DioHelper.getSalesManByCompanyDoctor(myServices.sharedPreferences.getString("token"), company).then(
            (value) {
          print('++++ Sales Man BY Company ++++');
          print(value.data);
          value.data.forEach((item) {
            salesMan.add(SalesManByCompany.fromJson(item));
          });
          print('++++++ model is "+++');
          print(salesMan);
          change('value', status: RxStatus.success());
        }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });

  }

  @override
  void onInit() {
    //getSalesMan();
    super.onInit();
  }
}