import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _AppColors {
  final bool _darkTheme;
  _AppColors(this._darkTheme);
  Color whiteColor = const Color(0xFFE5E5E5);
  Color darkColor = const Color(0xFF171819);
  Color textColorWhite = const Color(0xffffffff);
  Color textColorBlack = const Color(0xff0000000);
  Color darkGrey = const Color(0xffA1A6AB);
  Color lightGrey = const Color(0xffD5D9DE);
  Color snowGrey = const Color(0xFFF0F2F5);
  Color greyNight = const Color(0xffE1E9F0);
  Color greyNight500 = const Color(0xff6B7075);
  Color greyNight600 = const Color(0xff404952);
  Color greyNight800 = const Color(0xff1C2024);
  Color greyDay100 = const Color(0xff171819);
  Color greyDay800 = const Color(0xffF7FAFC);
  Color greyDay600 = const Color(0xffD5D9DE);
  Color green = const Color(0xff2B954C); // Green color for buttons
  Color greenAccent =
      const Color(0x336de793); // Green border highlight for buttons
  Color dotIndicator = const Color(0xff404952);
  Color navyBlue = const Color(0xff3f37c9);
  Color enableButtonColor = const Color(0xffFF6D42);
  Color bottomBg = const Color(0xffFAFBFF);
  Color borderColor = const Color(0xffD8D8D8);

  Color get formFieldBorder =>
      _darkTheme ? greyNight.withOpacity(0.1) : darkColor.withOpacity(0.1);
  Color get formFieldFill => _darkTheme ? darkColor : whiteColor;

  Color get buttonDisabled => _darkTheme ? const Color(0xff1c2024) : lightGrey;
  Color get textDisabled => _darkTheme ? const Color(0xff6b7075) : darkGrey;

  Color get cardbg => _darkTheme ? greyNight800 : greyDay800;

  Color get modalBg => _darkTheme
      ? const Color(0x00e1e9f0).withOpacity(0.1)
      : const Color(0x00f0f2f5).withOpacity(0.9);
  Color get divider =>
      _darkTheme ? const Color(0x0DE1E9F0) : const Color(0xFFD5D9DE);
}

class _AppTextStyles {
  final bool _darkTheme;

  _AppTextStyles(this._darkTheme);

  TextStyle get tiniest {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Quicksand',
        fontSize: 13,
        color: _darkTheme
            ? _AppColors(_darkTheme).textColorWhite
            : _AppColors(_darkTheme).textColorBlack);
  }

  TextStyle get tiny {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Quicksand',
        fontSize: 15,
        color: _darkTheme
            ? _AppColors(_darkTheme).textColorWhite
            : _AppColors(_darkTheme).textColorBlack);
  }

  TextStyle get small {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Quicksand',
        fontSize: 17,
        color: _darkTheme
            ? _AppColors(_darkTheme).textColorWhite
            : _AppColors(_darkTheme).textColorBlack);
  }

  TextStyle get medium {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Quicksand',
        fontSize: 20,
        color: _darkTheme
            ? _AppColors(_darkTheme).textColorWhite
            : _AppColors(_darkTheme).textColorBlack);
  }

  TextStyle get large {
    return TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Quicksand',
        fontSize: 25,
        color: _darkTheme
            ? AppStyle.colors.textColorWhite
            : AppStyle.colors.textColorBlack);
  }

  TextStyle get xlarge {
    return TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Quicksand',
        fontSize: 34,
        color: _darkTheme
            ? AppStyle.colors.textColorWhite
            : AppStyle.colors.textColorBlack);
  }

  TextStyle get tinyDisable {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Quicksand',
        fontSize: 13,
        color: _darkTheme
            ? AppStyle.colors.greyNight500
            : AppStyle.colors.greyDay100);
  }

  TextStyle get smallDisable {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Quicksand',
        fontSize: 15,
        color: _darkTheme
            ? AppStyle.colors.greyNight500
            : AppStyle.colors.greyDay100);
  }

  TextStyle get mediumDisable {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Quicksand',
        fontSize: 20,
        color: _darkTheme
            ? AppStyle.colors.greyNight500
            : AppStyle.colors.greyDay100);
  }

  TextStyle get actionBar {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Quicksand',
        fontSize: 20,
        color: _darkTheme
            ? AppStyle.colors.textColorWhite
            : AppStyle.colors.textColorBlack);
  }

  TextStyle get mediumButton {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Quicksand',
        fontSize: 16,
        color: AppStyle.colors.textColorWhite);
  }

  TextStyle get smallGreen {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Quicksand',
        fontSize: 15,
        color: AppStyle.colors.green);
  }

  TextStyle get mediumGreen {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Quicksand',
        fontSize: 20,
        color: AppStyle.colors.green);
  }
}

class AppStyle {
  static bool _isDarkTheme = false;

  static _AppColors get colors => _AppColors(_isDarkTheme);
  static _AppTextStyles get text => _AppTextStyles(_isDarkTheme);

  static get buttonShapeEnabled => RoundedRectangleBorder(
      side: BorderSide(color: colors.enableButtonColor, width: 1),
      borderRadius: BorderRadius.circular(2));

  static get buttonShapeDisabled => RoundedRectangleBorder(
      side: BorderSide(color: colors.greyNight600.withOpacity(0.25), width: 1),
      borderRadius: BorderRadius.circular(2));

  static get buttonShadow => _isDarkTheme
      ? BoxDecoration(
          borderRadius: BorderRadius.circular(22.5), boxShadow: const [])
      : null;

  /// Text field borders for focused and default
  ///
  static final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),
      borderSide: BorderSide(color: colors.formFieldBorder));

  static get focusedBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),
      borderSide: BorderSide(color: colors.formFieldBorder));

  static List<BoxShadow> focusedShadow = [
    BoxShadow(color: colors.whiteColor.withOpacity(0.2), spreadRadius: 3)
  ];

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    _isDarkTheme = isDarkTheme;
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        color: Colors.transparent,
      ),
      primarySwatch: Colors.grey,
    );
  }
}
