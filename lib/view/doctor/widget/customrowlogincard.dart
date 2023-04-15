import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/constant/colors.dart';

class CustomRowLoginCard extends StatelessWidget {
  final String text;

  final TextEditingController myController;
  final bool? isIcon;

  final IconData? iconData;
  final void Function()? onTap;

  const CustomRowLoginCard(
      {Key? key,
      required this.text,
      required this.myController,
      this.isIcon,
      this.iconData,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
      child: Row(
        children: [
          Container(
            width: 13,
            height: 13,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColor.secondaryColor),
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
            width: 193,
           // height: 40,
            child: TextFormField(
              validator: (String? value) => (value == null || value.isEmpty)
                  ? 'This Field is required'.tr
                  : null,
              controller: myController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: AppColor.black,
                      width: 1.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(color: AppColor.black, width: 1)),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: AppColor.black),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: text,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      color: AppColor.hintText,
                      fontWeight: FontWeight.normal),
                  suffixIcon: isIcon == true
                      ? InkWell(
                          onTap: onTap,
                          child: Icon(
                            iconData,
                            color: AppColor.black,
                          ),
                        )
                      : null),
            ),
          ),
        ],
      ),
    );
  }
}
