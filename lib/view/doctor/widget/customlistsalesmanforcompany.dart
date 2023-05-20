import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/constant/colors.dart';
import '../../../controller/doctor/salesmanforcompanycontroller.dart';
import '../../../models/doctor/salesmancompany/SalesManByCompany.dart';
import '../screen/onecompanyinfo.dart';

class CustomListSalesManForCompany extends StatelessWidget {
  const CustomListSalesManForCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SalesManForCompanyController controller = Get.put(SalesManForCompanyController());
    return controller.obx(
      (data)=> Expanded(
        child: ListView.separated(
            separatorBuilder: (context, i) => const SizedBox(
                  height: 10,
                ),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.salesMan.length,
            itemBuilder: (context, i) {
              return  SalesManList(salesManByCompany: controller.salesMan[i],);
            }),
      ),
    );
  }
}

class SalesManList extends StatelessWidget {
  final SalesManByCompany salesManByCompany;
  const SalesManList({Key? key, required this.salesManByCompany}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() =>  OneCompanyInfo(salesManByCompany: salesManByCompany,));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColor.hintText,
                  blurRadius: 5.5,
                  offset: Offset(2, 2)),
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
                      shape: BoxShape.circle, color: AppColor.secondaryColor),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Customer Name'.tr,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              salesManByCompany.name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Office Name'.tr,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                           const SizedBox(
                             width: 10,
                           ),
                           Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              salesManByCompany.officeName,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
