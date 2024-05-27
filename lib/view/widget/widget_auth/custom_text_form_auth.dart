// ignore_for_file: avoid_unnecessary_containers

import 'package:rental_ease/core/class/app_color.dart';
import 'package:flutter/material.dart';

class TextFormLogin extends StatelessWidget {
  final String hinttext;
  final Widget? prefixIcon;
  final TextEditingController? mycontroller;
  final String? Function(String?)? myvalidator;
  final bool? isnumber;
  final bool? obsecure;
  const TextFormLogin(
      {super.key,
      required this.hinttext,
      this.prefixIcon,
      this.mycontroller,
      this.myvalidator,
      this.isnumber,
      this.obsecure});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 55,
      // padding: EdgeInsets.only(top: 8, bottom: 15),
      child: TextFormField(
        controller: mycontroller,
        validator: myvalidator,
        obscureText: obsecure == true ? true : false,
        obscuringCharacter: '*',
        keyboardType: isnumber == true
            ? TextInputType.number
            : isnumber == false
                ? TextInputType.emailAddress
                : TextInputType.multiline,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColor.orange, fontSize: 15, fontWeight: FontWeight.bold),
        cursorColor: AppColor.orange,
        decoration: InputDecoration(
          label: Text(hinttext),
          labelStyle: const TextStyle(color: AppColor.orange),
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.blue, width: 2),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.blue, width: 2),
            borderRadius: BorderRadius.circular(25),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.red2, width: 2),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
