import 'package:flutter/material.dart';
import 'package:mandoob/class/constant/images.dart';

import '../../../class/constant/colors.dart';

class CustomImageSetting extends StatelessWidget {
  final String text ;
  final String urlImage;
  const CustomImageSetting({Key? key, required this.text, required this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          const Spacer(),
          Container(
            width: 180,
            height: 134,
            decoration:const  BoxDecoration(
              color: AppColor.silver,

            ) ,
             child: Image.network(
               "${AppImages.imageUrl}/$urlImage",
               fit: BoxFit.fill,
             ),
          )

        ],
      ),
    );
  }
}
