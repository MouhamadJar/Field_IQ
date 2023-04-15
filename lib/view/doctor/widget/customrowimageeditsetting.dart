import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../class/constant/colors.dart';
import '../../../class/constant/images.dart';

class CustomRowImageEditSetting extends StatelessWidget {
  final String text;
  final Function() onTap;
  final String urlImage;
  const CustomRowImageEditSetting({Key? key, required this.text, required this.onTap, required this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 14, color: Colors.black),
            ),
          ),
          const Spacer(),
          Stack(
            children: [
              Container(
                width: 200,
                height: 134,
                decoration:const  BoxDecoration(
                  color: AppColor.silver,

                ) ,
                 child: Image.network(
                   "${AppImages.imageUrl}/$urlImage",

                   fit: BoxFit.fill,
                 ),
              ),
              Positioned(
                top:10,
                left: 10,
                child: InkWell(
                  onTap: onTap,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child:  Icon(Icons.delete,
                    color: AppColor.primaryColor,
                    size: 25,),
                  ),
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}
