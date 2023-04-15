import 'package:flutter/material.dart';

import '../../../class/constant/colors.dart';
import 'customlistmaterialname.dart';

class CustomRowMaterialNames extends StatelessWidget {
  final String text;
  const CustomRowMaterialNames({Key? key, required this.text, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                CustomListMaterialName(),
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
