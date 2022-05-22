import 'package:flutter/material.dart';
import 'package:techtest/src/config/colors/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  void _doBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => _doBack(context),
            child: const Icon(
              Icons.chevron_left,
              size: 28,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
