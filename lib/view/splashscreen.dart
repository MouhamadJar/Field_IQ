import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/class/constant/images.dart';
import 'package:mandoob/controller/mandoob/api_controller.dart';
import 'package:mandoob/view/chooseuser.dart';

import '../class/constant/const.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void getAccepted()async{
    var response = await DioHelper().isAcceptedByApple().then((value) {
      print('Accept state is : ${value.data}');
      isAcceptedByApple = value.data;
    });
  }
  @override
  void initState() {
    getAccepted();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(AppImages.splashScreen,fit: BoxFit.fill,)
            ),
            AnimatedSplashScreen(
              backgroundColor: Colors.transparent,
              splash: Image.asset(AppImages.logo),
              nextScreen: const ChooseUser(),
              duration: 5000,

              splashTransition: SplashTransition.sizeTransition,
             // pageTransitionType:PageTransitionType.leftToRight,
              animationDuration: const Duration(seconds: 1),
              splashIconSize: 300,

            )
          ],
        ),
      ),
    );
  }
}
