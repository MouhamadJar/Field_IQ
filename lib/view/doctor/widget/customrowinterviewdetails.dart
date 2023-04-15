import 'package:flutter/material.dart';

import '../../../class/constant/colors.dart';

class CustomInterviewDetails extends StatelessWidget {
  final String text;
  final String info;
  const CustomInterviewDetails({Key? key, required this.text, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.secondaryColor),
                  ),
                ),
                Text(
                  text,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14
                  ),
                ),
                const  Spacer(),
                Text(
                  info,
                  style:  const TextStyle(
                      color: Colors.black,
                      fontSize: 14
                  ),
                )
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
