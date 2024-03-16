// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/utils/app_colors.dart';

class PasswoedTextFormField extends StatefulWidget {
  final String hintText;
  String? Function(String?)? validator;
  TextEditingController? controller;
  PasswoedTextFormField({
    Key? key,
    required this.hintText,
    required this.validator,
    required this.controller,
  }) : super(key: key);
  @override
  _PasswoedTextFormFieldState createState() => _PasswoedTextFormFieldState();
}

class _PasswoedTextFormFieldState extends State<PasswoedTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: _obscureText,
        controller: widget.controller,
        validator: widget.validator,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.kSecondary,
        ),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.sp, vertical: 15.sp),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
              size: 24.sp,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.white60,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(
              color: Color(0xff535353),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(
              color: Color(0xff535353),
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(
              color: AppColors.color1,
              width: 1,
            ),
          ),
        ));
  }
}
