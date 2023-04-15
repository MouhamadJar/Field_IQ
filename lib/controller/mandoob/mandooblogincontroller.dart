import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api_controller.dart';

class MandoobLoginController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController phone;
  bool isShowPassword = true;
  RxBool isLoading = false.obs;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  DioHelper api = DioHelper();

  @override
  void onInit() {
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    phone.dispose();
    super.dispose();
  }
}
