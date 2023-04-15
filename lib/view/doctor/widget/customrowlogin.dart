import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/constant/colors.dart';

class CustomRowLogin extends StatelessWidget {
  final String hintText;
  final TextEditingController myController;
  final IconData? iconData;
  final bool obscureText;
  final String text;
  final bool? isNumber;
  final bool? isIcon;
  final void Function()? onTap;
  final FocusNode? passwordFocusNode;
  final bool isUserName;

  const CustomRowLogin(
      {Key? key,
      required this.hintText,
      required this.myController,
      this.iconData,
      this.obscureText = false,
      required this.text,
      this.isIcon,
      this.isNumber,
      this.onTap,
      this.passwordFocusNode,
      this.isUserName = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
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
              focusNode: obscureText ? passwordFocusNode : null,
              controller: myController,
              onFieldSubmitted: isUserName
                  ? (v) {
                      if (isUserName) {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      }
                    }
                  : null,
              keyboardType:
                  isNumber == true ? TextInputType.number : TextInputType.text,
              obscureText:
                  obscureText == null || obscureText == false ? false : true,
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:  const BorderSide(
                      color:  AppColor.black,
                      width: 1
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: AppColor.black),
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
