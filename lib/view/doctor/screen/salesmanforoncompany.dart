import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../class/constant/colors.dart';
import '../../../class/constant/images.dart';
import '../../../controller/doctor/salesmanforcompanycontroller.dart';
import '../widget/customlistsalesmanforcompany.dart';
import 'finalinterviews.dart';

class SalesManForOneCompany extends GetView<SalesManForCompanyController> {
  final String companyName;
  const SalesManForOneCompany({Key? key, required this.companyName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SalesManForCompanyController controller = Get.put(SalesManForCompanyController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: (){
              Get.to(()=> const  FinalInterviewsScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: SvgPicture.asset(
                AppImages.interviewIcon,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(
            companyName,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          centerTitle: true,
          actions: [
            InkWell(
                onTap: (){
                  Get.back();
                },
                child: const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(Icons.arrow_forward_ios,color: AppColor.primaryColor,size: 20,),
                ))
          ],
        ),
        body: GetBuilder<SalesManForCompanyController>(
          initState: (state){
            print(companyName);
            controller.getSalesMan(companyName);
          },
          builder: (controller)=>
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8),
            child: Column(
              children:const  [
                CustomListSalesManForCompany(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
