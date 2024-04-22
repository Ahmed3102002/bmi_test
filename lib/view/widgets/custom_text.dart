import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.color,
      this.fontSize = 22,
      this.textAlign = TextAlign.center,
      this.textDecoration = TextDecoration.none});
  final String text;
  final Color? color;
  final double fontSize;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  @override
  Widget build(BuildContext context) {
    final Color defaultColor = Theme.of(context).cardColor;
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.pridi(
        color: color ?? defaultColor,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        decoration: textDecoration,
        decorationColor: color,
      ),
    );
  }
}
