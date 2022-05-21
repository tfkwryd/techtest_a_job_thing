import 'package:flutter/material.dart';
import 'package:techtest/src/config/colors/app_colors.dart';

class FrameWidget extends StatelessWidget {
  final Widget child;
  final FrameType frameType;
  const FrameWidget({
    Key? key,
    required this.child,
    this.frameType = FrameType.solidWhite,
  }) : super(key: key);

  Color _bgColor({required FrameType type}) {
    switch (type) {
      case FrameType.solidWhite:
        return AppColors.solidWhiteColor;
      case FrameType.primary:
        return AppColors.primaryColor;
      default:
        return AppColors.solidWhiteColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _bgColor(type: frameType),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: child,
    );
  }
}

enum FrameType {
  solidWhite,
  primary,
}
