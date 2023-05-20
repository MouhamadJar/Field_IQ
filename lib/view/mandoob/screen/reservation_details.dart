import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mandoob/controller/mandoob/api_controller.dart';
import 'package:mandoob/view/mandoob/screen/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../class/component.dart';
import '../../../models/mandoob/reservation_model.dart';
import '../../doctor/screen/listwaitiangdetailsdoctor.dart';

class ReservationDetails extends StatelessWidget {
  const ReservationDetails({Key? key, required this.reservation})
      : super(key: key);
  final ReservationModel reservation;

  @override
  Widget build(BuildContext context) {
    void launchWhatsApp({required String number}) async {
      final Uri whatsappLaunchUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: '/$number/',
      query: 'com.whatsapp',
    );
     await launchUrl(whatsappLaunchUri,mode: LaunchMode.externalApplication);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          actions: const [
            MyBackButton(),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReservationDetailsRow(
                  value: reservation.doctorName,
                  title: 'Name',
                ),
                ReservationDetailsRow(
                    value: reservation.phone, title: 'Phone Number'),
                ReservationDetailsRow(
                    value: reservation.specialization, title: 'Specialization'),
                ReservationDetailsRow(
                    value: reservation.paymentMethod, title: 'Receiving Method'),
                ReservationDetailsRow(value: reservation.cvv, title: 'CVV'),
                ReservationDetailsRow(
                    value: reservation.price.toString(), title: 'Fees'),
                ReservationDetailsRow(
                    value: '${reservation.day}  ${splitTime(reservation.time)}',
                    title: 'Meeting time'),
                MyButton(
                  title: 'Payment Done',
                  buttonColor: const Color(0xff49F872),
                  onTap: () {},
                  hasShadow: false,
                ),
                if(!(reservation.kindOfVisite == 'In Person'))
                  SizedBox(
                    child: Text('This is online meet, Contact Doctor in whatsapp'),
                  ),
                GestureDetector(
                  onTap: () {
                    launchWhatsApp(number: reservation.phone);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/images/whatsapp.svg'),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Text('Contact Doctor in whatsapp'.tr),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    print('\nid: ${reservation.interviewId}');
                    DioHelper().endInterview(id: reservation.interviewId).then((value) {
                      Get.offAll(HomeScreen());
                      Get.snackbar('Done', 'Thanks for Using our app');
                    },
                      onError: (error){
                      print(error.toString());
                      Get.snackbar('Ops', 'Please check your internet',backgroundColor: Colors.red.withOpacity(0.4));
                      }
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 50),
                    margin: EdgeInsets.symmetric(horizontal: Get.width*.1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 4,offset: Offset(0,3))]
                    ),
                    alignment: Alignment.center,
                    child: Text('End Interview',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
