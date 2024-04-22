import 'package:bmi/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AuthQuestion extends StatelessWidget {
  const AuthQuestion({
    super.key,
    required this.question,
    required this.page,
    this.color = Colors.white,
    this.fontSize = 25,
    required this.pageTitle,
  });
  final String question;
  final String page;
  final String pageTitle;
  final Color color;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: question,
          color: color,
          fontSize: fontSize,
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, page),
          child: CustomText(
            text: pageTitle,
            color: color,
            fontSize: fontSize,
            textDecoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
