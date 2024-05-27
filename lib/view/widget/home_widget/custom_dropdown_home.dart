// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:rental_ease/core/class/app_color.dart';

class CustomDropDownHome extends StatelessWidget {
  final List item;
  final Object? value;
  final void Function(Object?)? onChanged;
  final String hint;
  const CustomDropDownHome(
      {super.key,
      required this.item,
      this.value,
      this.onChanged,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      decoration:
          BoxDecoration(border: Border.all(color: AppColor.blue, width: 2)),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        padding: EdgeInsets.only(left: 15, right: 15),
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          size: 24,
          color: AppColor.orange,
        ),
        //  underline: Container(),
        dropdownColor: AppColor.blueshfaf,
        menuMaxHeight: 350,
        hint: Text(
          hint,

          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 15, color: AppColor.orange),
          // textAlign: TextAlign.center,
        ),
        style: Theme.of(context).textTheme.bodySmall,
        items: item
            .map((e) => DropdownMenuItem(
                  child: Container(
                    //alignment: Alignment.center,
                    child: Text(
                      e,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15, color: AppColor.orange),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                  value: e,
                ))
            .toList(),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
