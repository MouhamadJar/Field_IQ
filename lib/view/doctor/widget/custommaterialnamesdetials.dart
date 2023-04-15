import 'package:flutter/material.dart';

import '../../../class/constant/colors.dart';
import 'customlistmaterialname.dart';

class CustomMaterialNamesDetails extends StatelessWidget {
  final String text;
  const CustomMaterialNamesDetails({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                const CustomListMaterialName(),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 3,
              decoration: const BoxDecoration(
                  color: AppColor.line
              ),
            ),
          )
        ],
      ),
    );
  }
}
