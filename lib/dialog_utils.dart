import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/utils/app_colors.dart';
import 'package:todo_app/src/utils/app_text_style.dart';

void showLoading(BuildContext context, String message,
    {bool isCanceled = false}) {
  showDialog(
      barrierDismissible: isCanceled,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.kPrimary,
          content: Row(
            children: [
              CircularProgressIndicator(
                color: AppColors.kSecondary,
              ),
              SizedBox(
                width: 10.w,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: AppTextStyle.textStyle16,
                ),
              )
            ],
          ),
        );
      });
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showSnackBar(
    {required BuildContext context,
    required String message,
    required Icon icon,
    Color color = AppColors.color2}) {
  final snackBar = SnackBar(
    elevation: 0,
    content: Row(
      children: [
        Text(
          message,
          style: AppTextStyle.textStyle16,
        ),
        Spacer(),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.color2,
          ),
          child: icon,
        ),
      ],
    ),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(30),
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

void showMessage(
  BuildContext context,
  String message,
  String posActionText,
  Function posAction, {
  String? negActionText = null,
  Function? negAction = null,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.kPrimary,
        content: Text(
          message,
          style: AppTextStyle.textStyle16,
        ),
        actions: [
          TextButton(
              onPressed: () {
                posAction(context);
              },
              child: Text(posActionText)),
        ],
      );
    },
  );
}
