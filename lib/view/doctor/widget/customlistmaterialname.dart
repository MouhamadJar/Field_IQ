import 'package:flutter/cupertino.dart';

class CustomListMaterialName extends StatelessWidget {
  const CustomListMaterialName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, i) =>const  SizedBox(
            height: 10,
          ),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, i) {
            return const MaterialsName();
          }),
    );
  }
}

class MaterialsName extends StatelessWidget {
  const MaterialsName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Material 1'
    );
  }
}

