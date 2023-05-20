import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:mandoob/class/constant/const.dart';
import 'package:mandoob/class/services/services.dart';
import '../../class/constant/colors.dart';
import '../../class/dio.dart';
import '../../models/doctor/City_model.dart';
import '../../view/doctor/screen/doctorlogin.dart';

class DoctorSignUpController extends GetxController {
  final typeSelectedLang = 'Arabic'.tr.obs;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController specialization;
  late TextEditingController cardNumber;
  late TextEditingController cvv;
  late TextEditingController exp;
  bool isShowPassword = true;
  final ImagePicker photo = ImagePicker();
  late final XFile imagesID;
  late final File ID;
  List<CityModel> cityList = [];
  final Rx<CityModel> cityTypeSelected = CityModel(id: 5, name: '').obs;
  RxBool isLoading = true.obs;
  MyServices myServices = Get .find();


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

  signUp() async {
    if (formState.currentState!.validate()) {
      DioHelper.signUpDoctor(data: {
        'city_id': cityTypeSelected.value.id.toString(),
        'payment_method_id': '1',
        'full_name': name.text,
        'phone': phone.text,
        'specialization': specialization.text,
        'password': password.text,
        'exp': exp.text,
        'cvv': cardNumber.text,
        'image': await dio.MultipartFile.fromFile(ID.path)
      }).then((value) {
        print(value.toString());
        myServices.sharedPreferences.setString('lang', typeSelectedLang.value);
        myServices.sharedPreferences.setString('step', '1');
        Get.offAll(() => DoctorLogin());
        Get.snackbar(
          'Alert'.tr,
          "Your Request is Processing".tr,
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
      })
          .catchError((onError) {
        print(onError);
        Get.defaultDialog(
          title: 'Alert '.tr,
          middleText: 'The phone has already been taken. '.tr,
        );
      });
    }
  }

  getCity() {
    DioHelper.getCityDoctor().then((value) {
      print('!!!!!!!!!!!!!! city !!!!!!!!!');
      var response = value.data;
      response.forEach((city) {
        cityList.add(CityModel.fromJson(city));
      });
      cityTypeSelected.value.name = cityList.first.name;
      cityTypeSelected.value.id = cityList.first.id;
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

  void setSelectedLang(String value) {
    kLanguage = value;
    if (kLanguage == 'Arabic') {
      Get.updateLocale(const Locale('ar'));
    } else if (kLanguage == 'English') {
      Get.updateLocale(const Locale('en'));
    } else {
      Get.updateLocale(const Locale('ku'));
    }
  }

  Future<XFile> selectMultipleImageID() async {
    imagesID = (await photo.pickImage(source: ImageSource.gallery))!;
    ID = File(imagesID.path);
    update();
    return imagesID;
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  final List lang = [
    'Arabic'.tr,
    'English'.tr,
    'Kurd'.tr,
  ];

  @override
  void onInit() async {
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
