import 'package:flutter/material.dart';


class CustomContainer extends StatelessWidget {
  final Color backGround;
  final IconData iconData ;
  final String text;
  final Color color;
  final Function() onTap;
  const CustomContainer({Key? key, required this.backGround, required this.text, required this.color, required this.iconData, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backGround
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(iconData,
              color: color,
              size: 40,
            ),
            Padding(
              padding:  const EdgeInsets.only(top: 12.0),
              child:  Text(text,
                style: TextStyle(
                    color: color,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
            )
          ],
        ),
      ),
    );
  }
}
