// Widget을 return 하는 method
import 'package:flutter/material.dart';

Widget inputformField({
  required FocusNode focusNode,
  required Function(String) setValue,
  // String 값도 null / validator 값도 null -> 선택사항 바꾸기 위해서
  required Function(String?) validator,
  String? hintText,
  String? helperText,
}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextFormField(
      focusNode: focusNode,
      // null 이면 쓰지마 ! 이거 붙임
      validator: (value) => validator(value),
      onChanged: (value) => setValue(value),
      decoration: InputDecoration(
        hintText: hintText,
        helperText: helperText,
        helperStyle: const TextStyle(
          color: Colors.blue,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    ),
  );
}
