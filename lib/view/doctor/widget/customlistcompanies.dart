import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandoob/view/doctor/screen/onecompanyinfo.dart';

import '../../../class/constant/colors.dart';
import '../../../controller/doctor/homepagedoctorcontroller.dart';
import '../../../models/doctor/homedoctor/Data.dart';
import '../../../models/doctor/homedoctor/HomeDoctorModel.dart';
import '../screen/salesmanforoncompany.dart';
import 'customlistsalesmanforcompany.dart';

class CustomListCompanies extends GetView<HomePageDoctorController> {
  const CustomListCompanies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageDoctorController controller = Get.put(HomePageDoctorController());
    return controller.obx(
      (data)=> Expanded(
        child: ListView.separated(
            separatorBuilder: (context, i) =>const  SizedBox(
              height: 10,
            ),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.homeList.length,
            itemBuilder: (context, i) {
              return  CompaniesList(data: controller.homeList[i],);
            }),
      ),
    );
  }
}

class CompaniesList extends StatelessWidget {
  final Data data;
  const CompaniesList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=>  SalesManForOneCompany(companyName: data.companyName,));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow:  [
              BoxShadow(
                  color: AppColor.hintText,
                  blurRadius: 5.5,
                  offset: Offset(0, 2)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Container(
                  width: 13,
                  height: 13,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.secondaryColor),
                ),
                 Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    data.companyName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

