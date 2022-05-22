import 'package:flutter/material.dart';
import 'package:techtest/src/config/colors/app_colors.dart';

class LoadingLienarWidget extends StatelessWidget {
  const LoadingLienarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 4,
      ),
      child: LinearProgressIndicator(
        color: AppColors.primaryColor,
        backgroundColor: AppColors.defaultBorderColor,
      ),
    );
  }
}
