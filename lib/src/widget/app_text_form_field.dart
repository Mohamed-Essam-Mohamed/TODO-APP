// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_app/src/utils/app_colors.dart';
import 'package:todo_app/src/utils/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  String hintText;
  Size siz;
  AppTextFormField(
      {required this.validator,
      required this.onChanged,
      required this.siz,
      required this.hintText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      minLines: 1,
      style: AppTextStyle.textStyle16,
      keyboardType: TextInputType.streetAddress,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: AppColors.kBackgroundTextfield,
        filled: true,
        hintText: hintText,
        hintStyle: AppTextStyle.textStyle16,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(siz.height * .01),
          borderSide: const BorderSide(
            color: AppColors.kSecondary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(siz.height * .01),
          borderSide: const BorderSide(
            color: AppColors.color1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(siz.height * .01),
          borderSide: const BorderSide(
            color: AppColors.kSecondary,
          ),
        ),
      ),
    );
  }
}
