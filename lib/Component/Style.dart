import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Style {
  ///Default colors
  static const Color colorTransparent = Color(0x00000000);
  // static const Color colorBlue = Color(0xFF1E88E5);
  static const Color colorBlue = Color(0xFF1E88E5);
  static const Color colorRed = Color(0xFF00B8D4);
  static const Color colorYellow = Color(0xFFFAD70F);
  static const Color colorGreen = Color(0xFF23BEA0);
  static const Color colorTeal = Color(0xFF26A69A);
  static const Color colorGrey = Color(0xFF90A4AE);
  static const Color colorOrange = Color(0xFFFFE082);
  static const Color colorBlack = Color(0xFF444444);

  ///Default font sizes
  static const double fontSizeHeader1 = 30;
  static const double fontSizeHeader2 = 24;
  static const double fontSizeHeader3 = 20;
  static const double fontSizeParagraph = 16;
  static const double fontSizeSubtitle = 12;
  static const double fontSizeMini = 10;

  ///Default font family
  static const String fontFamilyMontserrat = "Montserrat";

  //size/

  static double l(context) {
    return MediaQuery.of(context).size.width;
  }

  static double p(context) {
    return MediaQuery.of(context).size.height;
  }

  static BorderRadiusGeometry rad = BorderRadius.all(Radius.circular(15.0));
  static List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
    ),
  ];

  ///Text styles
  ///Header1
  static TextStyle textStyleHeader1(
      {bool bold = false, fontColor = colorBlack}) {
    return TextStyle(
        fontSize: fontSizeHeader1,
        fontFamily: fontFamilyMontserrat,
        color: fontColor,
        fontWeight: (() {
          if (bold) {
            return FontWeight.bold;
          } else {
            return FontWeight.normal;
          }
        }()));
  }

  ///Header2
  static TextStyle textStyleHeader2(
      {bool bold = false, fontColor = colorBlack}) {
    return TextStyle(
        fontSize: fontSizeHeader2,
        fontFamily: fontFamilyMontserrat,
        color: fontColor,
        fontWeight: (() {
          if (bold) {
            return FontWeight.bold;
          } else {
            return FontWeight.normal;
          }
        }()));
  }

  ///Header3
  static TextStyle textStyleHeader3(
      {bool bold = false, Color fontColor = colorBlack}) {
    return TextStyle(
        fontSize: fontSizeHeader3,
        fontFamily: fontFamilyMontserrat,
        color: fontColor,
        fontWeight: (() {
          if (bold) {
            return FontWeight.bold;
          } else {
            return FontWeight.normal;
          }
        }()));
  }

  ///Paragraph
  static TextStyle textStyleParagraph(
      {bool bold = false, Color fontColor = colorBlack}) {
    return TextStyle(
        fontSize: fontSizeParagraph,
        fontFamily: fontFamilyMontserrat,
        color: fontColor,
        fontWeight: (() {
          if (bold) {
            return FontWeight.bold;
          } else {
            return FontWeight.normal;
          }
        }()));
  }

  ///Subtitle
  static TextStyle textStyleSubtitle(
      {bool bold = false, Color fontColor = colorBlack}) {
    return TextStyle(
        fontSize: fontSizeSubtitle,
        fontFamily: fontFamilyMontserrat,
        color: fontColor,
        fontWeight: (() {
          if (bold) {
            return FontWeight.bold;
          } else {
            return FontWeight.normal;
          }
        }()));
  }

  ///Mini
  static TextStyle textStyleMini(
      {bool bold = false, Color fontColor = colorBlack}) {
    return TextStyle(
        fontSize: fontSizeMini,
        fontFamily: fontFamilyMontserrat,
        color: fontColor,
        fontWeight: (() {
          if (bold) {
            return FontWeight.bold;
          } else {
            return FontWeight.normal;
          }
        }()));
  }
}
