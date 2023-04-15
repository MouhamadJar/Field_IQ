import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandoob/class/dio.dart';
import 'package:mandoob/controller/doctor/doctorsignupcontroller.dart';

import '../../../class/constant/colors.dart';

class CustomRowGov extends StatelessWidget {
  const CustomRowGov({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctorSignUpController controller = Get.put(DoctorSignUpController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Governorate'.tr,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          const Spacer(),
          // FutureBuilder(
          //     future: DioHelper.getCity(),
          //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //       if (snapshot.hasData) {
          //         var response = snapshot.data;
          //         print(response.toString());
          //         controller.cityList = response.data;
          //         print(controller.cityList[0].toString());
          //         return Obx(
          //           () => DropdownButtonHideUnderline(
          //             child: DropdownButton2(
          //               isExpanded: true,
          //               style: const TextStyle(
          //                 color: AppColor.black,
          //                 fontSize: 12,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //               customButton: Container(
          //                 height: 40,
          //                 width: 228,
          //                 decoration: BoxDecoration(
          //                   border: Border.all(
          //                     color: AppColor.primaryColor,
          //                     width: 1,
          //                   ),
          //                   borderRadius: const BorderRadius.all(
          //                     Radius.circular(5),
          //                   ),
          //                 ),
          //                 child: Row(
          //                   children: [
          //                     Padding(
          //                       padding:
          //                           const EdgeInsets.symmetric(horizontal: 8.0),
          //                       child: Text(
          //                         controller.cityTypeSelected.value ?? "",
          //                       ),
          //                     ),
          //                     const Icon(
          //                       Icons.arrow_drop_down,
          //                       color: AppColor.primaryColor,
          //                       size: 16,
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               items: controller.cityList.map((item) {
          //                 return DropdownMenuItem(
          //                   value: item['id'],
          //                   alignment: Alignment.center,
          //                   child: Text(item['name']),
          //                 );
          //               }).toList(),
          //               onChanged: (value) {
          //                 controller.setSelected(value.toString());
          //               },
          //             ),
          //           ),
          //         );
          //       }
          //       if (snapshot.hasError) {
          //         return const Center(
          //           child: Text('Internet Connection Error'),
          //         );
          //       }
          //
          //       return const Center(
          //           child: CircularProgressIndicator(
          //         color: AppColor.primaryColor,
          //       ));
          //     })
          GetBuilder<DoctorSignUpController>(initState: (state) {
            controller.getCity();
          }, builder: (control) {
            return controller.isLoading.value
                ? Container(
                    height: 40,
                    width: 228,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.primaryColor,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: AppColor.primaryColor,
                      size: 16,
                    ),
                  )
                : DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      customButton: Container(
                        height: 40,
                        width: 228,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.primaryColor,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                controller.cityTypeSelected.value.name ?? "",
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: AppColor.primaryColor,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                      items: controller.cityList.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          alignment: Alignment.center,
                          child: Text(item.name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.setSelected(value);
                      },
                    ),
                  );
          }),
          // Obx( ()   {
          //   controller.getCity();
          //   return controller.isLoading.value ?Container(
          //     height: 40,
          //     width: 228,
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //         color: AppColor.primaryColor,
          //         width: 1,
          //       ),
          //       borderRadius: const BorderRadius.all(
          //         Radius.circular(5),
          //       ),
          //     ),
          //     child:const  Icon(Icons.arrow_drop_down,
          //       color: AppColor.primaryColor,
          //       size: 16,),
          //   ) : DropdownButtonHideUnderline(
          //     child: DropdownButton2(
          //       isExpanded: true,
          //       style: const TextStyle(
          //         color: AppColor.black,
          //         fontSize: 12,
          //         fontWeight: FontWeight.w500,
          //       ),
          //       customButton: Container(
          //         height: 40,
          //         width: 228,
          //         decoration: BoxDecoration(
          //           border: Border.all(
          //             color: AppColor.primaryColor,
          //             width: 1,
          //           ),
          //           borderRadius: const BorderRadius.all(
          //             Radius.circular(5),
          //           ),
          //         ),
          //         child: Row(
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //               child: Text(
          //                 controller.cityTypeSelected.value ?? "",
          //               ),
          //             ),
          //             const Icon(
          //               Icons.arrow_drop_down,
          //               color: AppColor.primaryColor,
          //               size: 16,
          //             ),
          //           ],
          //         ),
          //       ),
          //       items: controller.cityList.map((item) {
          //         return DropdownMenuItem(
          //           value: item.id,
          //           alignment: Alignment.center,
          //           child: Text(item.name),
          //         );
          //       }).toList(),
          //       onChanged: (value) {
          //         controller.setSelected(value.toString());
          //       },
          //     ),
          //   );
          //
          //
          // })
        ],
      ),
    );
  }
}
