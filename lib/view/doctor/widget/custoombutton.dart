import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../class/constant/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const CustomButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        width: 297,
        height: 45,
        decoration: BoxDecoration(
            color: AppColor.secondaryColor,
            borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: Text(
              text,
              style:
              const TextStyle(fontSize: 18, color: AppColor.black,
                  fontWeight: FontWeight.bold
              )
          ),
        ),
      ),
    );
  }
}


class CustomButtonShimmer extends StatelessWidget {
  const CustomButtonShimmer({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.secondaryColor,
      highlightColor: Colors.white,
      child: Container(
        width: 297,
        height: 45,
        decoration: BoxDecoration(
            color: AppColor.secondaryColor,
            borderRadius: BorderRadius.circular(5)
        ),
      ),
    );
  }
}

