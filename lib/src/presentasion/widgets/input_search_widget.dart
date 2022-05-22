import 'package:flutter/material.dart';
import 'package:techtest/src/config/colors/app_colors.dart';
import 'package:techtest/src/config/text_style/app_text_style.dart';

class InputSearchWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final double iconSize;
  final Function(String)? onChanged;

  const InputSearchWidget({
    Key? key,
    required this.hintText,
    this.controller,
    this.iconSize = 22,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: AppTextStyle.headline4.copyWith(
        color: AppColors.primaryColor,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.defaultTextColor,
            width: 0.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.defaultBorderColor,
            width: 1,
          ),
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.headline4.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor,
        ),
        suffixIcon: Icon(
          Icons.search,
          color: AppColors.defaultTextColor,
          size: iconSize,
        ),
      ),
    );
  }
}
