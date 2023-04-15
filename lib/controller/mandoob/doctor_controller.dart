import 'package:get/get.dart';
import 'payment_controller.dart';
import '../../view/mandoob/screen/payment_screen.dart';
import 'api_controller.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class ReserveController extends GetxController with StateMixin {
  RxBool isLoading = false.obs;
  RxInt fees = 0.obs;
  String generateJwt({
    required int amount,
    required int orderId,
  }) {
    print(amount.toString());
    final jwt = JWT(
        {
          'amount' : amount ,
          'serviceType': "AAA books website",
          'msisdn': "9647835077893",
          'orderId': orderId,
          'redirectUrl': "https://YOUR-WEBSITE.com/payment/redirect",
        }
    );

    final token = jwt.sign(SecretKey('\$2y\$10\$hBbAZo2GfSSvyqAyV2SaqOfYewgYpfR1O19gIh4SqyGWdmySZYPuS'));

    print('Signed token: $token\n');
    return token;
  }

  void openPaymentUrl ({required  String id}) {
    Get.put(PaymentController('https://test.zaincash.iq/transaction/pay?id=$id'));
    Get.to(()=>const PaymentScreen());
  }
  Future<dynamic> reserve({
    required int doctorId,
    required int amount,
    required String doctorName,
    required int appointmentTimeId,
    required int appointmentId,
    required String reserveDay,
    required String reserveTime,
  }) async {
    change('', status: RxStatus.loading());
    // String jwt = generateJwt(amount: amount, orderId: appointmentId);
    // dio.DioHelper().getPaymentID(jwt: jwt).then((value) {
    //   print(value.data.toString());
    //   print(value.data["id"].toString());
    //   openPaymentUrl(id: value.data["id"].toString());
    //   change('', status: RxStatus.success());
    // });
    DioHelper()
        .sendAppointment(
            doctorId: doctorId, appointmentTimeId: appointmentTimeId)
        .then(
            (resp) => {
                  DioHelper()
                      .sendNotification(
                    doctorName: doctorName,
                          doctorId: doctorId.toString(),
                          reserveDay: reserveDay,
                          reserveTime: reserveTime)
                      .then((value) {
                    Get.snackbar('Done', resp.data.toString());
                    change('', status: RxStatus.success());
                  }),
                }, onError: (error) {
      Get.snackbar('Ops', 'Please Check your internet connection');
      change('', status: RxStatus.success());
    });
  }

  @override
  void onInit() {
    change('', status: RxStatus.success());
    super.onInit();
  }
}
