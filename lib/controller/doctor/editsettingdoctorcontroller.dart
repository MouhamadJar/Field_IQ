import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandoob/class/services/services.dart';
import 'package:mandoob/view/doctor/screen/homescreen.dart';

import 'dart:io';

import '../../class/constant/colors.dart';
import 'package:dio/dio.dart' as dio;
import '../../class/dio.dart';
import '../../models/doctor/City_model.dart';

class EditSettingDoctorController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController specialization;
  late TextEditingController cardNumber;
  late TextEditingController cvv;
  late TextEditingController exp;
  final ImagePicker photo = ImagePicker();
   XFile? imagesID;
   File? ID;
  bool isShowPassword = true;
  List<CityModel> cityList = [];
  final Rx<CityModel> cityTypeSelected = CityModel(id: 1, name: '').obs;
  RxBool isLoading = true.obs;
  MyServices myServices = Get.find();

  dynamic setSelected(CityModel? value) {
    cityList.forEach((element) {
      if (element == value) {
        cityTypeSelected.value = element;
        update();
      }
    });
    print(cityTypeSelected.value.id.toString());
    //cityTypeSelected.value =  value;
  }

  Future<XFile?> selectMultipleImageID() async {
    imagesID = (await photo.pickImage(source: ImageSource.gallery))!;

    if (imagesID != null) {
      ID = File(imagesID!.path);
      update();
    }

    return imagesID;
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  getCity() {
    DioHelper.getCityDoctor().then((value) {
      print('!!!!!!!!!!!!!! city !!!!!!!!!');
      var response = value.data;
      response.forEach((city) {
        cityList.add(CityModel.fromJson(city));
      });
      cityTypeSelected.value.name = cityList.first.name;
      print(cityList.first.name);
      isLoading = false.obs;
      update();
      print(cityList);
      print(isLoading.toString());
      print(value.data[0]['name']);
    }).catchError((onError) {
      print('errot is :' + onError.toString());
    });
  }

  updateProfile(String nameModel, String phoneModel, String specializationModel,
      String cardNumberModel, String expModel) async {
    print(name.text);
    print(phone.text);
    print(specialization.text);
    print(exp.text);
    print(cardNumber.text);
    print(cityTypeSelected.value.id.toString());
    print(password.text);
    DioHelper.updateProfileDoctor(data: {
      'full_name': name.text.isEmpty ? nameModel : name.text,
      'phone': phone.text.isEmpty ? phoneModel : phone.text,
      'specialization': specialization.text.isEmpty
          ? specializationModel
          : specialization.text,
      'exp': exp.text.isEmpty ? expModel : exp.text,
      'cvv': cardNumber.text.isEmpty ? cardNumberModel : cardNumber.text,


      'city_id': cityTypeSelected.value.id.toString(),
      'password': password.text,
      'payment_method_id': '1',
      if(imagesID!= null)
        'image': await dio.MultipartFile.fromFile(ID!.path),
    }, token: myServices.sharedPreferences.getString('token'))
        .then((value) {
      print(value.toString());
      Get.offAll(HomeScreenDoctor());
      Get.snackbar(
        'Alert'.tr,
        "Your Profile has een updated".tr,
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.line,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.black,
        duration: const Duration(seconds: 6),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }).catchError((onError) {
      print("error is " + onError.toString());
    });
  }

  @override
  void onInit() {
    name = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    specialization = TextEditingController();
    cardNumber = TextEditingController();
    cvv = TextEditingController();
    exp = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    password.dispose();
    phone.dispose();
    specialization.dispose();
    cardNumber.dispose();
    cvv.dispose();
    exp.dispose();
    super.dispose();
  }
}
