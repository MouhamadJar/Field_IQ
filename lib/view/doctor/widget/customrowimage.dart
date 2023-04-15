import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../class/constant/colors.dart';

class CustomRowImage extends StatelessWidget {
  final String text;
  final Function() onTap;
  final File? image;
  final String imagePath;

  const CustomRowImage(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.image,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          const Spacer(),
          image == null
              ? InkWell(
                  onTap: () {
                    onTap();
                  },
                  child: Container(
                      width: 228,
                      height: 134,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColor.hintText)),
                      child: const Icon(
                        Icons.add_a_photo,
                        color: AppColor.primaryColor,
                        size: 32,
                      )),
                )
              : SizedBox(
                  width: 228,
                  height: 134,
                  child: Image.file(
                    File(imagePath),
                  ))
        ],
      ),
    );
  }
}
