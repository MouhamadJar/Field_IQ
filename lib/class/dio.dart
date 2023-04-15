import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:mandoob/class/constant/apilink.dart';
import 'package:get/get.dart' as Getx;

import 'constant/colors.dart';
import 'constant/end_points.dart';

class DioHelper {
  Map<String, String>? _getHeaders(withAuth) {
    return withAuth
        ? {
            'Accept': 'application/json',
            'Authorization': 'Bearer $kToken',
          }
        : {
            'Accept': 'application/json',
          };
  }

  static Dio dio = Dio(
    BaseOptions(
        baseUrl: 'https://aurora-team.com',
        receiveDataWhenStatusError: true,
        headers: {
          "Accept": "application/json",
          "Content-type": "application/json",
          "Connection": 'keep-alive',
        }),
  );

  static Future<Response> signUpDoctor({
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      AppLink.SIGNUP,
      data: FormData.fromMap(data),
    );
  }

  static Future<dynamic> loginDoctor({
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await dio.post(
        AppLink.LOGIN,
        data: data,
      );
      return response;
    } on DioError catch (error) {
      print(error.response?.data);
      getx.Get.snackbar(
        'Alert'.tr,
        error.response?.data,
        snackPosition: getx.SnackPosition.TOP,
        backgroundColor: AppColor.line,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.black,
        duration: const Duration(seconds: 6),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

  static Future<Response> available(
      {required Map<String, dynamic> data, required String? token}) async {
    return await dio.post(AppLink.AVAILABLE,
        data: data,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
  }

  static Future<Response> homeDoctor(String? token) async {
    return await dio.get(AppLink.HOMEDOCTOR,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
  }

  static Future<Response> doctorProfile(String? token) async {
    return await dio.get(AppLink.DOCTORPOFILE,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
  }

  static Future<Response> logoutDoctor(String? token) async {
    return await dio.get(AppLink.LOGOUT,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
  }

  static Future<Response> getCityDoctor() async {
    return await dio.get(
      AppLink.CITY,
    );
  }

  static Future<Response> updateProfileDoctor(
      {required Map<String, dynamic> data, required String? token}) async {
    return await dio.post(AppLink.UPDATEPROFILE,
        queryParameters: data,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
  }

  static Future<Response> addInterviewDoctor(
      {required Map<String, dynamic> data, required String? token}) async {
    return await dio.post(AppLink.ADDINTERVIEW,
        data: data,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
  }

  static Future<dynamic> editInterviewDoctor(
      {required Map<String, dynamic> data,
      required String? token,
      required int id}) async {
    try {
      return await dio.put(AppLink.EDITINTERVIEW(id),
          queryParameters: data,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
    } on DioError catch (error) {
      print(error.response!.data.toString());
    }
  }

  static Future<Response> getSalesManByCompanyDoctor(
      String? token, String company) async {
    return await dio.get(AppLink.GETSALESMANBYCOMPANY(company),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
  }

  static Future<Response> getInterviewDoctor(String? token) async {
    return await dio.get(AppLink.GETINTERVIEW,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
  }

  static Future<Response> getInterviewSalesManDoctor(String? token) async {
    return await dio.get(AppLink.GETINTERVIEWSALESMAN,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
  }

  static Future<Response> getDaysDoctor(String? token) async {
    return await dio.get(AppLink.GETDAYS,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
  }

  Future<Response> login({
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      EndPoint().Login,
      data: data,
    );
  }

  Future<Response> signup({
    required Map<String, dynamic> data,
  }) async {
    Response _response = await dio.post(
      EndPoint().Signup,
      data: data,
      options: Options(
        headers: _getHeaders(false),
      ),
    );
    return _response;
  }

  Future<dynamic> updateProfile({
    cityId,
    companyName,
    name,
    phone,
    password,
    officeName,
    specialization,
    names,
  }) async {
    try {
      Response response = await dio
          .post(
        EndPoint().UpdateProfile,
        data: {
          'city_id': cityId,
          'company': companyName,
          'name': name,
          'phone': phone,
          'office_name': officeName,
          'specialization': specialization,
          'names': names,
          'password': password,
        },
        options: Options(
          headers: _getHeaders(true),
        ),
      )
          .then((value) {
        return value;
      });
    } on DioError catch (error) {
      print(error.toString());
      Getx.Get.snackbar(
        'Ops',
        'Please Check your connection',
        backgroundColor: Colors.redAccent.withOpacity(0.5),
      );
      print(error.response?.data);
    }
  }

  Future<Response> getCities() async {
    return await dio.get(
      EndPoint().GetCities,
      options: Options(
        headers: _getHeaders(false),
      ),
    );
  }

  Future<Response> getMyReservation() async {
    return await dio.get(
      EndPoint().GetReservations,
      options: Options(
        headers: _getHeaders(true),
      ),
    );
  }

  Future<Response> getDoctorsByCity({
    required dynamic data,
  }) async {
    return await dio.get(
      EndPoint().GetDoctorsByCity,
      queryParameters: data,
      options: Options(
        headers: _getHeaders(true),
      ),
    );
  }

  Future<Response> getSearchData() async {
    Response _response = await dio.get(
      EndPoint().SearchForDoctorName,
      options: Options(
        headers: _getHeaders(true),
      ),
    );
    if (_response.statusCode! > 399) {
      /// Error State
      debugPrint(
        '\nError :\n${jsonDecode(_response.data).toString()}\nWith status code : ${_response.statusCode}',
      );
      Getx.Get.snackbar(
        'ops',
        'error message',
        backgroundColor: Colors.redAccent.withOpacity(0.5),
      );
    } else {
      /// Success State
      debugPrint(
        '\nData is :\n${jsonDecode(_response.data).toString()}\nWith status code : ${_response.statusCode}',
      );
      Getx.Get.snackbar(
        'Done',
        'done message',
        backgroundColor: Colors.redAccent.withOpacity(0.5),
      );
    }
    return _response;
  }

  Future<Response> getDoctorData({
    required int doctorId,
  }) async {
    Response _response = await dio.get(
      '${EndPoint().GetDoctorData}$doctorId',
      options: Options(
        headers: _getHeaders(true),
      ),
    );
    if (_response.statusCode! > 399) {
      /// Error State
      debugPrint(
        '\nError :\n${jsonDecode(_response.data).toString()}\nWith status code : ${_response.statusCode}',
      );
      Getx.Get.snackbar(
        'ops',
        'error message',
        backgroundColor: Colors.redAccent.withOpacity(0.5),
      );
    } else {
      /// Success State
      debugPrint(
        '\nData is :\n${jsonDecode(_response.data).toString()}\nWith status code : ${_response.statusCode}',
      );
      Getx.Get.snackbar(
        'Done',
        'done message',
        backgroundColor: Colors.redAccent.withOpacity(0.5),
      );
    }
    return _response;
  }

  Future<Response> sendAppointment({
    required int doctorId,
    required int appointmentTimeId,
  }) async {
    return await dio.post(
      EndPoint().SendDoctorAppointment,
      data: {'doctor_id': doctorId, 'appointment_time_id': appointmentTimeId},
      options: Options(
        headers: _getHeaders(true),
      ),
    );
  }

  Future<Response> getProfile() async {
    return await dio.get(
      EndPoint().GetProfile,
      options: Options(
        headers: _getHeaders(true),
      ),
    );
  }

  Future<Response> getPaymentID({
    required String jwt,
  }) async {
    return Dio(
      BaseOptions(
          baseUrl: 'https://test.zaincash.iq/transaction',
          receiveDataWhenStatusError: true,
          headers: {
            "Content-type": "application/json",
          }),
    ).post('/init', data: {
      'token': jwt,
      'merchantId': '5ffacf6612b5777c6d44266f',
      'lang': 'en'
    });
  }
}
