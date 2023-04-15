import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/mandoob/city.dart';
import 'search_controller.dart';

class MandoobSignUPController extends GetxController with StateMixin{
  final typeSelectedComp= 'Bayer'.obs;
   Rx<City> typeSelected = City(name: '',id: 5000).obs ;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController cardNumber;
  late TextEditingController exp;
  late TextEditingController officename;
  late TextEditingController line;
  late TextEditingController substancesnames;
  late TextEditingController companyName;
  RxBool isLoading = false.obs;
  bool isShowPassword = true;

  void setSelected(City value){
    typeSelected.value =  value ;
    update();
  }

  void setSelectedComp(String value){
    typeSelectedComp.value =  value ;
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  Future<void> onInit() async {
    name = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    cardNumber = TextEditingController();
    officename = TextEditingController();
    line = TextEditingController();
    substancesnames = TextEditingController();
    exp = TextEditingController();
    companyName = TextEditingController();
    SearchController controller = Get.put(SearchController());
    await controller.getSearchData().then((value) {
      print('City done');
    change(value ,status: RxStatus.success());
    });

    super.onInit();
  }


  final List compItems= [
    'Bayer',
    'Astrazenca',
    'Pioneer',
    'Hikma',
  ];

  final List items = [
    'Baghdad',
    'Item255',
    'Item3520',
    'Item441',
  ];

  @override
  void dispose() {
    name.dispose();
    password.dispose();
    phone.dispose();
    cardNumber.dispose();
    exp.dispose();
    line.dispose();
    substancesnames.dispose();
    officename.dispose();
    super.dispose();
  }


}

