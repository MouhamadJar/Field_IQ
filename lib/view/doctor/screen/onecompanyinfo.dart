import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/constant/colors.dart';
import '../../../models/doctor/salesmancompany/SalesManByCompany.dart';
import '../widget/customrowmaterialnames.dart';
import '../widget/cutomrowcompanydetails.dart';

class OneCompanyInfo extends StatelessWidget {
  final SalesManByCompany salesManByCompany;
  const OneCompanyInfo({Key? key, required this.salesManByCompany}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5.0,
          leading:  InkWell(
            onTap: (){Get.back();},
            child: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColor.primaryColor,
              size: 20.0,
            ),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Container(
                    width: 257,
                    height: 59,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:  Center(
                      child: Text(
                        salesManByCompany.company,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomRowCompanyDetails(text: 'Name'.tr, info: salesManByCompany.name),
                CustomRowCompanyDetails(text: 'Governorate'.tr, info: salesManByCompany.city.name),
                CustomRowCompanyDetails(text: 'Phone'.tr, info: salesManByCompany.phone),
                CustomRowCompanyDetails(text: 'Specialization'.tr, info: salesManByCompany.specialization),
                CustomRowCompanyDetails(text: 'Office Name'.tr, info: salesManByCompany.officeName),
                CustomRowCompanyDetails(text: 'Material Names'.tr, info: salesManByCompany.names),

                //CustomRowMaterialNames(text: 'Material Names'.tr, ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
