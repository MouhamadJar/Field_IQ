import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/constant/colors.dart';
import '../screen/listwaitingcompanydoctor.dart';

class CustomWaitingList extends StatelessWidget {
  const CustomWaitingList({Key? key}) : super(key: key);

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
            return const WaitingList();
          }),
    );
  }
}

class WaitingList extends StatelessWidget {
  const WaitingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> const ListWaitingCompanyDoctor());
      },
      child: Padding(
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
              children: const [
                  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Company Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                 Spacer(),
                 Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

