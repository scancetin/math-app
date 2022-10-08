import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_quiz_arch/constants/constants.dart';

class NumberWidget extends StatelessWidget {
  final String textValue;
  final double fontSize;
  const NumberWidget({Key? key, required this.textValue, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(textStyle: TextStyle(color: Constants.TEXT_COLOR, fontSize: fontSize)),
    );
  }
}
