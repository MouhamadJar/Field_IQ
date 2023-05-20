// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as Getx;

import '../../class/constant/const.dart';
import '../../class/constant/end_points.dart';

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
        baseUrl: 'https://field-iraq.com/api',
        receiveDataWhenStatusError: true,
        headers: {
          "Accept": "application/json",
          "Content-type": "application/json",
          "Connection": "keep-alive",
        }),
  );

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

  Future<Response> endInterview({
    required int id,
  }) async {
    Response _response = await dio.post(
      '/end-interview/$id',
      options: Options(
        headers: _getHeaders(true),
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
    required int dayId,
    required int appointmentTimeId,
  }) async {
    return await dio.post(
      EndPoint().SendDoctorAppointment,
      data: {
        'doctor_id': doctorId,
        'appointment_time_id': appointmentTimeId,
        'day_id': dayId,
      },
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

  Future<Response> sendNotificationForDoctors({
    required String doctorId,
    required String doctorName,
    required String reserveDay,
    required String reserveTime,
  }) async {
    return Dio(
      BaseOptions(
          baseUrl: 'https://fcm.googleapis.com/fcm',
          receiveDataWhenStatusError: true,
          headers: {
            "Authorization":
                "key=AAAAaf6_eww:APA91bGK1fqQHMKxWg8gxVnRlK3QmUesxITwKR_xkQaqfF3odfRqt2piOexm31j01DQGMyZEhGpsh2pjNB2Qd25d3QXVhun08eDipS3_2cE22hZgWWyKQaNRoUmqnCNr8aiUcIBZDZR9",
            "Content-type": "application/json; charset=UTF-8",
          }),
    ).post('/send', data: {
      "to": "/topics/$doctorId",
      "notification": {
        "title": doctorName,
        "body":
            "المندوب صاحب الاسم ${user.name} حجز موعد يوم $reserveDay في الساعة $reserveTime 😊",
        "sound": "default"
      },
      "android": {
        "priority": "HIGH",
        "notification": {
          "notification_priority": "PRIORITY_MAX",
          "sound": "default",
          "default_sound": true,
          "default_vibrate_timings": true
        }
      }
    });
  }

  Future<Response> sendNotificationForSellsMens({
    required String sellManName,
  }) async {
    return Dio(
      BaseOptions(
          baseUrl: 'https://fcm.googleapis.com/fcm',
          receiveDataWhenStatusError: true,
          headers: {
            "Authorization":
                "key=AAAAaf6_eww:APA91bGK1fqQHMKxWg8gxVnRlK3QmUesxITwKR_xkQaqfF3odfRqt2piOexm31j01DQGMyZEhGpsh2pjNB2Qd25d3QXVhun08eDipS3_2cE22hZgWWyKQaNRoUmqnCNr8aiUcIBZDZR9",
            "Content-type": "application/json; charset=UTF-8",
          }),
    ).post('/send', data: {
      "to": "/topics/$sellManName",
      "notification": {
        "title": sellManName,
        "body": "يمكنك الان القيام بمقابلتك عبر الانترنت",
        "sound": "default"
      },
      "android": {
        "priority": "HIGH",
        "notification": {
          "notification_priority": "PRIORITY_MAX",
          "sound": "default",
          "default_sound": true,
          "default_vibrate_timings": true
        }
      }
    });
  }
}
