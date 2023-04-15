import 'package:flutter/material.dart';

import '../../../class/constant/colors.dart';

class CustomRowEditSetting extends StatelessWidget {
  final String hintText;
  final TextEditingController myController;
  final bool? obscureText;
  final IconData? iconData;
  final String text;
  final bool? isNumber;
  final bool? isIcon;
  final void Function()? onTap;

  const CustomRowEditSetting(
      {Key? key,
      required this.hintText,
      required this.myController,
      this.obscureText,
      required this.text,
      this.isNumber,
      this.onTap, this.iconData, this.isIcon, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25),
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
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 220,
            height: 40,
            child: TextFormField(
              controller: myController,
              keyboardType:
                  isNumber == true ? TextInputType.number : TextInputType.text,
              obscureText:
                  obscureText == null || obscureText == false ? false : true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: AppColor.black,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: AppColor.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                 hintText: hintText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: const TextStyle(
                    fontSize: 12,
                    color: AppColor.hintText,
                    fontWeight: FontWeight.normal),
                  suffixIcon: isIcon == true ?InkWell(
                    onTap: onTap,
                    child: Icon(
                      iconData,
                      color: AppColor.black,
                    ),
                  ):
                  null


                //errorText: "Error",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
