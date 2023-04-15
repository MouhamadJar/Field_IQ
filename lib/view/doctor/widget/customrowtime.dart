import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../class/constant/colors.dart';

class CustomRowTime extends StatelessWidget {
  final String hintText;
  final TextEditingController myController;
  final IconData? iconData;

  final String text;
  final bool? isNumber;

  final Color? iconColor;
  final void Function()? onTap;


  const CustomRowTime(
      {Key? key,
        required this.hintText,
        required this.myController,
        this.iconData,

        required this.text,
        this.isNumber,
        this.onTap,  this.iconColor,  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:  Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 228,
           // height: 40,
            child: TextFormField(
              validator: (String? value) =>
              (value == null || value.isEmpty) ? 'This Field is required'.tr : null,
              textInputAction: TextInputAction.next,
              controller: myController,
              keyboardType:
              isNumber == true ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                  const  EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: hintText,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      color: AppColor.hintText,
                      fontWeight: FontWeight.normal),
                  suffixIcon: InkWell(
                    onTap: onTap,
                    child: Icon(
                      iconData,
                      color: iconColor,
                    ),
                  )


                //errorText: "Error",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
