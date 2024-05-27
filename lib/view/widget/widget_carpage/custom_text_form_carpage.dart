// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rental_ease/core/class/app_color.dart';

class CustomTextFormCarPage extends StatelessWidget {
  final TextEditingController mycontroller;
  final String? Function(String?) myvalidator;
  final bool isnumber;
  final Widget? label;
  final int maxline;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final FocusNode? focusNode;
  const CustomTextFormCarPage(
      {super.key,
      required this.mycontroller,
      required this.myvalidator,
      required this.isnumber,
      this.label,
      required this.maxline,
      this.onTap,
      this.onEditingComplete,
      this.onChanged,
      this.onFieldSubmitted,
      this.onSaved,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
      ),
      child: TextFormField(
        focusNode: focusNode,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        controller: mycontroller,
        validator: myvalidator,
        keyboardType: isnumber == true
            ? TextInputType.number
            : isnumber == false
                ? TextInputType.emailAddress
                : TextInputType.multiline,
        maxLines: maxline,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        style: const TextStyle(color: AppColor.orange),
        cursorColor: AppColor.orange,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 8),
          label: label,
          labelStyle: const TextStyle(color: AppColor.orange),
          //prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.blue, width: 2),
            // borderRadius: BorderRadius.circular(150),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.blue, width: 2),
            // borderRadius: BorderRadius.circular(150),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.red2, width: 2),
            //  borderRadius: BorderRadius.circular(150),
          ),
        ),
      ),
    );
  }
}
