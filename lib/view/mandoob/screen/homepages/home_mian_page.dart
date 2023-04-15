import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../class/component.dart';
import '../../../../class/constant/colors.dart';
import '../../../../class/constant/const.dart';
import '../../../../controller/mandoob/home_screen_controller.dart';
import '../../../../models/mandoob/city.dart';

class HomeMainPage extends GetView<HomeScreenController> {
  const HomeMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .02),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Get.width * .035,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 2.0,
                          offset: const Offset(0, 2),
                        ),
                      ]),
                  width: Get.width * .7,
                  height: Get.height * .05,
                  child: TextFormField(
                    onChanged: (query){
                      controller.searchForDoctor(query);
                    },
                    decoration: InputDecoration(
                      labelText: 'search for doctor\'s name'.tr,
                      fillColor: AppColor.line,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xffC7C5C5),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xffC7C5C5),
                          )),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * .25,
                  height: Get.height * .07,
                  child: controller.obx(
                    (state) => DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Text(
                          cities[controller.cityIndex.value].name,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: cities
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item.name,
                                child: Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          late City newCity;
                          for (int i = 0; i < cities.length; i++) {
                            if (cities[i].name == value) {
                              newCity = cities[i];
                              controller.changeGov(
                                newCity: newCity,
                                index: i,
                              );
                            }
                          }
                        },
                        // buttonHeight: 40,
                        // buttonWidth: 140,
                        // itemHeight: 40,
                      ),
                    ),
                    onLoading: Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: AppColor.hintText,
                      child: Container(
                        width: Get.width * .25,
                        height: Get.height * .07,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            controller.obx(
              (data) => SizedBox(
                height: doctors.isEmpty
                    ? Get.height * 05
                    : (200) * doctors.length.toDouble(),
                width: Get.width,
                child: doctors.isEmpty
                    ? const Center(
                        child: Text('No result'),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.doctor.length,
                        itemBuilder: (context, index) => DoctorCard(
                          doctorDetails: controller.doctor[index],
                        ),
                      ),
              ),
              onError: (error) => const Center(
                child: Text('Please Check Your Connection.'),
              ),
              onLoading: Column(
                children: const [
                  DoctorCardShimmer(),
                  DoctorCardShimmer(),
                  DoctorCardShimmer(),
                  DoctorCardShimmer(),
                  DoctorCardShimmer(),
                ],
              ),
              onEmpty: const Center(
                child: Text('No result'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
