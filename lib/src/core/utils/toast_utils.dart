import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:techtest/src/config/colors/app_colors.dart';
import 'package:techtest/src/config/text_style/app_text_style.dart';

class Toast {
  static show({
    required String message,
    required ToastType toastType,
  }) {
    var _message = "";
    try {
      var _listMessage = jsonDecode(message);
      if (_listMessage is List) {
        for (var _i = 0; _i < _listMessage.length; _i++) {
          if (_i == 0) {
            _message = _listMessage[_i];
          } else {
            _message += '\n${_listMessage[_i]}';
          }
        }
      } else {
        _message = message;
      }
    } catch (e) {
      _message = message;
    }

    _generateColor() {
      switch (toastType) {
        case ToastType.error:
          return AppColors.dangerColor.withOpacity(0.8);
        case ToastType.warning:
          return AppColors.warningColor.withOpacity(0.8);
        case ToastType.success:
          return AppColors.successColor.withOpacity(0.8);
        default:
          return AppColors.infoColor.withOpacity(0.8);
      }
    }

    showToast(
      _message,
      position: ToastPosition.center,
      backgroundColor: _generateColor(),
      radius: 8,
      textStyle: AppTextStyle.textToast,
      textPadding: const EdgeInsets.all(8),
    );
  }
}

enum ToastType {
  success,
  error,
  info,
  warning,
}
