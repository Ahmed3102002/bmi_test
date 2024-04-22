import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.keyboardType,
      this.obscureText = false,
      required this.hintText,
      required this.prefixIconData,
      this.suffixIconButton,
      this.validator,
      this.onChanged,
      this.onFieldSubmitted,
      this.nextFocusNode,
      this.mainColor = Colors.blue});
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final IconData prefixIconData;
  final IconButton? suffixIconButton;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Color mainColor;
  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).scaffoldBackgroundColor;
    return TextFormField(
      cursorColor: mainColor,
      style: GoogleFonts.pridi(
        color: mainColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted ??
          (value) {
            nextFocusNode == null
                ? FocusScope.of(context).requestFocus()
                : FocusScope.of(context).requestFocus(nextFocusNode);
          },
      decoration: InputDecoration(
        filled: true,
        labelStyle: GoogleFonts.pridi(
          color: color,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.pridi(
          color: mainColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        hintMaxLines: 1,
        prefixIcon: Icon(
          prefixIconData,
          color: mainColor,
        ),
        suffixIcon: suffixIconButton,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
    );
  }
}
