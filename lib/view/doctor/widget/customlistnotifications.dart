
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/constant/colors.dart';

class CustomListNotifications extends StatelessWidget {
  const CustomListNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, i) =>const  SizedBox(
            height: 10,
          ),
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, i) {
            return const NotificationList();
          }),
    );
  }
}

class NotificationList extends StatelessWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow:  [
            BoxShadow(
                color: AppColor.hintText,
                blurRadius: 5.5,
                offset: Offset(0, 2)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                padding:  const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'New notification: a new order'.tr,

                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

