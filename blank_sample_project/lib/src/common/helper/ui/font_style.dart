import 'package:blank_sample_project/src/common/common.dart';
import 'package:flutter/material.dart';

class UIFontStyle {
  static const bolder = FontWeight.w900;
  static const bold = FontWeight.w700;
  static const regular = FontWeight.w400;
  static const light = FontWeight.w300;
  static const lighter = FontWeight.w100;

  static h1Bolder({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.0,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 96,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h1Bold({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.0,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 96,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h1Regular({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.0,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 96,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h1Thin({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.0,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 96,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h2Bolder({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 64,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h2Bold({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 64,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h2Regular({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 64,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h2Thin({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 64,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h3Bolder({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 48,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h3Bold({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 48,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h3Regular({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 48,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h3Thin({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 48,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h4Bolder({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -0.5,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 32,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h4Bold({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -0.5,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 32,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h4Regular({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -0.5,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 32,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h4Thin({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -0.5,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 32,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h5Bolder({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -0.25,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 24,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h5Bold({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -0.25,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 24,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h5Regular({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.25,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 24,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h5Thin({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -0.25,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 24,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h6Bolder({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.0,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h6Bold({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.0,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h6Regular({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = -0.0,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h6Thin({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.0,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h7Bold({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.2,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h7Regular({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.25,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h7Thin({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.2,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h8Bolder({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h8Bold({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h8Regular({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h8Thin({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h9Bolder({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 10,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h9Bold({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 10,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h9Regular({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 10,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static h9Thin({
    color,
    String fontFamily = 'Lato',
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 10,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? UIColors.black,
      );

  static custom({
    color,
    String fontFamily = 'Lato',
    double fontSize = 8,
    double latterSpacing = 0.3,
    double? height,
    FontWeight fontWeight = regular,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: latterSpacing,
        height: height,
        color: color ?? UIColors.black,
        decoration: decoration,
      );
}
